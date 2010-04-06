<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<HTML>
 <HEAD>
  <TITLE>  </TITLE>
 </HEAD>

 <BODY>
	<h2><font color="#006699">View Groups</font></h2><br/>
	<FORM METHOD=POST ACTION="angelViewGroup.jsp">
		<b><font size="2" color="#006699">Choose a group and click "View" to see agents in that group.</font></b><br><BR>
		<select name="group">
			<option value="groupEmpty">-</option>
	
	<%

			File GROUPS = new File("webapps\\ANGEL\\groups");
			String[] group_list = GROUPS.list();
			for(int x = 0; x<group_list.length; x++){
				if(group_list[x].equals("ANGEL_LIST")){
					//skip
				}
				else{
					%>
					<option value="<%= group_list[x] %>"><%= group_list[x] %></option>
					<%
				}
			}

		%>
		</select>
		<BR><BR>
		<i><font size="2" color="#006699">Reports are calculated for pre-existing groups upon Angel reports upload.</font></i>
		<BR><BR>
		<INPUT TYPE="submit" VALUE="View">
		</FORM><BR>

	<h2><font color="#006699">Add a Group</font></h2><br/>

	<FORM METHOD=POST ACTION="AngelCreateGroupServlet">
		<b><font size="2" color="#006699">Group Name</font></b><br>
		<INPUT TYPE="text" NAME="groupName"><i><font size="2" color="#006699">&nbsp;No spaces or punctuation</font></i><BR><BR>

		<b><font size="2" color="#006699">Check the box next to the names to include in the group:</font></b><br>
		<%
			File ANGEL_LIST = new File("webapps\\ANGEL\\groups\\ANGEL_LIST");
			FileReader ANGEL_LIST_READER = new FileReader(ANGEL_LIST);
			BufferedReader br = new BufferedReader(ANGEL_LIST_READER); 
			String s;
			while((s = br.readLine()) != null) {
				%>

				<font size="2" color="#006699"><INPUT TYPE="checkbox" NAME="<%= s %>"><%= s %></font><BR>
				<%
			} 
								
			ANGEL_LIST_READER.close();


		%>

		<BR><INPUT TYPE="Submit" VALUE="Submit">
		
	</FORM>
	



	
 </BODY>
</HTML>

