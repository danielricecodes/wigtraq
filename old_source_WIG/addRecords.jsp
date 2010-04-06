<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>
  	<link rel="stylesheet" type="text/css" href="styles/epoch_styles.css" />
	<script type="text/javascript" src="styles/epoch_classes.js"></script>
	<script type="text/javascript">
		/*You can also place this code in a separate file and link to it like epoch_classes.js*/
		var dp_cal;      
		window.onload = function () {
			dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
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
<h2><font color="#006699">Log Kudos</font></h2>
<h3><font size="1" color="#990000"><i>(* Required field)</i></font></h3>

<FORM METHOD=POST ACTION="AddRecord">
<b><font size="2" color="#990000">*</font><font size="2" color="#006699"> Employee</font></b><br>
	<select name="employee">
		<option value="employeeempty">-</option>
		
		<%
			//add code to query db for employees names to populate drop down list
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_EMPLOYEE_LIST);
			
			while(rs.next()){
				%>
				<option value="<%= rs.getString("employee") %>"><%= rs.getString("employee") %></option>
				<%
			}
			wig.closeConnections();
			wig = null;
		%>
		
	</select>
	<br>
	<br>
<b><font size="2" color="#990000">*</font><font size="2" color="#006699">  Product</font></B><br>
	<select name="team">
		<option value="teameempty">-</option>
		<%
			
			WIGDB wig2 = new WIGDB();
			ResultSet rs2 = wig2.selectRecords(wig2.SQL_PRD_LIST);
			
			while(rs2.next()){
				%>
				<option value="<%= rs2.getString("name") %>"><%= rs2.getString("name") %></option>
				<%
			}
			wig2.closeConnections();
			wig2 = null;
		%>
	</select>
	<br>
	<br>
	
<b><font size="2" color="#990000">*</font><font size="2" color="#006699">  Date of Kudos</font></B><br>
	<br>
	<input type="radio" checked="checked" name="date" value="today" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Today</font>
	
	<input type="radio" name="date" value="yesterday" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Yesterday</font>
	
	<input type="radio" name="date" value="otherdate" onClick="showCalendarBox( 'otherdatetext' );"> <font size="2" >Other</font> <input id="popup_container" name="otherdatetext" type="text" style="visibility:hidden"/>
	<br>
	<br>

<b><font size="2" color="#990000">*</font><font size="2" color="#006699">  How many Borland Bucks Awarded, or how strong would you consider this kudo (1 low, 3 high)?</font></B><br>
	<select name="buck">
		<option value="none">-</option>
		<option value="zero">0</option>
		<option value="one">1</option>
		<option value="two">2</option>
		<option value="three">3</option>
	</select>
	<br>
	<br>

<B><font size="2" color="#006699">SFDC case number:</font></B> <br> <input type="text" name="casenumber">
	<br>
	<br>

<B><font size="2" color="#006699">How was the kudos received?</font></B><br>
	<select name="received">
		<option value="receivedempty">-</option>
		<option value="survey">Survey</option>
		<option value="email">Email</option>
		<option value="phone">Phone</option>
		<option value="verbal">Verbal</option>
		<option value="otherreceived">Other</option>
	</select>
	<br>
	<br>

<B><font size="2" color="#006699">Who did the kudos originate from?</font></B><br>
	<select name="originate">
		<option value="originateempty">-</option>
		<option value="customer">Customer</option>
		<option value="sales">Sales</option>
		<option value="support">Support</option>
		<option value="RND">R&D</option>
		<option value="otheroriginate">Other</option>
	</select>
	<br>
	<br>




<B><font size="2" color="#006699">Copy/Paste or describe the kudos:</font></B>
	<br>
	<textarea rows="5" cols="80" name="kudos"></textarea>
	<br>
	<br>

<input type="submit" value="Submit">

</FORM>


 </BODY>
</HTML>
