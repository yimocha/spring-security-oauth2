package cn.tellsea.oauth2.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

// http://localhost:8080/oauth/authorize?client_id=client&response_type=code
@SpringBootApplication
@MapperScan(basePackages = "cn.tellsea.oauth2.server.mapper")
public class Oauth2ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(Oauth2ServerApplication.class, args);
    }
}
