package com.oracle.xianshop.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.generator.codegen.ibatis2.dao.DAOGenerator;
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
		if(user==null){
			return "login";
		}
		int userid=user.getUserid();
		List<Goods> gs=dao.listGoods(userid);
		m.addAttribute("cl",gs);
		return "collection";
	}
	@RequestMapping("/add")
	public String addCollect(int gid,HttpSession session){
		Users user=(Users)session.getAttribute("logineduser");
		int uid=user.getUserid();
		Date date=new Date();
		DateFormat df=DateFormat.getDateTimeInstance();
		String time=df.format(date);
		int judge=dao.judgeCollect(gid, uid);
		if(judge!=0){
			return "index";
		}
		int g=dao.addCollect(time, gid, uid);
		return "redirect:list";
	}
	@RequestMapping("/del")
	public String delCollect(int gid,HttpSession session){
		Users user=(Users)session.getAttribute("logineduser");
		int uid=user.getUserid();
		int l=dao.delCollect(gid, uid);
		return "redirect:list";
	}
}
