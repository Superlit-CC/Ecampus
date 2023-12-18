package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.ShopType;
import cn.cc.ecampus.mapper.ShopTypeMapper;
import cn.cc.ecampus.service.IShopTypeService;
import cn.cc.ecampus.utils.RedisConstants;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class ShopTypeServiceImpl extends ServiceImpl<ShopTypeMapper, ShopType> implements IShopTypeService {
    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Result queryTypeList() {
        String key = RedisConstants.CACHE_SHOP_TYPE_KEY;
        // 1. 从redis查商铺类型缓存
        String shopTypeJson = stringRedisTemplate.opsForValue().get(key);
        // 2. 判断商铺类型是否存在
        if (StrUtil.isNotBlank(shopTypeJson)) {
            // 3. 存在则返回商铺类型信息
            List<ShopType> shopTypes = JSONUtil.toList(shopTypeJson, ShopType.class);
            return Result.ok(shopTypes);
        }
        // 4. 不存在，查询数据库
        List<ShopType> shopTypes = query().orderByAsc("sort").list();
        // 5. 不存在，返回404
        if (shopTypes.isEmpty()) {
            return Result.fail("商铺类型不存在！");
        }
        // 6. 存在，将数据写入redis
        stringRedisTemplate.opsForValue().set(key, JSONUtil.toJsonStr(shopTypes));
        // 7. 返回商铺类型信息
        return Result.ok(shopTypes);
    }
}
