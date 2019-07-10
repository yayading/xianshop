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
		//1.鑾峰彇鐢ㄦ埛鍦ㄧ綉椤典笂瑕佸垹闄ょ殑璁㈠崟id
		//2.璋冪敤dao鏂规硶灏嗚繖涓猧d鐨勮鍗曚粠璐墿杞﹁〃涓垹闄�
		//浠巗ession涓幏鍙栫櫥褰曠殑璁㈠崟缂栧彿
		 
		System.out.println("鍒犻櫎璐墿杞︾殑鏂规硶");
		int result=dao.deleteOrdersFromOrder(orderId);
		int result1=dao.deleteOrderItemFromItems(orderId);
		System.out.println(result>0?"鍒犻櫎鎴愬姛":"鍒犻櫎澶辫触");
		return "redirect:list";
	}
	@Autowired
	private OrderDAO dao;

	@RequestMapping("/add")
	public  String addOrder(int[] pid,int[] count,String name,String address,String remark,HttpSession session){
		//1.鑾峰彇鎻愪氦璁㈠崟椤甸潰涓婄殑鍚勭鍙傛暟锛堣喘涔扮殑鍟嗗搧缂栧彿鍜屽搴旂殑鏁伴噺锛屾敹璐т汉鐨勪俊鎭拰澶囨敞锛�
		System.out.println(Arrays.toString(pid));
		System.out.println(Arrays.toString(count));
		String orderNum=UUID.randomUUID().toString();//闅忔満鐢熸垚涓�涓鍗曠紪鍙�
		//璋冪敤dao鏂规硶锛屽線璁㈠崟琛ㄤ腑鎻掑叆璁㈠崟鏁版嵁
		int result=dao.addOrder(orderNum,((Users)session.getAttribute("logineduser")).getUserid(), name, address, remark, "宸蹭粯娆�", new Date().toLocaleString());
		//寰�璁㈠崟璇︽儏琛ㄤ腑鎻掑叆璁㈠崟璇︽儏鏁版嵁
		for(int n=0;n<pid.length;n++){
			int result1=dao.addOrderItem(orderNum, pid[n], count[n]);
		}
		System.out.println(result>0?"璁㈠崟鎻愭垚鍔�":"鎻愪氦澶辫触");
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String list(HttpSession session,Model m){
		if(session.getAttribute("logineduser")==null){
			//濡傛灉鏈櫥闄嗭紝璺宠浆鍒扮櫥褰曢〉闈�
			return "login";
		}else{
			//濡傛灉鐧婚檰浜嗭紝鍒欐煡璇㈡暟鎹簱灏嗚鍗曡鎯呮煡璇㈠ソ灏佽鍒颁竴涓猰ap闆嗗悎涓�
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