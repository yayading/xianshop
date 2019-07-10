package com.oracle.xianshop.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.xianshop.model.dao.CopDAO;
import com.oracle.xianshop.model.dao.GoodsDAO;
import com.oracle.xianshop.model.javabean.Compares;
import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Shopcart;
import com.oracle.xianshop.model.javabean.Users;


@Controller
@RequestMapping("/comp")
public class comperControl {
	@Autowired
	private CopDAO dao;
	
	@RequestMapping("/list")
	public String listcomp(Model  m){
		System.out.println("这是进入了后台的方法");
		int count=20;//后台规定的每页分的条数
		List<Compares>  cp=dao.listGoods();
		System.out.println("这是进入了获取了list的方法");
		Map<Goods, Integer> detailCompares=new HashMap<>();
		System.out.println("这是进入了获取了map的方法");
		int comparescount=dao.getAllCountOfCompares();
		if(comparescount<=3){
			comparescount=550;
		}
		else{
			comparescount=(comparescount-3)*115+550;
		}
		m.addAttribute("comparescount",comparescount);
		for(Compares c:cp){
			detailCompares.put(dao.getGoodsByGoodsId(c.getGoodsid()), c.getCompareid());
		}
		System.out.println(cp);
		m.addAttribute("cp", detailCompares);
		return "comp";
	}
	
	@RequestMapping("/add")
	public String addProductToCar(int pid){
			int result=dao.addGoods(pid);
			return "redirect:list";
	}
	
	//删除条目
	@RequestMapping("/delete")
	public String deleteCars(int pid){
		int check=dao.deleteComper(pid);
		System.out.println(check+"check");
		return "redirect:list";
	}
	//删除选中条目
	@RequestMapping("/deletechoose")
	public String deleteChooseCars(int []pid){
		for(int h:pid){
			int check=dao.deleteComper(h);
		}
		return "redirect:list";
	}
}
