package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;

@Mapper
public interface GoodsDAO {

	@Select ("select GOODSID,GOODSNAME,GOODSTYPE,GOODSPRICE,GOODSNUMBER,GOODSPIC,IF(GOODSID IN(SELECT GOODSID FROM collectors WHERE USERID=#{userid}),1,0) as iscollect from goods;")
	public List<Goods> listGoods(@Param("userid") int userid);
	@Select ("select * from goods;")
	public List<Goods> listGoodsAll();
	
}
