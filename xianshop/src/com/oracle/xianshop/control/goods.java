package com.oracle.xianshop.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.xianshop.model.dao.CartDAO;
import com.oracle.xianshop.model.dao.GoodsDAO;
import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Users;

@Controller
@RequestMapping("/goods")
public class goods {
	
	@Autowired
	private GoodsDAO dao;
	@Autowired
	private CartDAO dao2;
	@RequestMapping("/list")
	public String listGoods(Model m,HttpSession session){
		Users user=(Users)session.getAttribute("logineduser");
		if(user==null){
			List<Goods> gs=dao.listGoodsAll();
			m.addAttribute("gs",gs);
		}else{
			int userid=user.getUserid();
			int shopcount=dao2.getAllCountOfShopcart(userid);
			List<Goods> gs=dao.listGoods(userid);
			m.addAttribute("sp",shopcount);
			m.addAttribute("gs",gs);
		}
		return "index";
	}
}
