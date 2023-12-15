package cn.cc.ecampus.dto;

import lombok.Data;

/**
 * @author superlit
 * @create 2023/12/14 14:18
 */
@Data
public class LoginFormDTO {
    private String phone;
    private String code;
    private String password;
}
