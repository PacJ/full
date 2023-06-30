package abc;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnectionMgr {
	private static DataSource dataSource;
	
	
    public DBConnectionMgr() {
        try {
            Context ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
            System.out.println("Database connection established");
        } catch (NamingException e) {
        	  System.out.println("Failed to establish database connection");
            e.printStackTrace();
        }
    }
//	public void getConn() {
//	      try {
//	         Context ctx = new InitialContext();
//	         Context env = (Context)ctx.lookup("java:comp/env");
//	         DataSource ds = (DataSource)env.lookup("jdbc/pool");
////	         Connection conn = ds.getConnection();
//	      } catch (Exception e) {
//	         e.printStackTrace();
//	      }
//	   }
	
	   public Connection getConnection() throws SQLException {
	        return dataSource.getConnection();
	    }
	   
	    public void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	
	    public MemberDTO fetchData(String id) {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        MemberDTO member = null;

	        try {
	            con = getConnection();
	            String sql = "SELECT * FROM MEMBER WHERE ID = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                // Retrieve and process data as needed
	            	System.out.println("쿼리실행");
	            	member = new MemberDTO();
	            	member.setId(rs.getString("ID"));
	            	member.setPw(rs.getString("PW"));
	            	member.setName(rs.getString("NAME"));
//	            	member.setAddress(rs.getString("ADDRESS"));
//	            	member.setBirthdate(rs.getString("BIRTHDATE"));
//	            	member.setEmail(rs.getString("EMAIL"));
//	            	member.setGender(rs.getString("GENDER"));
//	            	member.setZipcode(rs.getString("ZIPCODE"));
//	            	member.setJob(rs.getString("JOB"));
//	            	member.setHobby(rs.getString("HOBBY"));
	            	System.out.println("Row count: " + rs.getRow());

	            }
	            System.out.println("Row count: " + rs.getRow());
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            closeConnection(con, pstmt, rs);
	        }
	        return member;
	    }

}
