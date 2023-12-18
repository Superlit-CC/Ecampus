package cn.cc.ecampus.service;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.Shop;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author superlit
 * @create 2023/12/14 11:00
 */
public interface IShopService extends IService<Shop> {
    Result queryById(Long id);

    Result update(Shop shop);

    Result deleteById(Long id);

    Result queryShopByType(Integer typeId, Integer current);
}
