package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Compares;
import com.oracle.xianshop.model.javabean.Goods;

public interface CopDAO {

	//添加当前商品到数据库
	@Insert("insert into compares(goodsid) values(#{goodsid})")
	public int addGoods(@Param("goodsid")int goodsid);
	//读取商品列表
	@Select("select *  from compares")
	public List<Compares> listGoods();
	//从数据库中移除商品
	@Delete("delete from compares where goodsid=#{goodsid}")
	public int deleteComper(@Param("goodsid")int goodsid);
	//获取数据库中总条目数
	@Select("select count(*) from compares")
	public int getAllCountOfCompares();
	//获取商品id
	@Select("select * from goods where goodsid=#{0}")
	public  Goods  getGoodsByGoodsId(int goodsid);
	//删除数据库中所有条目
	@Delete("DELETE FROM compares")
	public int deleteall();
}
