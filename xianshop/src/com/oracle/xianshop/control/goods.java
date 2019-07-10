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
	

	/**
	 * 这就是一个spring MVC下面的一个后台controller的一个后台方法
	 * @return
	 */
	@RequestMapping("/list")
	public String listProduct(Model  m,int page){
		System.out.println("这是进入了后台的方法");
		int count=20;//后台规定的每页分的条数
		List<Goods>  gs=dao.listGoods((page-1)*count,count);
		m.addAttribute("gs", gs);//将后台DAO查询出来的一个集合里面的商品信息存储到一个盒子里
		
		int allCount=dao.getAllCountOfGoods();//查询数据库获取总行数
		int allPage=allCount%count==0?allCount/count:allCount/count+1;//总页数
		int perviousPage=page-1==0?1:page-1;//上一页
		int nextPage=page==allPage?allPage:page+1;//下一页
		m.addAttribute("perviousPage", perviousPage);
		m.addAttribute("nextPage", nextPage);
		m.addAttribute("allPage", allPage);
		m.addAttribute("nowPage", page);
		m.addAttribute("allCount", allCount);
		m.addAttribute("count", count);
		
		return "index";
	}


	@Override
	public String toString() {
		return "goods [getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

}
