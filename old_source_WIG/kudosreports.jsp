<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<HTML>
 <HEAD>
  <TITLE>  </TITLE>
	<link rel="stylesheet" type="text/css" href="styles/epoch_styles.css" />
	<script type="text/javascript" src="styles/epoch_classes.js"></script>
	<script type="text/javascript">
		/*You can also place this code in a separate file and link to it like epoch_classes.js*/
		var dp_cal,dp_cal2,dp_cal3,dp_cal4,dp_cal5,dp_cal6;      
		window.onload = function () {
			dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
			dp_cal2  = new Epoch('epoch_popup','popup',document.getElementById('popup_container2'));
			dp_cal3  = new Epoch('epoch_popup','popup',document.getElementById('popup_container3'));
			dp_cal4  = new Epoch('epoch_popup','popup',document.getElementById('popup_container4'));
			dp_cal5  = new Epoch('epoch_popup','popup',document.getElementById('popup_container5'));
			dp_cal6  = new Epoch('epoch_popup','popup',document.getElementById('popup_container6'));
		};
	</script>
 </HEAD>

 <BODY>
	<h2><font color="#006699">Kudos Reports</font></h2>
	
	<table cellspacing="3" cellpadding="15" border="3" bordercolor="#006699">
		<tr>
		<form METHOD=POST name="thisWeek" action="ThisWeekServlet">
			<td width="500"><font color="#006699">All Kudos This Week for Region &nbsp;</font>
			<select name="region">
				<option value="AMER">AMER</option>
				<option value="APAC">APAC</option>
				<option value="EMEA">EMEA</option>
				<option value="ALL">ALL</option>
			</select>
			<br><font size='2'><i>(Sunday through Saturday)</i></font>
			</td>

			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>

		<tr>
		<form METHOD=POST name="thisWeek" action="LastWeekServlet">
			<td width="500"><font color="#006699">All Kudos Last Week for Region &nbsp;</font>
			<select name="region">
				<option value="AMER">AMER</option>
				<option value="APAC">APAC</option>
				<option value="EMEA">EMEA</option>
				<option value="ALL">ALL</option>
			</select>
			<br><font size='2'><i>(Sunday through Saturday)</i></font></td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>

		<tr>
		<form METHOD=POST name="showAll" action="ShowAllServlet">
			<td width="500"><font color="#006699">All Kudos for Region&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			<select name="region">
				<option value="AMER">AMER</option>
				<option value="APAC">APAC</option>
				<option value="EMEA">EMEA</option>
				<option value="ALL">ALL</option>
			</select>
			<br>
			from <input id="popup_container" name="fromdate" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			to &nbsp;&nbsp;&nbsp;&nbsp;<input id="popup_container2" name="todate2" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			<font size='2'><i>(leave dates blank to show all)</i></font></td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>


		<tr>
		<form METHOD=POST name="employeeDates" action="EmployeeDatesServlet">
			<td width="500"><font color="#006699">All Kudos for Employee &nbsp;</font>
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
				%>
		
			</select><br>
			from <input id="popup_container3" name="fromdate3" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			to &nbsp;&nbsp;&nbsp;&nbsp;<input id="popup_container4" name="todate4" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			<font size='2'><i>(leave dates blank to show all)</i></font>
			</td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>

		<tr>
		<form METHOD=POST name="teamDates" action="KudosManagerDatesServlet">
			<td width="500"><font color="#006699">All Kudos for&nbsp;&nbsp;&nbsp;</font>
			<select name="manager">
				<option value="managereempty">-</option>
		<%
			//add code to query db for manager names to populate drop down list
			WIGDB wig2 = new WIGDB();
			ResultSet rs2 = wig2.selectRecords(wig.SQL_MGR_LIST);
			
			while(rs2.next()){
				%>
				<option value="<%= rs2.getString("manager") %>"><%= rs2.getString("manager") %></option>
				<%
			}
		%>
			</select><font color="#006699">&nbsp;'s Team</font><br>
			from <input id="popup_container5" name="fromdate5" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			to &nbsp;&nbsp;&nbsp;&nbsp;<input id="popup_container6" name="todate6" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			<font size='2'><i>(leave dates blank to show all)</i></font>
			</td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>

	</table>
	
 </BODY>
</HTML>
