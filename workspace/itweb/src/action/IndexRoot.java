package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DButil;
import doman.User;

public class IndexRoot extends HttpServlet{
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {		
			HttpSession session = request.getSession(true);
			User user = new User();
			session.setAttribute("data", user);
			String username = request.getParameter("username").trim();
			String password = request.getParameter("password").trim();
			Connection conn = DButil.getConnection();
			String sql = "select * from userroot where username = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user.setUsername(username);
				user.setPassword(password);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/Success.jsp");
				dispatcher.forward(request, response);
			}else {
				user.setMessage("�û��������벻��ȷ");
				response.sendRedirect("loginRoot");
			}
			conn.close();
		} catch (ClassNotFoundException e) {

		
		} catch (SQLException e) {
		}
				
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
