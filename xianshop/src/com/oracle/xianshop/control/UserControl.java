package com.oracle.xianshop.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		//1.鑾峰彇鐢ㄦ埛鍦ㄨ〃鍗曚笂濉啓鐨勮处鎴疯祫鏂�
		System.out.println(username+"\t"+password);
		
		//2.鏌ヨ鏁版嵁搴撴槸鍚﹀瓨鍦ㄨ繖涓搴旂殑璐︽埛鍜屽瘑鐮�
		Users  u=dao.login(username, password);
		
		System.out.println(u);
		
		//3.鍒ゆ柇锛屽鏋滃瓨鍦ㄥ垯璺宠浆鍒伴椤碉紝鍚﹀垯璺冲洖鍒扮櫥褰�
		if(u==null){
			System.out.println("login fail");
			return "login";
		}else{
			System.out.println("login success");
			//搴旇璁茬櫥褰曟垚鍔熺殑鐢ㄦ埛璧勬枡瀛樺偍鍦╯ession锛岃繖鏍烽〉闈㈠彲浠ヨ闂櫥闄嗗悗鐨勭敤鎴蜂俊鎭�
			session.setAttribute("logineduser", u);
			return "index";
		}
		
	}

	@RequestMapping("/register")
	public String register() {
		System.out.println("user -register");
		return "index";
	}
}
