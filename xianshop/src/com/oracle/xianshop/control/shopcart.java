package com.oracle.xianshop.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Shopcart;
import com.oracle.xianshop.model.javabean.Users;
import com.oracle.xianshop.model.dao.CartDAO;



@Controller
@RequestMapping("/cart")
public class shopcart {
	
	@Autowired
	private CartDAO dao;
	
	@RequestMapping("/shopcart")
	public String addProductToCar(int pid,HttpSession session){
		if(session.getAttribute("logineduser")==null){
			return "login";
		}else{
	
			int userid=((Users)session.getAttribute("logineduser")).getUserid();
			Shopcart sp=dao.numGoods(userid,pid);
			if(sp==null){
				int result=dao.addGoods(userid, pid);
			}
			else{
				int result=dao.addnumGoods(userid, pid);
			}
			return "redirect:list";
		}
	}
	
	@RequestMapping("/list")
	public String listCars(HttpSession session,Model  m){
		if(session.getAttribute("logineduser")==null){
			return "login";
		}else{
		//从session中获取登录的用户编号
		int userid=((Users)session.getAttribute("logineduser")).getUserid();
		Map<Goods, Integer> detailCars=new HashMap<>();
		List<Shopcart> sc=dao.listCartsByUserId(userid);
		int shopcount=dao.getAllCountOfShopcart(userid);
		if(shopcount<=3){
			shopcount=550;
		}
		else{
			shopcount=(shopcount-3)*115+550;
		}
		m.addAttribute("shopcount",shopcount);
		for(Shopcart s:sc){
			detailCars.put(dao.getGoodsByGoodsId(s.getGoodsid()), s.getCarnumber());
		}
		System.out.println(sc);
		m.addAttribute("sc", detailCars);
		//行数
		
		return "cart";
		}
	}
	@RequestMapping("/delete")
	public String deleteCars(int pid,HttpSession session){
		int userid=((Users)session.getAttribute("logineduser")).getUserid();
		int check=dao.deleteCartShops(userid,pid);
		System.out.println(check+"check");
		return "redirect:list";
	}
	@RequestMapping("/deletechoose")
	public String deleteChooseCars(int []pid,HttpSession session){
		int userid=((Users)session.getAttribute("logineduser")).getUserid();
		for(int h:pid){
			int check=dao.deleteCartShops(userid,h);
		}
		return "redirect:list";
	}
	
	//
	@ResponseBody
	@RequestMapping("/addshopcart")
	public String addProductToCars(int pid,HttpSession session){
		if(session.getAttribute("logineduser")==null){
			return "fail";
		}else{
	
			int userid=((Users)session.getAttribute("logineduser")).getUserid();
			Shopcart sp=dao.numGoods(userid,pid);
			if(sp==null){
				int result=dao.addGoods(userid, pid);
			}
			else{
				int result=dao.addnumGoods(userid, pid);
			}
			int shopcount=dao.getAllCountOfShopcart(userid);
			String str=String.valueOf(shopcount);
			return str;
		}
	}
}
