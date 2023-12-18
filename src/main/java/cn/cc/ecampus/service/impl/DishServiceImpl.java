package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.Dish;
import cn.cc.ecampus.mapper.DishMapper;
import cn.cc.ecampus.service.IDishService;
import cn.cc.ecampus.utils.SystemConstants;
import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

import static cn.cc.ecampus.utils.RedisConstants.*;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements IDishService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Result queryByShopId(Integer current, Long shopId) {
        List<Dish> list = queryWithMutex(current, shopId);
        if (list == null || list.isEmpty()) {
            return Result.fail("菜品不存在！");
        }
        return Result.ok(list);
    }

    private List<Dish> queryWithMutex(Integer current, Long shopId) {
        String key = CACHE_DISH_KEY + shopId;
        // 1、从redis中查询商铺缓存
        String shopJson = stringRedisTemplate.opsForValue().get(key);
        // 2、判断是否存在
        if (StrUtil.isNotBlank(shopJson)) {
            // 存在,直接返回
            return JSONUtil.toList(shopJson, Dish.class);
        }
        // 判断命中的值是否是空值
        if (shopJson != null) {
            // 返回一个错误信息
            return null;
        }
        // 4.实现缓存重构
        // 4.1 获取互斥锁
        String lockKey = LOCK_DISH_KEY + shopId;
        List<Dish> dishList = null;
        try {
            boolean isLock = tryLock(lockKey);
            // 4.2 判断否获取成功
            if (!isLock) {
                // 4.3 失败，则休眠重试
                Thread.sleep(50);
                return queryWithMutex(current, shopId);
            }
            // 4.4 成功，根据id查询数据库
            Page<Dish> page = query().eq("shop_id", shopId).page(new Page<>(current, SystemConstants.MAX_PAGE_SIZE));
            dishList = page.getRecords();
            // 5.不存在，返回错误
            if (dishList == null || dishList.isEmpty()) {
                // 将空值写入redis
                stringRedisTemplate.opsForValue().set(key, "", CACHE_NULL_TTL, TimeUnit.MINUTES);
                // 返回错误信息
                return null;
            }
            // 6.写入redis
            stringRedisTemplate.opsForValue().set(key, JSONUtil.toJsonStr(dishList), CACHE_DISH_TTL, TimeUnit.MINUTES);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            // 7.释放互斥锁
            unlock(lockKey);
        }
        return dishList;
    }

    private boolean tryLock(String key) {
        Boolean flag = stringRedisTemplate.opsForValue().setIfAbsent(key, "1", LOCK_TTL, TimeUnit.SECONDS);
        return BooleanUtil.isTrue(flag);
    }

    private void unlock(String key) {
        stringRedisTemplate.delete(key);
    }
}
