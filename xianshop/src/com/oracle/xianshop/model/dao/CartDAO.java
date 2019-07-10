package com.oracle.xianshop.model.dao;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.oracle.xianshop.control.shopcart;
import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Shopcart;

@Mapper
public interface CartDAO {
		@Insert("insert into shopcart(carnumber,userid,goodsid) values(1,#{userid},#{productid})")
		public int addGoods(@Param("userid")int userid,@Param("productid")int productid);
		
		@Select("select * from shopcart where userid=#{userid} and goodsid=#{goodsid} ")
		public Shopcart numGoods(@Param("userid")int userid,@Param("goodsid")int goodsid );
		
		@Update("update shopcart set carnumber=carnumber+1 where userid=#{userid} and goodsid=#{goodsid} ")
		public int addnumGoods(@Param("userid")int userid,@Param("goodsid")int goodsid );
		
		@Select("select *  from shopcart where userid=#{0}")
		public List<Shopcart> listCartsByUserId(int userid);

		@Select("select * from goods where goodsid=#{0}")
		public  Goods  getGoodsByGoodsId(int goodsid);
		
		@Delete("delete from shopcart where userid=#{userid} and goodsid=#{goodsid}")
		public int deleteCartShops(@Param("userid")int userid,@Param("goodsid")int goodsid);
		
		@Select("select count(*) from shopcart where userid=#{userid}")
		public int getAllCountOfShopcart(@Param("userid")int userid);
}