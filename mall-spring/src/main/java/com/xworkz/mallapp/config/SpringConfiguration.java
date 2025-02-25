package com.xworkz.mallapp.config;

import com.xworkz.mallapp.dao.MallDao;
import com.xworkz.mallapp.dao.MallDaoImpl;
import com.xworkz.mallapp.service.MallService;
import com.xworkz.mallapp.service.MallServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "com.xworkz.mallapp")
public class SpringConfiguration {

    public SpringConfiguration() {}

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        bean.setPackagesToScan("com.xworkz.mallapp.dto");
        bean.setDataSource(getDataSources());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        bean.setJpaProperties(properties());
        return bean;
    }

    @Bean
    public Properties properties() {
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        return properties;
    }

    @Bean
    public DataSource getDataSources() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/mall");
        dataSource.setUsername("root");
        dataSource.setPassword("Bharath@7579.");
        return dataSource;
    }
}
