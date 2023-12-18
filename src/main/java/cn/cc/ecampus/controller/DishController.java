package cn.cc.ecampus.controller;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.service.IDishService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

/**
 * @author superlit
 * @create 2023/12/14 13:36
 */
@RestController
@RequestMapping("/dish")
public class DishController {
    @Resource
    private IDishService dishService;

    /**
     * 根据Shop ID查询菜品
     * @param shopId 店铺窗口id
     * @return 菜品列表
     */
    @GetMapping("/of/shop")
    public Result queryDishByShopId(
            @RequestParam(value = "current", defaultValue = "1") Integer current,
            @RequestParam("shop-id") Long shopId) {
        return dishService.queryByShopId(current, shopId);
    }
}
