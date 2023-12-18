package cn.cc.ecampus.controller;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.service.IShopService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author superlit
 * @create 2023/12/14 11:28
 */
@RestController
@RequestMapping("/shop")
public class ShopController {
    @Resource
    public IShopService shopService;

    /**
     * 根据id查询商铺信息
     * @param id 商铺id
     * @return 商铺详情数据
     */
    @GetMapping("/{id}")
    public Result queryShopById(@PathVariable("id") Long id) {
        return shopService.queryById(id);
    }
}
