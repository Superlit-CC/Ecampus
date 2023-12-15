package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.ShopType;
import cn.cc.ecampus.mapper.ShopTypeMapper;
import cn.cc.ecampus.service.IShopTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class ShopTypeServiceImpl extends ServiceImpl<ShopTypeMapper, ShopType> implements IShopTypeService {
}
