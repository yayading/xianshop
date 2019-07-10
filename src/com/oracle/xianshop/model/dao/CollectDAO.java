package com.oracle.xianshop.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Goods;
import com.oracle.xianshop.model.javabean.Users;

@Mapper
public interface CollectDAO {
	@Select ("select * from goods where goodsid IN(SELECT goodsid FROM collectors WHERE userid=#{userid})limit #{startindex},#{count};")
	public List<Goods>listGoods(@Param("userid")int userid,@Param("startindex")int startindex,@Param("count")int count);
	@Insert ("insert into collectors(COLLECTTIME,GOODSID,USERID)VALUES(#{time},#{gid},#{uid});")
	public int addCollect(@Param("time")String time,@Param("gid")int gid,@Param("uid")int uid);
	@Select ("Select COUNT(*) FROM collectors WHERE goodsid=#{gid} and userid=#{uid};")
	public int judgeCollect(@Param("gid")int gid,@Param("uid")int uid);
	@Delete ("DELETE FROM collectors WHERE goodsid=#{gid} and userid=#{uid};")
	public int delCollect(@Param("gid")int gid,@Param("uid")int uid);
	@Select ("select count(*) from goods where goodsid IN(SELECT goodsid FROM collectors WHERE userid=#{userid});")
	public int countCollect(@Param("userid")int userid);
}
