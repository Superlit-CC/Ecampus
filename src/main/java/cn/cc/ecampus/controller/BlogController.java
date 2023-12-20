package cn.cc.ecampus.controller;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.Blog;
import cn.cc.ecampus.service.IBlogService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;


/**
 * @author superlit
 * @create 2023/12/14 11:27
 */
@RestController
@RequestMapping("/blog")
public class BlogController {
    @Resource
    private IBlogService blogService;

    /**
     * 发布点评
     *
     * @param blog 点评信息
     * @return 点评id
     */
    @PostMapping
    public Result saveBlog(@RequestBody Blog blog) {
        return blogService.saveBlog(blog);
    }

    /**
     * 根据店铺id查询点评
     *
     * @param id      店铺id
     * @param current 当前页
     * @return Blog列表
     */
    @GetMapping("/of/shop")
    public Result queryBlogByShopId(
            @RequestParam("id") Long id,
            @RequestParam(value = "current", defaultValue = "1") Integer current) {
        return blogService.queryBlogByShopId(id, current);
    }
}
