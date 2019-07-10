
package com.oracle.xianshop.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import com.oracle.xianshop.model.dao.UserDAO;
import com.oracle.xianshop.model.javabean.Users;

@Controller
@RequestMapping("/user")
public class UserControl {
	
	@Autowired
	private UserDAO dao;

	@RequestMapping("/login")
	public String login(String username,String password,HttpSession  session) {
		System.out.println("user -login");
		
		//1.鑾峰彇鐢ㄦ埛鍦ㄨ〃
		System.out.println(username+"\t"+password);
		
		//2.
		Users  u=dao.login(username, password);
		
		System.out.println(u);
		
		//3.鍒ゆ柇锛屽鏋滃瓨鍦ㄥ垯璺宠浆鍒伴椤碉紝鍚﹀垯璺冲洖鍒扮櫥褰�
		if(u==null){
			System.out.println("login fail");
			return "login";
		}else{
			System.out.println("login success");
			//
			session.setAttribute("logineduser", u);
			return "index";
		}
		
	}

	@RequestMapping("/register")
	public String register(String username,String password,String nicheng,Model m) {
		System.out.println("user -register");
		//1.先获取用户在表单页面上填写的要注册的用户信息
				//2.调用dao里面的方法将这个心注册的用户资料插入到数据库表中
				/*if(dao.lname(username)!=0){
					return "register";
				}*/
				int result=dao.addUser(username, password, nicheng);
				if(result>0){
					
					return "login";
				}else{
					return "register";
				}
    }
	@RequestMapping("/loginout")
	public String loginout(HttpSession  session){
		session.setAttribute("logineduser",null );
		return "index";
		
	}
}
