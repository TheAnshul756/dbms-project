// package com.school.work;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.authentication.AuthenticationManager;
// import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
// import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

// @Configuration
// @EnableWebSecurity
// public class SecurityConfig extends WebSecurityConfigurerAdapter {
//     @Autowired
//     private UserDetailsService userDetailsService;

//     @Bean
//     public BCryptPasswordEncoder bCryptPasswordEncoder() {
//         return new BCryptPasswordEncoder();
//     }

//     @Override
//     protected void configure(HttpSecurity http) throws Exception {
//         http
//             .csrf().disable()
//             .authorizeRequests()
//                 .antMatchers("/","/error**").permitAll()
//                 .regexMatchers("/students/[0-9]+/edit")
//                 .antMatchers("/employees/password/change**","/employees/details").hasAnyAuthority("Teacher","Manager")
//                 .antMatchers("/employees/new**","/students/new**","/feedbacks/***","/categories**","/employees/**","/services**","/stores/new**").hasAuthority("Manager")
//                 .anyRequest().authenticated()
//                 .and()
//             .formLogin()
//                 .permitAll()
//                 .and()
//             .logout()
//                 .permitAll();
//     }

//     @Bean
//     public AuthenticationManager customAuthenticationManager() throws Exception {
//         return authenticationManager();
//     }

//     @Autowired
//     public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//         auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
//     }
// }
