package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class UserDao {
	public boolean isValidAccount(String accountName,String accountPasswd) {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from user_login where account_name=? and account_passwd=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, accountName);
			ps.setString(2, accountPasswd);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
