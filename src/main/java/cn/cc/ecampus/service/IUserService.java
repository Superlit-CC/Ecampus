package cn.cc.ecampus.service;

import cn.cc.ecampus.dto.LoginFormDTO;
import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author superlit
 * @create 2023/12/14 11:00
 */
public interface IUserService extends IService<User> {
    Result sendCode(String phone);

    Result login(LoginFormDTO loginForm);
}
