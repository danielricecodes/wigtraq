<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>
    	<link rel="stylesheet" type="text/css" href="styles/epoch_styles.css" />
	<script type="text/javascript" src="styles/epoch_classes.js"></script>
	<script type="text/javascript">
		/*You can also place this code in a separate file and link to it like epoch_classes.js*/
		var dp_cal, dp_cal2;      
		window.onload = function () {
			dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
			dp_cal2  = new Epoch('epoch_popup','popup',document.getElementById('popup_container2'));
		};
	</script>
	<script language="JavaScript">

<!--  
function showCalendarBox( id ) { 
	document.all.otherdatetext.style.visibility = 'hidden'; 
	document.all.otherdatetext.value = ''; 
    document.all[ id ].style.visibility = 'visible'; 
    document.all[ id ].focus(); 
}
    -->
</script>
 </HEAD>

 <BODY>
 <h2><font color="#006699">Add Time Off</font></h2>
	<i><font size="2" color="#006699"><A HREF="timeOffBatch.jsp">Click here to add time off for multiple employees at once.</A></font></i><BR><BR>
 <FORM METHOD=POST ACTION="TimeOffServlet">
	<b><font size="2" color="#006699"> Employee</font></b><br>
	<select name="employee">
		<option value="employeeempty">-</option>
		
		<%
			
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_ANGEL_USERS);
			
			while(rs.next()){
				%>
				<option value="<%= rs.getString("angel") %>"><%= rs.getString("angel") %></option>
				<%
			}
			wig.closeConnections();
			wig = null;
		%>
		
	</select>
	<br>
	<br>
	<b><font size="2" color="#006699">Date of Absence</font></B><br>
	<input type="radio" checked="checked" name="date" value="today" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Today</font>
	
	<input type="radio" name="date" value="yesterday" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Yesterday</font>
	
	<input type="radio" name="date" value="otherdate" onClick="showCalendarBox( 'otherdatetext' );"> <font size="2" >Other</font> <input id="popup_container" name="otherdatetext" type="text" style="visibility:hidden"/>
	<br/>
	<br>
	<b><font size="2" color="#006699">Number of Hours Off</font></B><i><font size="1" color="#006699">&nbsp;(9 hours is a full day)</font></i><br>
	<SELECT NAME="hoursOff">
		<option value="hoursEmpty">-</option>
		<%
			for(int i=1; i <= 9; i++){
				%>
				<option value="<%= i %>"><%= i %></option>
				<%
			}
		%>
	</SELECT><br/><br/>
	<input type="submit" value="Submit"><BR>
 </FORM>

 <h2><font color="#006699">View Time Off</font></h2>
	<FORM METHOD=POST ACTION="angelViewTimeOff.jsp">
		<b><font size="2" color="#006699">Enter a date and click "View" to see time off for that week.</font></b><br><BR>
		<input id="popup_container2" name="otherdatetext2" type="text"/>

		<BR><BR>
		<INPUT TYPE="submit" VALUE="View">
		</FORM><BR>


<h2><font color="#006699">All Time Off</font></h2>

			<%
			WIGDB wig2 = new WIGDB();
			ResultSet rs2 = wig2.selectRecords(WIGDB.SQL_ANGEL_TIME_OFF);
			%>
	<TABLE width="500" border="1" cellpadding="2">
			<TR>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Employee</b></font></TD>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Date</b></font></TD>
				<TD width="100" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Hours</b></font></TD>

			</TR>

			<%
			while(rs2.next()){
			%>
			<TR>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("employee")%></font></TD>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("timeOffDate")%></font></TD>
				<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("hours")%></font></TD>
			</TR>
			<%
			}
			wig2.closeConnections();
			wig2 = null;
		%>
	</TABLE>

 </BODY>
</HTML>