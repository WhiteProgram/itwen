package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import doman.Emp;
import util.DBUtil;

public class EmpDao {
	// �鿴���ݿ�Ա����Ϣ
	public List<Emp> findAll(int page, int pageSize) {
		List list = new ArrayList<Emp>();
		Connection conn = util.DBUtil.getConnection();
		String sql = "select * from emp limit ?,?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, (page - 1) * pageSize);
			ps.setInt(2, pageSize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Emp emp = new Emp();
				emp.setId(rs.getInt("id"));// ǰ�ߺ����ݿ�һ�£����ߺ�view��list.jsp����һ��
				emp.setEmpName(rs.getString("empName"));
				emp.setEmpSex(rs.getString("empSex"));
				emp.setEmpBirthday(rs.getString("empBirthday"));
				emp.setEmpAddress(rs.getString("empAddress"));
				emp.setEmpTel(rs.getString("empTel"));
				list.add(emp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**************** ��ҳ��ѯԱ����Ϣ ****************************/
	public int pageSum(int pageSize) {
		Connection conn = DBUtil.getConnection();
		String sql = "select count(*) num from emp";
		int num = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt("num");
				num = (num + pageSize - 1) / pageSize;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(conn);
		}
		return num;
	}

	/****************���Ա����Ϣ*****************************/
	public void addEmp(Emp emp) {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into emp(empName,empSex,empBirthday,empAddress,empTel)"
				+ " values (?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, emp.getEmpName());
			ps.setString(2, emp.getEmpSex());
			ps.setString(3, emp.getEmpBirthday());
			ps.setString(4, emp.getEmpAddress());
			ps.setString(5, emp.getEmpTel());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.closeConnection(conn);
		}
	}
	
	/*************************************/
	public void delEmp(int id) {
		Connection conn = DBUtil.getConnection();//��һ�����������ݿ�����
		String sql = "delete from emp where id = ?";//�ڶ������������ݿ����������ɾ���ġ��飩
		try {
			PreparedStatement ps = conn.prepareStatement(sql);//���������������ݿ��������
			ps.setInt(1, id); //���Ĳ���������Ӧ�Ĳ������� 
			ps.executeUpdate();//���岽��ִ�в���
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.closeConnection(conn);
		}
	}
	
	/**************����ĳ��Ա����Ϣ***********************/
	public Emp findById(int id) {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from emp where id = ?";
		Emp emp = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				emp = new Emp();
				emp.setId(id);
				emp.setEmpName(rs.getString("empName"));
				emp.setEmpSex(rs.getString("empSex"));
				emp.setEmpBirthday(rs.getString("empBirthday"));
				emp.setEmpAddress(rs.getString("empAddress"));
				emp.setEmpTel(rs.getString("empTel"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.closeConnection(conn);
		}
		return emp;
	}
	
	/**************�޸�Ա����Ϣ*******************/
	public void modifyEmp(Emp emp) {
		Connection conn = DBUtil.getConnection();
		String sql = "update emp set empName = ?,empSex = ?,empBirthday=?,"
				+ "empAddress=?,empTel=? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, emp.getEmpName());
			ps.setString(2, emp.getEmpSex());
			ps.setString(3, emp.getEmpBirthday());
			ps.setString(4, emp.getEmpAddress());
			ps.setString(5, emp.getEmpTel());
			ps.setInt(6, emp.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.closeConnection(conn);
		}
	}
	
//	public static void main(String[] args) {
//		EmpDao empdao = new EmpDao();
//		int num = empdao.pageSum(3);
//		System.out.println(num);
//	}
}
