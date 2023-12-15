package cn.cc.ecampus.config;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author superlit
 * @create 2023/12/14 13:53
 */
@Configuration
public class RedissonConfig {
    @Bean
    public RedissonClient redissonClient(){
        // 配置
        Config config = new Config();
        config.useSingleServer().setAddress("redis://192.168.234.129:6379")
                .setPassword("123321");
        // 创建RedissonClient对象
        return Redisson.create(config);
    }
}
