<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>

<HTML>
 <HEAD>
  <TITLE>  </TITLE>
 </HEAD>
 <BODY>
 <%
	String group = request.getParameter("group");
 %>

	<h2><font color="#006699">The following agents are in the "<%= group %>" group:</font></h2><br/>
	<%
	File file = new File("webapps\\ANGEL\\groups\\" + group);
	FileReader read = new FileReader(file);
	BufferedReader br = new BufferedReader(read); 
	String s;
	while((s = br.readLine()) != null) {
		%>
			<font size="2" color="#006699"><%= s %></font><BR>
		<%
	} 
								
	read.close();
	%>

 </BODY>
 </HTML>