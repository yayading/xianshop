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
	 * �����һ��spring MVC�����һ����̨controller��һ����̨����
	 * @return
	 */
	@RequestMapping("/list")
	public String listProduct(Model  m,int page){
		System.out.println("���ǽ����˺�̨�ķ���");
		int count=20;//��̨�涨��ÿҳ�ֵ�����
		List<Goods>  gs=dao.listGoods((page-1)*count,count);
		m.addAttribute("gs", gs);//����̨DAO��ѯ������һ�������������Ʒ��Ϣ�洢��һ��������
		
		int allCount=dao.getAllCountOfGoods();//��ѯ���ݿ��ȡ������
		int allPage=allCount%count==0?allCount/count:allCount/count+1;//��ҳ��
		int perviousPage=page-1==0?1:page-1;//��һҳ
		int nextPage=page==allPage?allPage:page+1;//��һҳ
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
