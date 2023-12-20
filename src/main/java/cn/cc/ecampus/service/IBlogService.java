package cn.cc.ecampus.service;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.Blog;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author superlit
 * @create 2023/12/14 10:59
 */
public interface IBlogService extends IService<Blog> {
    Result saveBlog(Blog blog);

    Result queryBlogByShopId(Long id, Integer current);
}
