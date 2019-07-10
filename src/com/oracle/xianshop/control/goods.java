
package com.oracle.xianshop.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.xianshop.model.dao.CartDAO;
import com.oracle.xianshop.model.dao.GoodsDAO;
import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Users;

@Controller
@RequestMapping("/goods")
public class goods {
	
	@Autowired
	private GoodsDAO dao;
	@Autowired
	private CartDAO dao2;
	

	/**
	 * 杩欏氨鏄竴涓猻pring MVC涓嬮潰鐨勪竴涓悗鍙癱ontroller鐨勪竴涓悗鍙版柟娉�
	 * @return
	 */
	@RequestMapping("/list")
	public String listProduct(Model  m,int page,HttpSession session){
		System.out.println("杩欐槸杩涘叆浜嗗悗鍙扮殑鏂规硶");
		int count=20;//鍚庡彴瑙勫畾鐨勬瘡椤靛垎鐨勬潯鏁�
		Users user=(Users)session.getAttribute("logineduser");
		if(user==null){
			List<Goods>  gs=dao.listGoods((page-1)*count,count);
			m.addAttribute("gs", gs);//灏嗗悗鍙癉AO鏌ヨ鍑烘潵鐨勪竴涓泦鍚堥噷闈㈢殑鍟嗗搧淇℃伅瀛樺偍鍒颁竴涓洅瀛愰噷
		}else{
			int userid=user.getUserid();
			int shopcount=dao2.getAllCountOfShopcart(userid);
			List<Goods> gs=dao.listGood(userid,(page-1)*count,count);
			m.addAttribute("sp",shopcount);
			m.addAttribute("gs", gs);//灏嗗悗鍙癉AO鏌ヨ鍑烘潵鐨勪竴涓泦鍚堥噷闈㈢殑鍟嗗搧淇℃伅瀛樺偍鍒颁竴涓洅瀛愰噷
		}
		int allCount=dao.getAllCountOfGoods();//鏌ヨ鏁版嵁搴撹幏鍙栨�昏鏁�
		int allPage=allCount%count==0?allCount/count:allCount/count+1;//鎬婚〉鏁�
		int perviousPage=page-1==0?1:page-1;//涓婁竴椤�
		int nextPage=page==allPage?allPage:page+1;//涓嬩竴椤�
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