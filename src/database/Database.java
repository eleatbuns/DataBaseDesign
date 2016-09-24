package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by GaoLi on 16-7-27.
 * 对数据库的相关操作
 */

public class Database {
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	
    private static String dbUrl = "jdbc:mysql://localhost:3306/college_exam?user=root&password=123456&useUnicode=true";
    private static String jdbcName = "com.mysql.jdbc.Driver";


    /**
	 * 连接数据库
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(jdbcName).newInstance();
			//Class.forName(jdbcName);
			conn = DriverManager.getConnection(dbUrl);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (conn == null) {
			System.err.println("获得数据库链接失败");
		}
		return conn;
	}

	public String userLogin(String sql) {
		String passwprd = "";
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// 执行查询操作
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				passwprd = rs.getString(1);
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			close();
		}
		return passwprd;
	}

	/**
	 * 执行查询语句
	 * 	
	 * @param sql
	 * @return
	 */
	public ResultSet executeQuery(String sql) {
		try {
			// 调用getConnection()方法构造Connection对象的一个实例conn
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// 执行查询操作
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
//		finally{
//			close();
//		 }
		return rs;
	}

	/**
	 * 执行更新操作
	 * 
	 * @param sql
	 * @return
	 */
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			result = 0;
		} finally {
			close();
		}
		return result;
	}

	/**
	 * 关闭数据库的连接
	 */
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}
