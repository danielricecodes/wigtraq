<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>

 </HEAD>

 <BODY>
<h2><font color="#006699">Add Employee</font></h2>
<h3><font size="1" color="#990000"><i>(* Required field)</i></font></h3>

<FORM METHOD=POST ACTION="EmployeeServlet">
<b><font size="2" color="#990000">*</font><font size="2" color="#006699">&nbsp;Employee Name</font></b><br/>
	<INPUT TYPE="text" NAME="name">
	<br>
	<br>



<b><font size="2" color="#990000">*</font><font size="2" color="#006699">&nbsp;Manager</font></B><br>
	<select name="manager">
		<option value="managerempty">-</option>
		<%
			//add code to query db for manager names to populate drop down list
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_MGR_LIST);
			
			while(rs.next()){
				%>
				<option value="<%= rs.getString("manager") %>"><%= rs.getString("manager") %></option>
				<%
			}
			wig.closeConnections();
			wig = null;
		%>
		

		
	</select>
	<br>
	<br>
	


<b><font size="2" color="#990000">*</font><font size="2" color="#006699">&nbsp;Region</font></B><br>
	<select name="region">
		<option value="regionempty">-</option>
		<option value="AMER">AMER</option>
		<option value="EMEA">EMEA</option>
		<option value="APAC">APAC</option>
	</select>
	<br>
	<br>

<B><font size="2" color="#990000">*</font><font size="2" color="#006699">&nbsp;Email Address</font></B> <br> <input type="text" name="email">
	<br>
	<br>



<input type="submit" value="Submit">

</FORM>
<BR/>

	<h2><font color="#006699">Employee List</font></h2>

	
			<%
			WIGDB wig2 = new WIGDB();
			ResultSet rs2 = wig2.selectRecords(wig2.SQL_EMPLOYEE_DETAILS);
			int count = 0;
			while(rs2.next()){
				count++;
			}
			rs2.beforeFirst();
			%>

			<TABLE border="1" cellpadding="2">
			<TR>
				<TD bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Total&nbsp;Employees&nbsp;&nbsp;</b></font></TD>
				<TD bgcolor="#F2FBFF"><font size="2" color="#006699"><%= count %></TD>
			</TR>
			</TABLE><br/>

			<TABLE width="600" border="1" cellpadding="2">
			<TR>
				<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Employee</b></font></TD>
				<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Manager</b></font></TD>
				<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Region</b></font></TD>
				<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Email&nbsp;Address</b></font></TD>
			</TR>
			
			
			<%
			while(rs2.next()){
			%>
			<TR>
				<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("employee")%></font></TD>
				<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("manager")%></font></TD>
				<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("region")%></font></TD>
				<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs2.getString("email")%></font></TD>
			</TR>
				
			<%
			}
			wig2.closeConnections();
			wig2 = null;
		%>
		</TABLE>
		<br/>
		<br/>


 </BODY>
</HTML>