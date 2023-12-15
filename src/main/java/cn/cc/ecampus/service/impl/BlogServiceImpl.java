package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.Blog;
import cn.cc.ecampus.mapper.BlogMapper;
import cn.cc.ecampus.service.IBlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:10
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {
}
