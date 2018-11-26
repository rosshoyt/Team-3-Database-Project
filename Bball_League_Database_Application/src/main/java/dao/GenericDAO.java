package dao;

import java.sql.Connection;
import java.sql.SQLException;

public abstract class GenericDAO<T> {

   public abstract int count() throws SQLException; 

   //Protected
   protected final String tableName;
   protected Connection con;

   protected GenericDAO(Connection con, String tableName) {
       this.tableName = tableName;
       this.con = con;
   }

}
