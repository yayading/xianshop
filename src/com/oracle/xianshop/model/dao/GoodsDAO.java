
package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;

@Mapper
public interface GoodsDAO {

/*
 * 浠庢暟鎹簱鑾峰彇鍒嗛〉鏁版嵁
 * */
	@Select("select *  from goods limit #{startindex},#{count}")
	public List<Goods> listGoods(@Param("startindex")int startIndex,@Param("count")int count);
/*
 * 鏌ヨ鍟嗗搧鎬昏鏁�
 */
	@Select("select count(*) from goods")
	public int getAllCountOfGoods();
	@Select ("select * from goods;")
	public List<Goods> listGoodsAll();
  
	@Select ("select GOODSID,GOODSNAME,GOODSTYPE,GOODSPRICE,GOODSNUMBER,GOODSPIC,IF(GOODSID IN(SELECT GOODSID FROM collectors WHERE USERID=#{userid}),1,0) as iscollect from goods limit #{startindex},#{count};")
	public List<Goods> listGood(@Param("userid") int userid,@Param("startindex")int startIndex,@Param("count")int count);

}

