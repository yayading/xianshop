package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;

@Mapper
public interface GoodsDAO {
/*
 * �����ݿ��ȡ��ҳ����
 * */
	@Select("select *  from goods limit #{startindex},#{count}")
	public List<Goods> listGoods(@Param("startindex")int startIndex,@Param("count")int count);
/*
 * ��ѯ��Ʒ������
 */
	@Select("select count(*) from goods")
	public int getAllCountOfGoods();
}
