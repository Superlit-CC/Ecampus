package cn.cc.ecampus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan("cn.cc.ecampus.mapper")
@SpringBootApplication
public class EcampusApplication {

    public static void main(String[] args) {
        SpringApplication.run(EcampusApplication.class, args);
    }

}
