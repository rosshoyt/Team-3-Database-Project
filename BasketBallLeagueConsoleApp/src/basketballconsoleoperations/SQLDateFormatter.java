package basketballconsoleoperations;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class SQLDateFormatter {
	
	public SQLDateFormatter() {
		
	}
	
	public java.sql.Date getJavaSqlDate(String date) throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		// convert string to java.util.date
		java.util.Date javaUtilDate = format.parse(date);
		
		//convert java.util.date to java.sql.date
		java.sql.Date javaSqlDate = new java.sql.Date(javaUtilDate.getTime());
		
		return javaSqlDate;
	}

}

