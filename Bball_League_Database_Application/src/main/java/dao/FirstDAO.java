package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class FirstDAO extends GenericDAO<First> {

   public FirstDAO(Connection con) {
       super(con, TABLENAME);
   }

   @Override
   public int count() throws SQLException {
       String query = "SELECT COUNT(*) AS count FROM "+this.tableName;
       PreparedStatement counter;
       try
       {
       counter = this.con.prepareStatement(query);
       ResultSet res = counter.executeQuery();
       res.next();
       return res.getInt("count");
       }
       catch(SQLException e){ throw e; }
   }

  //Private
  private final static String TABLENAME = "FIRST";

}