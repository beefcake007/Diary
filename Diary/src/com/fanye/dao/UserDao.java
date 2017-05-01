package com.fanye.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fanye.model.User;
import com.fanye.util.MD5Util;
import com.fanye.util.PropertiesUtil;

public class UserDao {
	
	public User login(Connection con, User user) throws Exception{
		
		User resultUser=null;
		String sql="select * from t_user where userName=? and password=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,user.getUserName());
		pstmt.setString(2,MD5Util.EncoderPwByMd5(user.getPassword()));
		ResultSet re=pstmt.executeQuery();
		if(re.next()){
			resultUser=new User();
			resultUser.setUserId(re.getInt("userId"));
			resultUser.setUserName(re.getString("userName"));
			resultUser.setPassword(re.getString("password"));
			resultUser.setNickName(re.getString("nickName"));
			resultUser.setImageName(PropertiesUtil.getValue("imageFile")+re.getString("imageName"));
			resultUser.setMood(re.getString("mood"));
		}
		return resultUser;
	}

	public int userUpdate(Connection con,User user)throws Exception{
		String sql="update t_user set nickName=?,imageName=?,mood=? where userId=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getNickName());
		pstmt.setString(2, user.getImageName());
		pstmt.setString(3, user.getMood());
		pstmt.setInt(4, user.getUserId());
		return pstmt.executeUpdate();
	}
}
