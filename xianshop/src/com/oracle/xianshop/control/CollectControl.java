package com.oracle.xianshop.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.xianshop.model.dao.CollectDAO;
import com.oracle.xianshop.model.dao.UserDAO;
import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Users;

@Controller
@RequestMapping("/collect")
public class CollectControl {
	@Autowired
	private CollectDAO dao;
	@RequestMapping("/list")
	public String listGoods(Model m,HttpSession session){
		Users user=(Users)session.getAttribute("logineduser");
		int userid=user.getUserid();
		List<Goods> gs=dao.listGoods(userid);
		System.out.println(gs.get(0).toString());
		m.addAttribute("cl",gs);
		return "collection";
	}
}
