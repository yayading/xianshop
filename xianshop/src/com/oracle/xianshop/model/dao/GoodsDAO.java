
package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;

@Mapper
public interface GoodsDAO {

/*
 * 从数据库获取分页数据
 * */
	@Select("select *  from goods limit #{startindex},#{count}")
	public List<Goods> listGoods(@Param("startindex")int startIndex,@Param("count")int count);
/*
 * 查询商品总行数
 */
	@Select("select count(*) from goods")
	public int getAllCountOfGoods();
  @Select ("select * from goods;")
	public List<Goods> listGoodsAll();
  
  @Select ("select GOODSID,GOODSNAME,GOODSTYPE,GOODSPRICE,GOODSNUMBER,GOODSPIC,IF(GOODSID IN(SELECT GOODSID FROM collectors WHERE USERID=#{userid}),1,0) as iscollect from goods;")
	public List<Goods> listGoods(@Param("userid") int userid);

}

