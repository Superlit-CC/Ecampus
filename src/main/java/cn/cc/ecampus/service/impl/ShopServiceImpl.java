package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.Shop;
import cn.cc.ecampus.mapper.ShopMapper;
import cn.cc.ecampus.service.IShopService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class ShopServiceImpl extends ServiceImpl<ShopMapper, Shop> implements IShopService {
}
