<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>

 </HEAD>

 <BODY>
<h2><font color="#006699">Training Options</font></h2>

<h3><font color="#006699"><b>Baselines:</b></font></h3>

			<%
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_BASELINES);
			int amer = 0;
			int apac = 0;
			int emea = 0;
			while(rs.next()){
				if (rs.getString("region").equals("AMER")){
					amer = rs.getInt("b_training");
				}
				else if (rs.getString("region").equals("APAC")){
					apac = rs.getInt("b_training");
				}
				else if (rs.getString("region").equals("EMEA")){
					emea = rs.getInt("b_training");
				}
				else{
				}
			}
			%>

				






<TABLE width="150" border="0" cellpadding="2">


<TR>
	<TD width="50" bgcolor="#F2FBFF"><font size="2" color="#006699"><b>AMER</b></b></font></TD>
	<TD width="50"><font size="2" color="#006699"><center><%=amer%></center></font></TD>
</TR>


<TR>
	<TD width="50" bgcolor="#F2FBFF"><font size="2" color="#006699"><b>APAC</b></b></font></TD>
	<TD width="50"><font size="2" color="#006699"><center><%=apac%></center></font></TD>
</TR>

<TR>
	<TD width="50" bgcolor="#F2FBFF"><font size="2" color="#006699"><b>EMEA</b></b></font></TD>
	<TD width="50"><font size="2" color="#006699"><center><%=emea%></center></font></TD>
</TR>


<TR>
	<TD width="100"><font size="3" color="#006699"><b>Total</b></font></TD>
	<TD><font size="2" color="#006699"><center><%=(amer + apac + emea)%></center></font></TD>
</TR>


</TABLE>

<h3><font color="#006699"><b>Update Baseline:</b></font></h3>

<FORM METHOD=POST ACTION="UpdateTrainingBaselinesServlet">
<INPUT TYPE="radio" VALUE="AMER" NAME="region"><font size="2" color="#006699">AMER</font>
<INPUT TYPE="radio" VALUE="APAC" NAME="region"><font size="2" color="#006699">APAC</font>
<INPUT TYPE="radio" VALUE="EMEA" NAME="region"><font size="2" color="#006699">EMEA</font>
<br/>
<br/>

<font size="2" color="#006699">Enter new baseline:</font>
<INPUT TYPE="text" NAME="new_baseline"><font size="2" color="#006699"><i>(Integers only)</i></font><br/><br/>
<INPUT TYPE="submit" value="Submit">
	
</FORM>





			<%

			wig.closeConnections();
			wig = null;
			rs = null;
			amer = 0;
			apac = 0;
			emea = 0;
		%>




		<br/>
		<br/>

 </BODY>
</HTML>