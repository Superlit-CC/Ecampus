package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.Shop;
import cn.cc.ecampus.mapper.ShopMapper;
import cn.cc.ecampus.service.IShopService;
import cn.cc.ecampus.utils.CacheClient;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

import static cn.cc.ecampus.utils.RedisConstants.*;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class ShopServiceImpl extends ServiceImpl<ShopMapper, Shop> implements IShopService {
    @Resource
    private CacheClient cacheClient;

    @Override
    public Result queryById(Long id) {
        // redis工具类实现缓存
        Shop shop = cacheClient.queryWithMutex(CACHE_SHOP_KEY, LOCK_SHOP_KEY, id, Shop.class, this::getById, CACHE_SHOP_TTL, TimeUnit.MINUTES);
        if (shop == null) {
            return Result.fail("店铺不存在！");
        }
        return Result.ok(shop);
    }
}
