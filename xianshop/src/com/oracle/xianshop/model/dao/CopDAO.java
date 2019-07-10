package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Compares;
import com.oracle.xianshop.model.javabean.Goods;

public interface CopDAO {

	//��ӵ�ǰ��Ʒ�����ݿ�
	@Insert("insert into compares(goodsid) values(#{goodsid})")
	public int addGoods(@Param("goodsid")int goodsid);
	//��ȡ��Ʒ�б�
	@Select("select *  from compares")
	public List<Compares> listGoods();
	//�����ݿ����Ƴ���Ʒ
	@Delete("delete from compares where goodsid=#{goodsid}")
	public int deleteComper(@Param("goodsid")int goodsid);
	//��ȡ���ݿ�������Ŀ��
	@Select("select count(*) from compares")
	public int getAllCountOfCompares();
	//��ȡ��Ʒid
	@Select("select * from goods where goodsid=#{0}")
	public  Goods  getGoodsByGoodsId(int goodsid);
	//ɾ�����ݿ���������Ŀ
	@Delete("DELETE FROM compares")
	public int deleteall();
}
