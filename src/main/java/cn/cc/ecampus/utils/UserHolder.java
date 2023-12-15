package cn.cc.ecampus.utils;

import cn.cc.ecampus.dto.UserDTO;

/**
 * @author superlit
 * @create 2023/12/14 14:13
 */
public class UserHolder {
    private static final ThreadLocal<UserDTO> tl = new ThreadLocal<>();

    public static void saveUser(UserDTO user){
        tl.set(user);
    }

    public static UserDTO getUser(){
        return tl.get();
    }

    public static void removeUser(){
        tl.remove();
    }
}
