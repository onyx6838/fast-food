package com.handout;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan("com.handout")
public class FastFoodApplication {

    public static void main(String[] args) {
        SpringApplication.run(FastFoodApplication.class, args);
    }

}
