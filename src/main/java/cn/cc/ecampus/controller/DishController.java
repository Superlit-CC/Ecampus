package cn.cc.ecampus.controller;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.service.IDishService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    @GetMapping("/{shop-id}")
    public Result queryDishByShopId(@PathVariable("shop-id") Long shopId) {
        // TODO 根据Shop ID查询菜品
        return Result.fail("功能尚未完成！");
    }
}
