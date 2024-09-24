package com.xworkz.metro.configuration;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan("com.xworkz.metro")
@EnableWebMvc
public class SpringConfig {

    public SpringConfig() {
        System.out.println("SpringConfig object created");
    }

    @Bean
    public ViewResolver resolver(){

        InternalResourceViewResolver internalResourceViewResolver=new InternalResourceViewResolver("/",".jsp");
        return internalResourceViewResolver;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean managerFactoryBean(){

        return new LocalContainerEntityManagerFactoryBean();
    }
}
