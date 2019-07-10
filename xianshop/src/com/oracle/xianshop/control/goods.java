package com.oracle.xianshop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.xianshop.model.dao.GoodsDAO;
import com.oracle.xianshop.model.javabean.Goods;

@Controller
@RequestMapping("/goods")
public class goods {
	
	@Autowired
	private GoodsDAO dao;
	
	@RequestMapping("/list")
	public String listGoods(Model m){
		List<Goods> gs=dao.listGoods();
		m.addAttribute("gs",gs);
		return "index";
	}
}
