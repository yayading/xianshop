package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Users;

@Mapper
public interface CollectDAO {
	@Select ("select * from goods where goodsid IN(SELECT goodsid FROM collectors WHERE userid=#{userid});")
	public List<Goods>listGoods(@Param("userid")int userid);
}
