package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;

@Mapper
public interface GoodsDAO {

	@Select ("select * from goods")
	public List<Goods> listGoods();
}
