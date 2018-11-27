package gui;

/**
 * BBall League Database GUI
 * @author Team3
 * @version 1.0
 */

import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;
import javax.swing.table.DefaultTableModel;

import dao.DAOManager;

import java.util.ArrayList;
import java.util.Properties;

import jdbc.*;

import javax.swing.GroupLayout.Alignment;
import javax.swing.GroupLayout;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.Color;
import java.io.FileInputStream;

import javax.swing.UIManager;
import javax.swing.JLabel;

public class BasketballLeagueGUI extends javax.swing.JFrame {


	/**
	 * Main method which initiates application
	 * @param args
	 */
	public static void main(String args[]) throws SQLException {
		
		/* Set the Nimbus look and feel */
		
		//<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
		/* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
		 * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
		 */
		try {
			for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
				if ("Nimbus".equals(info.getName())) {
					javax.swing.UIManager.setLookAndFeel(info.getClassName());
					break;
				}
			}
		} catch (ClassNotFoundException ex) {
			java.util.logging.Logger.getLogger(BasketballLeagueGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		} catch (InstantiationException ex) {
			java.util.logging.Logger.getLogger(BasketballLeagueGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		} catch (IllegalAccessException ex) { 
			java.util.logging.Logger.getLogger(BasketballLeagueGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		} catch (javax.swing.UnsupportedLookAndFeelException ex) {
			java.util.logging.Logger.getLogger(BasketballLeagueGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
		}
		//</editor-fold>

		/* Create and display the form */
		java.awt.EventQueue.invokeLater(new Runnable() {
			public void run() {
				new BasketballLeagueGUI().setVisible(true);
				
				//resultset demo section testing
/*				
				ResultSetDemo rsd = null;
				try {
					rsd.test_init();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//resultset demo end
				*/
				
			}
		});
		
	}

	public Connection m_conn = null; 
	
	//private AppDB_Connection_info db_connec_info = new AppDB_Connection_info();
	
	static final String DB_URL = jdbc.AppDB_Connection_info.LOCAL_TEST_URL; 
			//"jdbc:mysql://localhost:3306/voterelection";
			
	static final String DB_DRV = jdbc.AppDB_Connection_info.DB_DRIVER;
			//   "com.mysql.jdbc.Driver";
			
	static final String DB_USER = jdbc.AppDB_Connection_info.LOCAL_TEST_USERNAME;
	
	static final String DB_PASSWD = jdbc.AppDB_Connection_info.LOCAL_TEST_PW;
	
	static DAOManager daoManager;
	
	String m_error= "";

	
	ArrayList<String> m_resultList ;   
	int m_columnCount=0;
	int m_rows=0;

	public int ConnectToDatabase()
	{        
		
		Properties props = new Properties();
		try 
		{
			props.load(new FileInputStream("test_database.properties"));
			
			String user = props.getProperty("user");
			String password = props.getProperty("password");
			String dburl = props.getProperty("dburl");
			
			// connect to database
			m_conn = DriverManager.getConnection(dburl, user, password);
			
		
			System.out.println("DB connection successful to: " + dburl);
		
		// The newInstance() call is a work around for some
			// broken Java implementations
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//m_conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWD);

		} 
		catch (SQLException ex) 
		{
			m_error = "SQLException: " + ex.getMessage();
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return 0;
		}          
		catch (Exception ex) 
		{
			// handle the error
			System.out.println("Error was " + ex.toString());
			return 0;
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

	
/**
 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 * Swing GUI App Code ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */
	
		/**
	 * Creates new form BasketballLeagueGUI
	 */
	public BasketballLeagueGUI() {
		System.out.println("BBall League Gui Initialized");
		getContentPane().setBackground(UIManager.getColor("RadioButton.select"));
		setBackground(Color.GRAY);
		initComponents();
		DefaultTableModel model = (DefaultTableModel) this.jTable1.getModel();
		model.setRowCount(0);
		
		// OTHER POSSIBLE TESTING LOCATIONS
		//resultset demo section testing
		
		ResultSetDemo rsd = null;
		try {
			rsd.test_init();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//resultset demo end
		
	}
	
	
	
	/**
	 * This method is called from within the constructor to initialize the form.
	 * WARNING: Do NOT modify this code. The content of this method is always
	 * regenerated by the Form Editor.
	 */
	@SuppressWarnings("unchecked")
	// <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
	private void initComponents() {

		jButton2 = new javax.swing.JButton();
		jTextField1 = new javax.swing.JTextField();
		jTextField1.setForeground(Color.GRAY);
		jTextField1.setText("Connection errors displayed here");
		jTextField1.setToolTipText("");
		jButton3 = new javax.swing.JButton();
		jPanel1 = new javax.swing.JPanel();
		jScrollPane3 = new javax.swing.JScrollPane();
		jTable1 = new javax.swing.JTable();

		setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

		jButton2.setText("Connect");
		jButton2.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				jButton2ActionPerformed(evt);
			}
		});

		jButton3.setText("Run Query");
		jButton3.setToolTipText("");
		jButton3.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				jButton3ActionPerformed(evt);
			}
		});

		jTable1.setModel(new javax.swing.table.DefaultTableModel(
				new Object [][] {
					{null, null, null, null},
					{null, null, null, null},
					{null, null, null, null},
					{null, null, null, null}
				},
				new String [] {
						"Title 1", "Title 2", "Title 3", "Title 4"
				}
				));
		jScrollPane3.setViewportView(jTable1);

		javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
		jPanel1Layout.setHorizontalGroup(
			jPanel1Layout.createParallelGroup(Alignment.LEADING)
				.addComponent(jScrollPane3, GroupLayout.DEFAULT_SIZE, 607, Short.MAX_VALUE)
		);
		jPanel1Layout.setVerticalGroup(
			jPanel1Layout.createParallelGroup(Alignment.LEADING)
				.addGroup(jPanel1Layout.createSequentialGroup()
					.addComponent(jScrollPane3, GroupLayout.PREFERRED_SIZE, 482, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(41, Short.MAX_VALUE))
		);
		jPanel1.setLayout(jPanel1Layout);
		Query_Selector = new javax.swing.JList<>();
		
				Query_Selector.setModel(new javax.swing.AbstractListModel<String>() {
					String[] strings = { "Query 1", "Query 2", "Query 3", "Query 4", "Query 5", 
							"Query 6","Query 7","Query 8","Query 9","Query 10","Query 11"};
					public int getSize() { return strings.length; }
					public String getElementAt(int i) { return strings[i]; }
				});

		javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
		layout.setHorizontalGroup(
			layout.createParallelGroup(Alignment.LEADING)
				.addGroup(layout.createSequentialGroup()
					.addContainerGap()
					.addGroup(layout.createParallelGroup(Alignment.LEADING)
						.addGroup(Alignment.TRAILING, layout.createSequentialGroup()
							.addComponent(jButton2, GroupLayout.DEFAULT_SIZE, 171, Short.MAX_VALUE)
							.addGroup(layout.createParallelGroup(Alignment.LEADING)
								.addGroup(layout.createSequentialGroup()
									.addGap(25)
									.addComponent(jTextField1, GroupLayout.PREFERRED_SIZE, 556, GroupLayout.PREFERRED_SIZE))
								.addGroup(layout.createSequentialGroup()
									.addPreferredGap(ComponentPlacement.UNRELATED)
									.addComponent(jPanel1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)))
							.addContainerGap(328, Short.MAX_VALUE))
						.addGroup(layout.createSequentialGroup()
							.addGroup(layout.createParallelGroup(Alignment.TRAILING)
								.addGroup(Alignment.LEADING, layout.createSequentialGroup()
									.addPreferredGap(ComponentPlacement.RELATED)
									.addComponent(Query_Selector, GroupLayout.DEFAULT_SIZE, 125, Short.MAX_VALUE))
								.addComponent(jButton3, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 177, Short.MAX_VALUE))
							.addGap(941))))
		);
		layout.setVerticalGroup(
			layout.createParallelGroup(Alignment.TRAILING)
				.addGroup(layout.createSequentialGroup()
					.addContainerGap()
					.addGroup(layout.createParallelGroup(Alignment.BASELINE)
						.addComponent(jButton2, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
						.addComponent(jTextField1, GroupLayout.PREFERRED_SIZE, 36, GroupLayout.PREFERRED_SIZE))
					.addGroup(layout.createParallelGroup(Alignment.LEADING)
						.addGroup(layout.createSequentialGroup()
							.addGap(12)
							.addComponent(jPanel1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
						.addGroup(layout.createSequentialGroup()
							.addGap(38)
							.addComponent(Query_Selector, GroupLayout.PREFERRED_SIZE, 247, GroupLayout.PREFERRED_SIZE)
							.addGap(18)
							.addComponent(jButton3))))
		);
		getContentPane().setLayout(layout);

		pack();
	}// </editor-fold>//GEN-END:initComponents

	private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
		// TODO add your handling code here:
		int nValue = 0;
		if (jButton2.getText() == "Connect")
		{
			nValue = this.ConnectToDatabase();
			if (nValue == 1)
			{
				jButton2.setText("Disconnect");
			}
			else
			{
				jTextField1.setText("Error is " + m_error);
			}
		}
		else
		{
			nValue = this.CloseDatabase();
			if (nValue == 1)
			{
				jButton2.setText("Connect");
			}
			else
			{
				jTextField1.setText("Error is " + m_error);
			}            
		}

	}//GEN-LAST:event_jButton2ActionPerformed

	private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
		// TODO add your handling code here:
		String selected_query = Query_Selector.getSelectedValue();
		
		DefaultTableModel model = (DefaultTableModel) this.jTable1.getModel();
		model.setRowCount(0);

		// Which Query was Produced
		// Set your Header with the Column values you want
		// TODO
		// Run the Query You want based on the Selection

		// THIS IS HARDCODED TO BE THE LISTALLCONTACTS

		String header[] = {"VAL1", "VAL2", "VAL3", "VAL4", "VAL5", "VAL6", "VAL7"};
		model.setColumnIdentifiers(header);
		ListOfAllContacts();

		/*
        int i;
        for (i=0; i < this.m_rows; i++)
        {
          String abc = m_resultList.get(i);
          String []  strArray = new String [1];           
          strArray[0] = abc;
          model.addRow(strArray);
        }
		 */

	}//GEN-LAST:event_jButton3ActionPerformed

	
	
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
			// Wild card when I use % before the Contact and After
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

			ResultSetMetaData rsmd = resultSet.getMetaData(); 
			m_columnCount = rsmd.getColumnCount();

			m_resultList= new ArrayList<>(m_columnCount);             

			int i=0;
			m_rows = 0;
			while(resultSet.next()){
				System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
						resultSet.getString(1),
						resultSet.getString(2),
						resultSet.getString(3),
						resultSet.getString(4),
						resultSet.getString(5),   
						resultSet.getString(6),  
						resultSet.getFloat(7)); 

				// We are also going to store these values into our Java
				// GUI Table
				Object [] rowData = new Object[7];
				for (int j = 0; j < rowData.length; j++)
				{
					rowData[j] = resultSet.getObject(j+1);
				}       
				DefaultTableModel model = (DefaultTableModel) this.jTable1.getModel();
				model.addRow(rowData);               

				//m_rows++; 

				// We are adding just the first value into this array. We
				// will add the rest later when we see that it works
				//m_resultList.add(resultSet.getString(1));               
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
			resultSet=statement.executeQuery(jdbc.ProjectQueries.QUERY2);
			//original query -
			/*				"select  races.races_id, office_name, sub.candidate_id, contact.contact_name, cnt from(" + 
									"select count(candidate_id) cnt, races_id, candidate_id from races_voter group by " +
									"races_id, candidate_id " + 
									"order by " + 
									" races_id, candidate_id) sub, races, office, candidate, contact " +
									"where sub.races_id = races.races_id " +
									"and races.office_id = office.office_id " +
									"and sub.candidate_id = candidate.candidate_id and " +
							"candidate.contact_id = contact.contact_id ");         
			//               ("SELECT * FROM books");
			*/
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


	
	// Variables declaration - do not modify//GEN-BEGIN:variables
	private javax.swing.JButton jButton2;
	private javax.swing.JButton jButton3;
	private javax.swing.JList<String> Query_Selector;
	private javax.swing.JPanel jPanel1;
	private javax.swing.JScrollPane jScrollPane3;
	private javax.swing.JTable jTable1;
	private javax.swing.JTextField jTextField1;
}
