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

		};
	</script>
 </HEAD>

 <BODY>
	<h2><font color="#006699"> Case Closure Rates Reports</font></h2>
	
	<table cellspacing="3" cellpadding="15" border="3" bordercolor="#006699">
		<tr>
		<form METHOD=POST name="thisWeek" action="CaseClosureThisWeekServlet">
			<td width="500"><font color="#006699">Case Closure Rates This Week for:</font>
			<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#006699">Region&nbsp;</font>
			<select name="region">
				<option value="ALL">ALL</option>
				<option value="AMER">AMER</option>
				<option value="APAC">APAC</option>
				<option value="EMEA">EMEA</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#006699">Group&nbsp;</font>
			<select name="group">
				<option value="ALL">ALL</option>
				<option value="AMER">ALM</option>
				<option value="AMER">CSR</option>
				<option value="APAC">DPG</option>
			</select>
			</td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>

		<tr>
		<form METHOD=POST name="lastWeek" action="CaseClosureLastWeekServlet">
			<td width="500"><font color="#006699">Case Closure Rates Last Week for:</font>
			<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#006699">Region&nbsp;</font>
			<select name="region">
				<option value="ALL">ALL</option>
				<option value="AMER">AMER</option>
				<option value="APAC">APAC</option>
				<option value="EMEA">EMEA</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#006699">Group&nbsp;</font>
			<select name="group">
				<option value="ALL">ALL</option>
				<option value="AMER">ALM</option>
				<option value="AMER">CSR</option>
				<option value="APAC">DPG</option>
			</select>
			</td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>

		<tr>
		<form METHOD=POST name="showAll" action="CaseClosureShowAllServlet">
			<td width="500"><font color="#006699">Case Closure Rates for:</font>
			<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#006699">Region&nbsp;</font>
			<select name="region">
				<option value="ALL">ALL</option>
				<option value="AMER">AMER</option>
				<option value="APAC">APAC</option>
				<option value="EMEA">EMEA</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#006699">Group&nbsp;</font>
			<select name="group">
				<option value="ALL">ALL</option>
				<option value="AMER">ALM</option>
				<option value="AMER">CSR</option>
				<option value="APAC">DPG</option>
			</select>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from <input id="popup_container" name="fromdate" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to &nbsp;&nbsp;&nbsp;&nbsp;<input id="popup_container2" name="todate2" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='2'><i>(leave dates blank to show all)</i></font></td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>


		<tr>
		<form METHOD=POST name="employeeDates" action="CaseClosureEmployeeDatesServlet">
			<td width="500"><font color="#006699">Case Closure Rates for Employee &nbsp;</font>
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
		
			</select><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from <input id="popup_container3" name="fromdate3" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to &nbsp;&nbsp;&nbsp;&nbsp;<input id="popup_container4" name="todate4" type="text" /><font size="2"><i> &nbsp;(MM/DD/YYYY)</i></font><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='2'><i>(leave dates blank to show all)</i></font>
			</td>
			<td width="30"><input type="submit" value="Go"/></td>
		</form>
		</tr>


	</table>
	
 </BODY>
</HTML>
