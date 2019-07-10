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
		//1.��ȡ�û�����ҳ��Ҫɾ���Ķ���id
		//2.����dao���������id�Ķ����ӹ��ﳵ����ɾ��
		//��session�л�ȡ��¼�Ķ������
		 
		System.out.println("ɾ�����ﳵ�ķ���"); 
		int result=dao.deleteOrdersFromOrder(orderId);	
		System.out.println(result>0?"ɾ���ɹ�":"ɾ��ʧ��");
		return "redirect:list";
	}
	@RequestMapping("/delete1")
	public String deleteOrderItemFromOrders(String orderId,int goodsId){
		//1.��ȡ�û�����ҳ��Ҫɾ���Ķ���id
		//2.����dao���������id�Ķ����ӹ��ﳵ����ɾ��
		//��session�л�ȡ��¼�Ķ������
		 
		System.out.println("ɾ�����ﳵ������Ʒ�ķ���");
		int result1=dao.deleteOrderItemFromItems(orderId,goodsId);
		int count=dao.selectCountGoodsInOdrder(orderId);
		System.out.println("����count=="+count);
		if(count==0){
			deleteOrderFromOrders(orderId);
		}
		System.out.println(result1>0?"ɾ���ɹ�":"ɾ��ʧ��");
		return "redirect:list";
	}
	@Autowired
	private OrderDAO dao;

	@RequestMapping("/add")
	public  String addOrder(int[] pid,int[] count,String name,String address,String remark,HttpSession session){
		//1.��ȡ�ύ����ҳ���ϵĸ��ֲ������������Ʒ��źͶ�Ӧ���������ջ��˵���Ϣ�ͱ�ע��
		System.out.println(Arrays.toString(pid));
		System.out.println(Arrays.toString(count));
		String orderNum=UUID.randomUUID().toString();//�������һ���������
		//����dao���������������в��붩������
		int result=dao.addOrder(orderNum,((Users)session.getAttribute("logineduser")).getUserid(), name, address, remark, "�Ѹ���", new Date().toLocaleString());
		//������������в��붩����������
		for(int n=0;n<pid.length;n++){
			int result1=dao.addOrderItem(orderNum, pid[n], count[n]);
		}
		System.out.println(result>0?"������ɹ�":"�ύʧ��");
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String list(HttpSession session,Model m){
		if(session.getAttribute("logineduser")==null){
			//���δ��½����ת����¼ҳ��
			return "login";
		}else{
			//�����½�ˣ����ѯ���ݿ⽫���������ѯ�÷�װ��һ��map������
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