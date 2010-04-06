<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
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

</SCRIPT>

 </HEAD>

 <BODY>
 <h2><font color="#006699">Add Batch Time off</font></h2><br/>
 <FORM name="batchForm" METHOD=POST ACTION="TimeOff_Batch_Servlet">
 <b><font size="2" color="#006699">Select Date</font></b><br>
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

	<b><font size="2" color="#006699">Select Employees</font></b><br><BR>

	<%
			File ANGEL_LIST = new File("webapps\\ANGEL\\groups\\ANGEL_LIST");
			FileReader ANGEL_LIST_READER = new FileReader(ANGEL_LIST);
			BufferedReader br = new BufferedReader(ANGEL_LIST_READER); 
			String s;
			while((s = br.readLine()) != null) {
				%>

				<font size="2" color="#006699"><INPUT TYPE="checkbox" NAME="<%= s %>"><%= s %></font><BR>
				<%
			} 
								
			ANGEL_LIST_READER.close();


		%>

	<br/><br/>
	<input type="submit" value="Submit"><BR>
 </FORM>

 

 </BODY>
</HTML>