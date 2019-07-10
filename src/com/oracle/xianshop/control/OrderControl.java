package com.oracle.xianshop.control;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.xianshop.model.dao.OrderDAO;
import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Items;
import com.oracle.xianshop.model.javabean.Orders;
import com.oracle.xianshop.model.javabean.Users;

@Controller
@RequestMapping("/order")
public class OrderControl {
	
	@RequestMapping("/delete")
	public String deleteOrderFromOrders(String orderId){
		//1.获取用户在网页上要删除的订单id
		//2.调用dao方法将这个id的订单从购物车表中删除
		//从session中获取登录的订单编号
		 
		System.out.println("删除购物车的方法"); 
		int result=dao.deleteOrdersFromOrder(orderId);	
		System.out.println(result>0?"删除成功":"删除失败");
		return "redirect:list";
	}
	@RequestMapping("/delete1")
	public String deleteOrderItemFromOrders(String orderId,int goodsId){
		//1.获取用户在网页上要删除的订单id
		//2.调用dao方法将这个id的订单从购物车表中删除
		//从session中获取登录的订单编号
		 
		System.out.println("删除购物车单个商品的方法");
		int result1=dao.deleteOrderItemFromItems(orderId,goodsId);
		int count=dao.selectCountGoodsInOdrder(orderId);
		System.out.println("数量count=="+count);
		if(count==0){
			deleteOrderFromOrders(orderId);
		}
		System.out.println(result1>0?"删除成功":"删除失败");
		return "redirect:list";
	}
	@Autowired
	private OrderDAO dao;

	@RequestMapping("/add")
	public  String addOrder(int[] pid,int[] count,String name,String address,String remark,HttpSession session){
		//1.获取提交订单页面上的各种参数（购买的商品编号和对应的数量，收货人的信息和备注）
		System.out.println(Arrays.toString(pid));
		System.out.println(Arrays.toString(count));
		String orderNum=UUID.randomUUID().toString();//随机生成一个订单编号
		//调用dao方法，往订单表中插入订单数据
		int result=dao.addOrder(orderNum,((Users)session.getAttribute("logineduser")).getUserid(), name, address, remark, "已付款", new Date().toLocaleString());
		//往订单详情表中插入订单详情数据
		for(int n=0;n<pid.length;n++){
			int result1=dao.addOrderItem(orderNum, pid[n], count[n]);
		}
		System.out.println(result>0?"订单提成功":"提交失败");
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String list(HttpSession session,Model m){
		if(session.getAttribute("logineduser")==null){
			//如果未登陆，跳转到登录页面
			return "login";
		}else{
			//如果登陆了，则查询数据库将订单详情查询好封装到一个map集合中
			Map<Orders, Map<Goods, Integer>> orderDtails= new HashMap();
			
			 List<Orders>  orders=dao.listOrders(((Users)session.getAttribute("logineduser")).getUserid());
			 
			for(Orders  o:orders){
				List<Items> items=dao.listItemsByOrderId(o.getOrderid());
				Map<Goods, Integer> itemDetails=new HashMap();
				for(Items  i:items){
					Goods g=dao.getGoodsByGoodsid(i.getGoodsid());
					itemDetails.put(g, i.getItemnumber());
				}
				orderDtails.put(o, itemDetails);
			}
			m.addAttribute("orderDetail", orderDtails);
			return "orders";
		}
		
	}
	
	
}