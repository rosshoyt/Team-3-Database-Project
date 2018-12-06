/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package cityelection;

import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

// Notice, do not import com.mysql.jdbc.*
// or you will have problems!


/**
 *
 * @author mckeem
 */




public class CityElection {

    
    public Connection m_conn = null; 
    static final String DB_URL =
      "jdbc:mysql://localhost:3306/voterelection";
    static final String DB_DRV =
      "com.mysql.jdbc.Driver";
    static final String DB_USER = "test";
    static final String DB_PASSWD = "test";

    public int ConnectToDatabase()
    {        
        try 
        {
            // The newInstance() call is a work around for some
            // broken Java implementations

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            m_conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWD);
           
        } 
        catch (SQLException ex) 
        {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }          
        catch (Exception ex) 
        {
            // handle the error
            System.out.println("Error was " + ex.toString());
        }     
        
        return 1;
    }
    
      public int CloseDatabase()
    {        
        try 
        {

            m_conn.close();
           
        } 
        catch (SQLException ex) 
        {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }          
        catch (Exception ex) 
        {
            // handle the error
            System.out.println("Error was " + ex.toString());
        }     
        
        return 1;
    }
 
    
    public int ListOfContactsByName(String szContact)
    {
        // Create query
        // run query
        // open resultset
        // display resultset

        PreparedStatement preparedStatement = null;        
        ResultSet resultSet = null;
        try
        {
            preparedStatement=this.m_conn.prepareStatement            
           ("SELECT * FROM voterelection.contact where contact_name like ?");
            preparedStatement.setString(1,  "%" + szContact + "%");
            resultSet=preparedStatement.executeQuery();

                
            while(resultSet.next()){
               System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
               resultSet.getString(1),
               resultSet.getString(2),
               resultSet.getString(3),
               resultSet.getString(4),
               resultSet.getString(5),   
               resultSet.getString(6),  
               resultSet.getFloat(7));                  
//               resultSet.getFloat(4));
            }       
            
            preparedStatement.close();
            resultSet.close();            
        }

        catch (SQLException ex) 
        {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }          
        




        return 1;
    }

    
    public int ListOfAllContacts()
    {
        Statement statement = null;
        ResultSet resultSet = null;
        try
        {
            statement=this.m_conn.createStatement();
            resultSet=statement.executeQuery
                
               ("SELECT * FROM voterelection.contact");

            while(resultSet.next()){
               System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
               resultSet.getString(1),
               resultSet.getString(2),
               resultSet.getString(3),
               resultSet.getString(4),
               resultSet.getString(5),   
               resultSet.getString(6),  
               resultSet.getFloat(7));                  
//               resultSet.getFloat(4));
            }       
            
            statement.close();
            resultSet.close();            
        }

        catch (SQLException ex) 
        {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }          
        
        return 1;
    }

    public int ElectionResults()
    {
        Statement statement = null;
        ResultSet resultSet = null;

        try
        {
            statement=this.m_conn.createStatement();
            resultSet=statement.executeQuery
              (
                    "select  races.races_id, office_name, sub.candidate_id, contact.contact_name, cnt from(" + 
                    "select count(candidate_id) cnt, races_id, candidate_id from races_voter group by " +
                    "races_id, candidate_id " + 
                    "order by " + 
                    " races_id, candidate_id) sub, races, office, candidate, contact " +
                    "where sub.races_id = races.races_id " +
                    "and races.office_id = office.office_id " +
                    "and sub.candidate_id = candidate.candidate_id and " +
                    "candidate.contact_id = contact.contact_id ");         
//               ("SELECT * FROM books");

            while(resultSet.next()){
               System.out.printf("%s\t%s\t%s\t%s\t%s\n",
               resultSet.getString(1),
               resultSet.getString(2),
               resultSet.getString(3),
               resultSet.getString(4),
               resultSet.getString(5));               
//               resultSet.getFloat(4));
            }
            
            statement.close();
            resultSet.close();            
        }

        catch (SQLException ex) 
        {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }          
        
        return 1;
    }
    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int retCode=0;
        CityElection aCityElection = new CityElection();
        retCode = aCityElection.ConnectToDatabase();
        retCode = aCityElection.ElectionResults();
        retCode = aCityElection.ListOfAllContacts();        

        String s;
        Scanner in = new Scanner(System. in);
        System. out. println("Enter a contact name:");
        s = in. nextLine();

        retCode = aCityElection.ListOfContactsByName(s);          
        retCode = aCityElection.CloseDatabase();

    }
    
}
