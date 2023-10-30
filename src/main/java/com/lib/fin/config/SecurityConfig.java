	package com.lib.fin.config;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.context.annotation.Bean;
	import org.springframework.context.annotation.Configuration;
	import org.springframework.security.config.annotation.web.builders.HttpSecurity;
	import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
	import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
	import org.springframework.security.web.SecurityFilterChain;
	
	import com.lib.fin.member.MemberService;
	
	@Configuration
	//Configuration : 설정파일로 등록 ***-context.xml 역할
	@EnableWebSecurity
	//EnableWebSecurity : 스프링시큐리티 활성화 및 웹 보안설정 구성, 스프링 시큐리티 사용한다는 어노테이션
	public class SecurityConfig {
	
		@Autowired
		private MemberService memberService;
		
		@Bean
		WebSecurityCustomizer webSecurityCustomizer() {
			//정적 자원들(imges, css, js 등)은 인증/인가 없이 사용해야 하므로 여기서 설정
			//ignoring()  -- Spring Security를 적용 안함
			return web -> web
					.ignoring()
					.antMatchers("/assets/css/**")
					.antMatchers("/assets/img/**")
					.antMatchers("/assets/js/**")
					.antMatchers("/assets/vendor/**")
					.antMatchers("/forms/**")
					;
		}
		
		@Bean
		SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity)throws Exception{
			  httpSecurity
	          .cors()
	          .and()
	          .csrf()
	          .disable()
	          .authorizeRequests()
	              .antMatchers("/member/join").permitAll()
	              .antMatchers("/member/postLogin").permitAll()
	              .antMatchers("/admin/*").hasRole("ADMIN")
	              .anyRequest().authenticated()
	              //나머지 모든 요청은 로그인한 사용자 가능
	              //.antMatchers("/").authenticated()
	              //로그인한 사람만 접속가능
	              //.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
	              .and()
	          .formLogin()
	          //어느 url로 들어오든 로그인페이지로 이동
	          		.loginPage("/member/login")//내장된 로그인폼을 사용하지 않고, 개발자가 만든 폼을 사용
	          		.loginProcessingUrl("/")
	          		.defaultSuccessUrl("/")
	          		.usernameParameter("emp_no")
	                .failureHandler(getFailHandler())
	          	  	.permitAll()
	                .and()
	            .logout()
	            	.logoutUrl("/member/logout")
	            	.logoutSuccessUrl("/")
	            	.permitAll()
	//                .permitAll()
	//               .and()
	//          .sessionManagement()
	//              .maximumSessions(1)
	//              .maxSessionsPreventsLogin(false)
	//              .expiredUrl("/")
	
	  ;
	
	  return httpSecurity.build();	
	
	}
		
		
		
		
		
	private SecurityFailHandler getFailHandler() {
		return new SecurityFailHandler();
	}
		
		
		
	}
