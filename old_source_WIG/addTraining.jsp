<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<%@ page import="java.text.DecimalFormat" %>

<HTML>
 <HEAD>
  <TITLE></TITLE>
  	<link rel="stylesheet" type="text/css" href="styles/epoch_styles.css" />
	<script type="text/javascript" src="styles/epoch_classes.js"></script>
	<script type="text/javascript">
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
<h2><font color="#006699">Log Training</font></h2>
<h3><font size="1" color="#990000"></font></h3>

<FORM METHOD=POST ACTION="AddTrainingServlet">

<b><font size="3" color="#006699">&nbsp;Employee</font></B><br>
		<select name="employee">
			<option value="employeeempty">-</option>
			<%
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

	<b><font size="3" color="#006699">Date of Training</font></B><br>
		<input type="radio" checked="checked" name="date" value="today" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Today</font>
		<input type="radio" name="date" value="yesterday" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Yesterday</font>
		<input type="radio" name="date" value="otherdate" onClick="showCalendarBox( 'otherdatetext' );"> <font size="2" >Other</font> <input id="popup_container" name="otherdatetext" type="text" style="visibility:hidden"/>
	<br>
	<br>

	<b><font size="3" color="#006699">Technical Training </font></B><br/>
			<TABLE cellspacing="1" cellpadding="5" border="3" bordercolor="#006699">
					<tr>
						<td width="50" bgcolor="#006699"><font color="white">Hours</font></td>
						<td width="430" bgcolor="#006699"><font color="white">Description</font></td>
					</tr>
					<tr>
						<td width="50" >
							<select name="techHours">
							<%
							DecimalFormat df = new DecimalFormat("#0.0");
							for (double h=0; h<=20; h = h + 0.5){
								%>
								<option value="<%= h %>"> <%= df.format(h) %></option>
								<%
							}
							%>
							</select></td>
						<td width="430"><TEXTAREA NAME="techDescription" ROWS="2" COLS="52"></TEXTAREA></td>
					</tr>
			</TABLE><br/>

		<b><font size="3" color="#006699">Borland Product Training </font></B><br/>
			<TABLE cellspacing="1" cellpadding="5" border="3" bordercolor="#006699">
					<tr>
						<td width="50" bgcolor="#006699"><font color="white">Hours</font></td>
						<td width="430" bgcolor="#006699"><font color="white">Description</font></td>
					</tr>
					<tr>
						<td width="50" >
							<select name="prodHours">
							<%
							for (double h=0; h<=20; h = h + 0.5){
								%>
								<option value="<%= h %>"> <%= df.format(h) %></option>
								<%
							}
							%>
							</select></td>
						<td width="430"><TEXTAREA NAME="prodDescription" ROWS="2" COLS="52"></TEXTAREA></td>
					</tr>
			</TABLE><br/>

		<b><font size="3" color="#006699">Soft Skills/Process Training </font></B><br/>
			<TABLE cellspacing="1" cellpadding="5" border="3" bordercolor="#006699">
					<tr>
						<td width="50" bgcolor="#006699"><font color="white">Hours</font></td>
						<td width="430" bgcolor="#006699"><font color="white">Description</font></td>
					</tr>
					<tr>
						<td width="50" >
							<select name="softHours">
							<%
							for (double h=0; h<=20; h = h + 0.5){
								%>
								<option value="<%= h %>"> <%= df.format(h) %></option>
								<%
							}
							%>
							</select></td>
						<td width="430"><TEXTAREA NAME="softDescription" ROWS="2" COLS="52"></TEXTAREA></td>
					</tr>
			</TABLE>


	<br>
	<br>
<input type="submit" value="Submit" >

</FORM>


 </BODY>
</HTML>