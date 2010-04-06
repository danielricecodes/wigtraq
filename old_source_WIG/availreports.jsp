<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.io.File" %>
<HTML>
 <HEAD>
  <TITLE>  </TITLE>

 </HEAD>

 <BODY>

	<h2><font color="#006699">Accessibility Reports</font></h2><br/>

	<FORM METHOD=GET ACTION="AngelReportsServlet">
		<b><font size="2" color="#006699">Week Ending</font></b><br>
		<select name="endingDate">
			<option value="endingempty">-</option>
			<%
				File directory = new File("webapps\\ANGEL\\");
				String[] directoryList = directory.list();

				for(int x=0; x<directoryList.length; x++){
					if(directoryList[x].equals("groups")) {
						//skip
					}
					else{
						%>
							<option value="<%= directoryList[x] %>"><%= directoryList[x] %></option>
						<%
					}

				}

			%>
		</select><BR><BR>


		<input type="submit" value="Submit">
		
	</FORM>
	

	
 </BODY>
</HTML>
