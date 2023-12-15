package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.Dish;
import cn.cc.ecampus.mapper.DishMapper;
import cn.cc.ecampus.service.IDishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements IDishService {
}
