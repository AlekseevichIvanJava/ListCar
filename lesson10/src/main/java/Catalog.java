
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Catalog")
public class Catalog extends HttpServlet {
	Connection connect;
	Statement stmt;
	PrintWriter writer = null;

	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName(Config.DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // регистрация драйвера для работы с базой данных
		var url = "jdbc:mysql://localhost:3307/" + Config.DB;
		try {
			connect = DriverManager.getConnection(url, Config.LOGIN, Config.PASS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			stmt = connect.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	void getMarki() throws SQLException {
		var sqlSelect = "select * from marki";
		ResultSet rs = null;
		rs = stmt.executeQuery(sqlSelect);
		writer.append("<option value='").append("-1").append("'>")
		.append(" ").append("</option>");
		while (rs.next()) {
			try {
				writer.append("<option value='").append(Integer.toString(rs.getInt("id"))).append("'>")
						.append(rs.getString("marka")).append("</option>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		writer = resp.getWriter();
		
		String idMark = req.getParameter("id");
		String info = req.getParameter("info");
		try {
			if (idMark == null) {
				getMarki();
			} else if (info==null) {
				getModels(Integer.parseInt(idMark));
			} else {
				getInfo(Integer.parseInt(idMark));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getInfo(int idMark) throws SQLException {
		var sqlSelect = "select * from models where id_model="+idMark;
		ResultSet rs = null;
		rs = stmt.executeQuery(sqlSelect);
		while (rs.next()) {
			try { 
				writer.append("<p>")
				.append("Cтоимость ")
				.append(rs.getString("title"))
				.append(": ")
				.append(Integer.toString(rs.getInt("price")))
				.append("у.е.</p>")
				.append("<p>")
				.append("Доступность: ")
				.append(rs.getString("info"))
				.append("</p>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void getModels(int idMark) throws SQLException {
		var sqlSelect = "select * from models where id_mark="+idMark;
		ResultSet rs = null;
		rs = stmt.executeQuery(sqlSelect);
		
		writer.append("<option value='").append("-1").append("'>")
		.append(" ").append("</option>");
		while (rs.next()) {
			try {
				writer.append("<option value='").append(Integer.toString(rs.getInt("id_model"))).append("'>")
						.append(rs.getString("title")).append("</option>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {

		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
