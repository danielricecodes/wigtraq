<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>

 </HEAD>

 <BODY>
<h2><font color="#006699">Add Manager</font></h2>
<h3><font size="1" color="#990000"><i>(* Required field)</i></font></h3>

<FORM METHOD=POST ACTION="ManagerServlet">
<b><font size="2" color="#990000">*</font><font size="2" color="#006699">&nbsp;Manager Name</font></b><br/>
	<INPUT TYPE="text" NAME="name">
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


<br/>
	<h2><font color="#006699">Manager List</font></h2>

	
			<%
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_MGR_DETAILS);
			int count = 0;
			while(rs.next()){
				count++;
			}
			rs.beforeFirst();
			%>

			<TABLE border="1" cellpadding="2">
			<TR>
				<TD bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Total&nbsp;Managers&nbsp;&nbsp;</b></font></TD>
				<TD bgcolor="#F2FBFF"><font size="2" color="#006699"><%= count %></font></TD>
			</TR>
			</TABLE><br/>

			<TABLE width="600" border="1" cellpadding="2">
			<TR>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Manager</b></font></TD>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Region</b></font></TD>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Email Address</b></font></TD>
			</TR>
			
			
			<%
			while(rs.next()){
			%>
			<TR>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("manager")%></font></TD>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("region")%></font></TD>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("email")%></font></TD>
			</TR>
				
			<%
			}
			wig.closeConnections();
			wig = null;
		%>
		</TABLE>

		<br/>
		<br/>
 </BODY>
</HTML>