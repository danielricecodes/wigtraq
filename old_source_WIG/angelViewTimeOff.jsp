<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="com.borland.support.wig.availability.AngelUploadServlet" %>

<HTML>
 <HEAD>
  <TITLE>  </TITLE>
 </HEAD>
 <BODY>
 <%
	String timeOffDate = request.getParameter("otherdatetext2");
	String date = "";
 %>

	<h2><font color="#006699">The following time off was logged for the week of <%= timeOffDate %>&nbsp;:</font></h2><br/>
	<%
		date = (timeOffDate.substring(6,10)+"-"+timeOffDate.substring(0,2)+"-"+timeOffDate.substring(3,5));

		
		int year = Integer.parseInt(date.substring(0, 4));
		int month = Integer.parseInt(date.substring(5, 7));
		int day = Integer.parseInt(date.substring(8, 10));
		GregorianCalendar gc = new GregorianCalendar(year, month-1, day);
	    //string representation of today's date formatted for MySql
	    String TODAY = AngelUploadServlet.convertDateToSFDCFormat(gc.get(Calendar.YEAR) + "-" + (gc.get(Calendar.MONTH)+1) + "-" + gc.get(Calendar.DATE));

	    
	    //integer representing today's day of week
	    int dayOfWeek = gc.get(Calendar.DAY_OF_WEEK);
	    //integer representing first day of week (Sunday) - should be 1
	    int firstDayOfWeek = gc.getFirstDayOfWeek();
	    
	    int dayBefore = gc.get(Calendar.DAY_OF_YEAR);
	    //roll back to Sunday of last week
	    gc.roll(Calendar.DAY_OF_YEAR, firstDayOfWeek-(dayOfWeek)); 
	    //take into account cross month and cross year ranges
	    int dayAfter = gc.get(Calendar.DAY_OF_YEAR);
	    if(dayAfter > dayBefore) {
	        gc.roll(Calendar.YEAR, -1);
	    }
	    gc.get(Calendar.DATE);
	    //set the FROM variable to the date of the Sunday at the start of the week
	    String FROM = AngelUploadServlet.convertDateToSFDCFormat(gc.get(Calendar.YEAR) + "-" + (gc.get(Calendar.MONTH)+1) + "-" + gc.get(Calendar.DATE));
	    
	    int dayBefore2 = gc.get(Calendar.DAY_OF_YEAR);
	    // roll up to the following Saturday
	    gc.roll(Calendar.DAY_OF_YEAR, firstDayOfWeek+5); 
	    //take into account cross month and cross year ranges
	    int dayAfter2 = gc.get(Calendar.DAY_OF_YEAR);
	    if(dayAfter2 < dayBefore2) {
	        gc.roll(Calendar.YEAR, 1);
	    }
	    gc.get(Calendar.DATE);
	    //set the TO variable to the date of the Saturday at the end of the week
	    String TO = AngelUploadServlet.convertDateToSFDCFormat(gc.get(Calendar.YEAR) + "-" + (gc.get(Calendar.MONTH)+1) + "-" + gc.get(Calendar.DATE));

		WIGDB wig = new WIGDB();
		ResultSet rs = wig.selectRecords("SELECT * FROM ANGEL_TIME_OFF WHERE TIMEOFFDATE>='" + FROM + "' AND TIMEOFFDATE<='" + TO + "' ORDER BY TIMEOFFDATE DESC;");

			%>

		<TABLE width="500" border="1" cellpadding="2">
			<TR>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Employee</b></font></TD>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Date</b></font></TD>
				<TD width="100" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Hours</b></font></TD>

			</TR>

			<%
			while(rs.next()){
			%>
			<TR>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("employee")%></font></TD>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("timeOffDate")%></font></TD>
				<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("hours")%></font></TD>
			</TR>
			<%
			}
			wig.closeConnections();
			rs = null;
			wig = null;
		%>
	</TABLE>


 </BODY>
 </HTML>