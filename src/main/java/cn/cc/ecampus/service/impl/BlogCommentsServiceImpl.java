package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.BlogComments;
import cn.cc.ecampus.mapper.BlogCommentsMapper;
import cn.cc.ecampus.service.IBlogCommentsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:10
 */
@Service
public class BlogCommentsServiceImpl extends ServiceImpl<BlogCommentsMapper, BlogComments> implements IBlogCommentsService {
}
