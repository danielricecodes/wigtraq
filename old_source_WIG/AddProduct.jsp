<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>

 </HEAD>

 <BODY>
<h2><font color="#006699">Add Product</font></h2>

<FORM METHOD=POST ACTION="ProductsServlet">
<b><font size="2" color="#006699">New Product Name</font></b><br/>
	<INPUT TYPE="text" NAME="product">
	<br>
	<input type="submit" value="Submit">

</FORM>

<h2><font color="#006699">Product List</font></h2>

	
			<%
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_PRD_LIST);
			int count = 0;
			while(rs.next()){
				count++;
			}
			rs.beforeFirst();
			%>

			<TABLE border="1" cellpadding="2">
			<TR>
				<TD bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Total&nbsp;Products&nbsp;&nbsp;</b></font></TD>
				<TD bgcolor="#F2FBFF"><font size="2" color="#006699"><%= count %></font></TD>
			</TR>
			</TABLE><br/>

			<TABLE width="200" border="1" cellpadding="2">
			<TR>
				<TD width="200" bgcolor="#D0D0D0"><font size="2" color="#006699"><b>Product</b></font></TD>
			</TR>
			
			
			<%
			while(rs.next()){
			%>
			<TR>
				<TD width="200" bgcolor="#F2FBFF"><font size="-1" color="#006699"><%=rs.getString("name")%></font></TD>
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