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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String listGoods(Model m,HttpSession session,int page){
		Users user=(Users)session.getAttribute("logineduser");
		if(user==null){
			return "login";
		}
		int userid=user.getUserid();
		int count=12;
		int startindex=(page-1)*count;
		int collections=dao.countCollect(userid);
		int maxpage=((collections-1)/count)+1;
		int previouspage=page-1==0?page:page-1;
		int nextpage=page==maxpage?page:page+1;
		List<Goods> gs=dao.listGoods(userid,startindex,count);
		m.addAttribute("cl",gs);
		m.addAttribute("previouspage",previouspage);
		m.addAttribute("nextpage",nextpage);
		m.addAttribute("maxpage",maxpage);
		m.addAttribute("page",page);
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
		return "redirect:list?page=1";
	}
	@RequestMapping("/del")
	public String delCollect(int gid,HttpSession session){
		Users user=(Users)session.getAttribute("logineduser");
		int uid=user.getUserid();
		int l=dao.delCollect(gid, uid);
		return "redirect:list?page=1";
	}
	@ResponseBody
	@RequestMapping("/addajax")
	public String addCollectAjax(int gid,HttpSession session){
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
		return "succeed";
	}
	@ResponseBody
	@RequestMapping("/delajax")
	public String delCollectAjax(int gid,HttpSession session){
		Users user=(Users)session.getAttribute("logineduser");
		int uid=user.getUserid();
		int l=dao.delCollect(gid, uid);
		return "succeed";
	}
}
