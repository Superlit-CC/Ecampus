package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.UserInfo;
import cn.cc.ecampus.mapper.UserInfoMapper;
import cn.cc.ecampus.service.IUserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:11
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements IUserInfoService {
}
