package core;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;



public class TestCore {

	
		
	//@Test
	//public void test() {
	public static void main(String[] args) {	
	System.out.println("Test starting"); 
		Connection connection = ConnectionFactory.getConnection();
		try {
			assertTrue(connection.isValid(0));
			System.out.printf("\n%s%s", "Connection is ", connection.isValid(0) ? " valid" : "invalid");
		} catch (SQLException e) {

			e.printStackTrace();
			fail("SQL Exception"); // TODO
		}
	}
}


