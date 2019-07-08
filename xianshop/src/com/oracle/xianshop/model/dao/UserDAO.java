package com.oracle.xianshop.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.oracle.xianshop.model.javabean.Users;
/**
 * @author Administrator
 *
 */

@Mapper
public interface UserDAO {
	/**
	 *
	 * @param username
	 * @param password
	 * @return
	 */
	@Select("select * from users where username=#{username} and password=#{password}")
	public Users login(@Param("username")String username,@Param("password")String password);

}
