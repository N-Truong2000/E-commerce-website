package com.demo.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.demo.services.AccountService;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AccountService userService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors().and().csrf().disable();
		http.authorizeRequests()
		    .antMatchers("/account/**").permitAll()
		    .antMatchers("/superadmin/**").access("hasRole('ROLE_SUPERADMIN')")
		    .antMatchers("/restaurant/**").access("hasRole('ROLE_RESTAURANT') or hasRole('ROLE_ADMIN')")
		    .antMatchers("/user/**").access("hasRole('ROLE_USER') or hasRole('ROLE_RESTAURANT')  or hasRole('ROLE_ADMIN')") 
		    .and()
		    .formLogin().loginPage("/account/login")
		    .loginProcessingUrl("/account/process-login")
		    .defaultSuccessUrl("/user/index")
		    .failureUrl("/account/login?error")
		    .usernameParameter("username").passwordParameter("password")
		    .and()
		    .logout().logoutUrl("/user/logout")
		    .logoutSuccessUrl("/account/login?logout")
		    .and()
		    .exceptionHandling().accessDeniedPage("/account/accessDenied")
		    ;
	}

	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(userService);
	}
}
