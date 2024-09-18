package cn.yunhe.travel.config;

import cn.yunhe.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //自定义表单登录页面
        http.formLogin()
                //指定登录页面
                .loginPage("/toLogin")
                //指定登录请求
                .loginProcessingUrl("/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .successForwardUrl("/main")
                .failureUrl("/toFail")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/toLogin")
                .invalidateHttpSession(true)
                .and()
                //权限配置
                .authorizeRequests()
                //放行登录页面
                .antMatchers("/toLogin").permitAll()
                //放开静态资源
                .antMatchers("/css/**","/img/**","/plugins/**").permitAll()
                //其他资源需要登录后访问
                .anyRequest().authenticated()
                .and()
                //禁用csrf
                .csrf().disable();
        //配置没有权限跳转的url
        http.exceptionHandling().accessDeniedPage("/fail");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
