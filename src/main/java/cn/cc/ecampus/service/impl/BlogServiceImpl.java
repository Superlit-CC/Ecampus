package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.dto.UserDTO;
import cn.cc.ecampus.entity.Blog;
import cn.cc.ecampus.mapper.BlogMapper;
import cn.cc.ecampus.service.IBlogService;
import cn.cc.ecampus.utils.SystemConstants;
import cn.cc.ecampus.utils.UserHolder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author superlit
 * @create 2023/12/14 11:10
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {
    @Override
    public Result saveBlog(Blog blog) {
        // 1.获取登录用户
        UserDTO user = UserHolder.getUser();
        blog.setUserId(user.getId());
        // 2.保存探店笔记
        boolean isSuccess = save(blog);
        if (!isSuccess) {
            return Result.fail("新增笔记失败!");
        }
        // 3.返回id
        return Result.ok(blog.getId());
    }

    @Override
    public Result queryBlogByShopId(Long id, Integer current) {
        // 根据用户查询
        Page<Blog> page = query()
                .eq("shop_id", id)
                .page(new Page<>(current, SystemConstants.DEFAULT_PAGE_SIZE));
        // 获取当前页数据
        List<Blog> records = page.getRecords();
        return Result.ok(records);
    }
}
