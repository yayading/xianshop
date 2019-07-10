package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;

import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Orders;
import com.oracle.xianshop.model.javabean.Items;

@Mapper
public interface OrderDAO {

	@Insert("insert into orders(orderid,orderdate,orderstatus,address,remarks,userid,name) values(#{orderid},#{times},#{status},#{address},#{remark},#{userid},#{name})")
	public int addOrder(@Param("orderid") String orderid,@Param("userid") int userid,
			@Param("name") String name, @Param("address") String address,
			@Param("remark") String remark, @Param("status") String status,
			@Param("times") String times);
	
	@Insert("insert into items(itemnumber,goodsid,orderid) values(#{goodsNumber},#{goodsid},#{orderid})")
	public int addOrderItem(@Param("orderid")String orderid,@Param("goodsid")int goodsid,@Param("goodsNumber")int goodsNumber);
	
	
	@Select("select * from  orders where userid=#{0}")
	public List<Orders> listOrders(int userid);
	
	@Select("select *  from items where orderid=#{0}")
	public List<Items>  listItemsByOrderId(String orderid);
	
	@Select("select * from goods where goodsid=#{0}")
	public Goods getGoodsByGoodsid(int goodsid);
	
	/**
	 * 从购物车表中删除订单的dao方法
	 */
	@Delete("delete from  orders where orderid=#{oderid}")
	public int deleteOrdersFromOrder(@Param("orderid")String orderid);
	/**
	 * 从购物车表中删除订单详情表的dao方法
	 */
	@Delete("delete from items where orderid=#{oderid}")
	public int deleteOrderItemFromItems(@Param("orderid")String orderid);
}
