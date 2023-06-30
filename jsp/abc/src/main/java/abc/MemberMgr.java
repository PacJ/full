package abc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberMgr {
	public static Connection con;

	public MemberMgr() {
		// TODO Auto-generated constructor stub
	}
	
	public void getCon() {
	      try {
	         Context ctx = new InitialContext();
	         Context env = (Context)ctx.lookup("java:comp/env");
	         DataSource ds = (DataSource)env.lookup("jdbc/pool");
	         con = ds.getConnection();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	
	public int idcheck(String id) {
	      int cnt=0;
	      
	      try {
	         getCon();

	         String sql = "select coun"
	               + "t(*) from member where id=?";
	         PreparedStatement idchk=con.prepareStatement(sql);
	         idchk.setString(1, id);
	         ResultSet getcnt=idchk.executeQuery();
	         if(getcnt.next()) {
	            cnt=getcnt.getInt(1);
	            System.out.println("가나다라");
	         }
	         getcnt.close();
	         idchk.close();
	         con.close();
	         
	      } catch(Exception e) {
	         e.printStackTrace();
	         System.out.println("error idcheck");
	      }
	            
	      return cnt;
	   }
}
