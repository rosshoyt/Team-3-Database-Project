package dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * Dao manager implementation based on below Stack Overflow
 * @author RossHoyt
 * @see https://stackoverflow.com/questions/12812256/how-do-i-implement-a-dao-manager-using-jdbc-and-connection-pools
 */
public class DAOManager {
	
   private DataSource src;
   private Connection con;
   /**
    * Value of 0 used to skip timeout wait functionality of Connection.isValid() 
    */
   private int timeout = 0;  
   
   public static DAOManager getInstance() {
       return DAOManagerSingleton.INSTANCE.get();
   }  

   public void open() throws SQLException {
      
   	try
       {
           if(this.con==null || !this.con.isValid(timeout))
         	  
               this.con = src.getConnection();
       }
       catch(SQLException e) { throw e; }
   }

   public void close() throws SQLException {
       try
       {
           if(this.con!=null && this.con.isValid(timeout))
               this.con.close();
       }
       catch(SQLException e) { throw e; }
   }

   

   private DAOManager() throws Exception {
       try
       {
           InitialContext ctx = new InitialContext();
           this.src = (DataSource)ctx.lookup("jndi/MYSQL");
       }
       catch(Exception e) { throw e; }
   }

   private static class DAOManagerSingleton {

       public static final ThreadLocal<DAOManager> INSTANCE;
       static
       {
           ThreadLocal<DAOManager> dm;
           try
           {
               dm = new ThreadLocal<DAOManager>(){
                   @Override
                   protected DAOManager initialValue() {
                       try
                       {
                           return new DAOManager();
                       }
                       catch(Exception e)
                       {
                           return null;
                       }
                   }
               };
           }
           catch(Exception e) {
               dm = null;
           }//not sure if this bracket should be below next line-
           INSTANCE = dm;
       }        

   }

}