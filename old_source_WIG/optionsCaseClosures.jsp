<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.borland.support.wig.util.WIGDB" %>
<%@ page import="java.text.DecimalFormat" %>
<HTML>
 <HEAD>
  <TITLE></TITLE>

 </HEAD>

 <BODY>

<h2><font color="#006699">Quality and Responsiveness Options</font></h2>

<h3><font color="#006699"><b>Case Closure Goals and Weights:</b></font></h3>

			<%
			WIGDB wig = new WIGDB();
			ResultSet rs = wig.selectRecords(wig.SQL_CLOSE_VARIABLES);
			int AMER_TSE_DAY_GOAL = 0;
			int AMER_TSE_WEEK_GOAL = 0;
			int AMER_TSE_MONTH_GOAL = 0;
			int AMER_CSR_DAY_GOAL = 0;
			int AMER_CSR_WEEK_GOAL = 0;
			int AMER_CSR_MONTH_GOAL = 0;

			double AMER_TSE_DAY_WEIGHT = 0.0;
			double AMER_TSE_WEEK_WEIGHT = 0.0;
			double AMER_TSE_MONTH_WEIGHT = 0.0;
			double AMER_CSR_DAY_WEIGHT = 0.0;
			double AMER_CSR_WEEK_WEIGHT = 0.0;
			double AMER_CSR_MONTH_WEIGHT = 0.0;

			while(rs.next()){
				if (rs.getString("region").equals("AMER")){
					if (rs.getString("role").equals("TSE")){
						if (rs.getString("timeframe").equals("Day")){
							AMER_TSE_DAY_GOAL = rs.getInt("Goal");
							AMER_TSE_DAY_WEIGHT = rs.getDouble("Weight");
						}
						else if (rs.getString("timeframe").equals("Week")){
							AMER_TSE_WEEK_GOAL = rs.getInt("Goal");
							AMER_TSE_WEEK_WEIGHT = rs.getDouble("Weight");
						}
						else if (rs.getString("timeframe").equals("Month")){
							AMER_TSE_MONTH_GOAL = rs.getInt("Goal");
							AMER_TSE_MONTH_WEIGHT = rs.getDouble("Weight");
						}
						else{
						}
					}
					else if (rs.getString("role").equals("CSR")){
						if (rs.getString("timeframe").equals("Day")){
							AMER_CSR_DAY_GOAL = rs.getInt("Goal");
							AMER_CSR_DAY_WEIGHT = rs.getDouble("Weight");
						}
						else if (rs.getString("timeframe").equals("Week")){
							AMER_CSR_WEEK_GOAL = rs.getInt("Goal");
							AMER_CSR_WEEK_WEIGHT = rs.getDouble("Weight");
						}
						else if (rs.getString("timeframe").equals("Month")){
							AMER_CSR_MONTH_GOAL = rs.getInt("Goal");
							AMER_CSR_MONTH_WEIGHT = rs.getDouble("Weight");
						}
						else{
						}
					}
					
				}
				else if (rs.getString("region").equals("APAC")){
					
				}
				else if (rs.getString("region").equals("EMEA")){
					
				}
				else{
				}
			}
			%>

				






<TABLE width="750" border="1" cellpadding="2">


<TR>
	<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b><center>Region</center></b></font></TD>
	<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b><center>Role</center></b></font></TD>
	<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b><center>Timeframe</center></b></font></TD>
	<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b><center>Goal</center></b></font></TD>
	<TD width="150" bgcolor="#D0D0D0"><font size="2" color="#006699"><b><center>Weight</center></b></font></TD>
</TR>


<TR>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>AMER</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>TSE</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>Next Business Day</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_TSE_DAY_GOAL%>&nbsp;%</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_TSE_DAY_WEIGHT%>&nbsp;%</center></font></TD>
</TR>

<TR>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>AMER</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>TSE</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>5 Business Days</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_TSE_WEEK_GOAL%>&nbsp;%</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_TSE_WEEK_WEIGHT%>&nbsp;%</center></font></TD>
</TR>

<TR>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>AMER</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>TSE</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>1 Month</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_TSE_MONTH_GOAL%>&nbsp;%</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_TSE_MONTH_WEIGHT%>&nbsp;%</center></font></TD>
</TR>

<TR>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>AMER</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>CSR</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>Next Business Day</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_CSR_DAY_GOAL%>&nbsp;%</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_CSR_DAY_WEIGHT%>&nbsp;%</center></font></TD>
</TR>

<TR>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>AMER</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>CSR</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>5 Business Days</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_CSR_WEEK_GOAL%>&nbsp;%</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_CSR_WEEK_WEIGHT%>&nbsp;%</center></font></TD>
</TR>

<TR>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>AMER</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>CSR</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center>1 Month</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_CSR_MONTH_GOAL%>&nbsp;%</center></font></TD>
	<TD width="150" bgcolor="#F2FBFF"><font size="-1" color="#006699"><center><%=AMER_CSR_MONTH_WEIGHT%>&nbsp;%</center></font></TD>
</TR>

</TABLE>

</br>

<h3><font color="#006699"><b>Case Closure YTD start date:</b></font></h3>
		<%
			wig.closeConnections();
			wig = null;
			rs = null;

			String date = "";

			wig = new WIGDB();
			rs = wig.selectRecords(WIGDB.SQL_CASE_CLOSURE_YTD);
			

			while(rs.next()){
				date = rs.getString("date");
				//of the form YYYY-MM-DD

			}
			//change to form MM/DD/YYYY
			date = date.substring(5, 7) + "/" + date.substring(8, 10) + "/" + date.substring(0, 4);

		%>
		<TABLE width="100" border="1" cellpadding="2">
			<TR>
				<TD bgcolor="#D0D0D0" width="100"><font size="-1" color="#006699"><CENTER>YTD Date</CENTER></font></TD>
			</TR>
			<TR>
				<TD bgcolor="#F2FBFF" width="100"><font size="-1" color="#006699"><CENTER><%= date %></CENTER></font></TD>
			</TR>
		</TABLE>

		<font color="#006699"><i>NOTE:  TSE and CSR weights are calculated from total case closures which start at the YTD date. 
		<br/>If a report is run that includes a "from" or "start" date before <%= date %>, 
		<br/>then the TSE and CSR weights are calculated from the larger date range.</i></font>


		<%
			wig.closeConnections();
			wig = null;
			rs = null;

			double overall_RED = 0;
			double overall_GREEN = 0;
			double alm_bms_RED = 0;
			double alm_bms_GREEN = 0;
			double dpg_RED = 0;
			double dpg_GREEN = 0;
			double csr_RED = 0;
			double csr_GREEN = 0;

			wig = new WIGDB();
			rs = wig.selectRecords(wig.SQL_CLOSE_RATES);
			DecimalFormat df_0 = new DecimalFormat("#0");

			while(rs.next()){
				if(rs.getString("resolutionRate").equals("Overall")){
					overall_RED = rs.getDouble("red");
					overall_GREEN = rs.getDouble("green");
				}
				else if(rs.getString("resolutionRate").equals("ALM_BMS")){
					alm_bms_RED = rs.getDouble("red");
					alm_bms_GREEN = rs.getDouble("green");
				}
				else if(rs.getString("resolutionRate").equals("DPG")){
					dpg_RED = rs.getDouble("red");
					dpg_GREEN = rs.getDouble("green");
				}
				else if(rs.getString("resolutionRate").equals("CSR")){
					csr_RED = rs.getDouble("red");
					csr_GREEN = rs.getDouble("green");
				}
				else{
				}

			}


		%>


</br>
<h3><font color="#006699"><b>Case Closure Rates:</b></font></h3>
<TABLE width="200" border="1" cellpadding="2">
	<TR>
		<TD bgcolor="#D0D0D0" width="100"><font size="-1" color="#006699"><CENTER>Group</CENTER></font></TD>
		<TD bgcolor="#D0D0D0" width="100"><font size="-1" color="#006699"><CENTER>Rate</CENTER></font></TD>
	</TR>
	<TR>
		<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><CENTER>Overall</CENTER></font></TD>
		<TD width="100" bgcolor="#F2FBFF"><center>
			<TABLE>
				<TR>
					<TD bgcolor="#F00000"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(overall_RED) %>% or less</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#F2F200"><FONT SIZE="2" COLOR="black"><CENTER><%= df_0.format((overall_RED)+1) %>% to <%= df_0.format((overall_GREEN) - 1) %>%</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#009B4E"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(overall_GREEN) %>% or more</CENTER></FONT></TD>
				</TR>
			</TABLE></center>
		</TD>
	</TR>
	<TR>
		<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><CENTER>ALM/BMS</CENTER></font></TD>
		<TD width="100" bgcolor="#F2FBFF"><center>
			<TABLE>
				<TR>
					<TD bgcolor="#F00000"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(alm_bms_RED) %>% or less</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#F2F200"><FONT SIZE="2" COLOR="black"><CENTER><%= df_0.format((alm_bms_RED)+1) %>% to <%= df_0.format((alm_bms_GREEN) - 1) %>%</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#009B4E"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(alm_bms_GREEN) %>% or more</CENTER></FONT></TD>
				</TR>
			</TABLE></center>
		</TD>
	</TR>
	<TR>
		<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><CENTER>CSR</CENTER></font></TD>
		<TD width="100" bgcolor="#F2FBFF"><center>
			<TABLE>
				<TR>
					<TD bgcolor="#F00000"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(csr_RED) %>% or less</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#F2F200"><FONT SIZE="2" COLOR="black"><CENTER><%= df_0.format((csr_RED)+1) %>% to <%= df_0.format((csr_GREEN) - 1) %>%</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#009B4E"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(csr_GREEN) %>% or more</CENTER></FONT></TD>
				</TR>
			</TABLE></center>
		</TD>
	</TR>
	<TR>
		<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><CENTER>DPG</CENTER></font></TD>
		<TD width="100" bgcolor="#F2FBFF"><center>
			<TABLE>
				<TR>
					<TD bgcolor="#F00000"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(dpg_RED) %>% or less</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#F2F200"><FONT SIZE="2" COLOR="black"><CENTER><%= df_0.format((dpg_RED)+1) %>% to <%= df_0.format((dpg_GREEN) - 1) %>%</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#009B4E"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(dpg_GREEN) %>% or more</CENTER></FONT></TD>
				</TR>
			</TABLE></center>
		</TD>
	</TR>
</TABLE>

<BR/>

<%
			wig.closeConnections();
			wig = null;
			rs = null;

			double cr_RED = 0;
			double cr_GREEN = 0;

			wig = new WIGDB();
			rs = wig.selectRecords(wig.SQL_CASE_REVIEW_RATES);
			

			while(rs.next()){
				if(rs.getString("rate").equals("Case Reviews")){
					cr_RED = rs.getDouble("red");
					cr_GREEN = rs.getDouble("green");
				}
				
				else{
				}

			}



			%>

<h3><font color="#006699"><b>Case Review Rates:</b></font></h3>
<TABLE width="200" border="1" cellpadding="2">
	<TR>
		<TD bgcolor="#D0D0D0" width="100"><font size="-1" color="#006699"><CENTER>Group</CENTER></font></TD>
		<TD bgcolor="#D0D0D0" width="100"><font size="-1" color="#006699"><CENTER>Rate</CENTER></font></TD>
	</TR>
	<TR>
		<TD width="100" bgcolor="#F2FBFF"><font size="-1" color="#006699"><CENTER>Case Reviews</CENTER></font></TD>
		<TD width="100" bgcolor="#F2FBFF"><center>
			<TABLE>
				<TR>
					<TD bgcolor="#F00000"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(cr_RED) %>% or less</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#F2F200"><FONT SIZE="2" COLOR="black"><CENTER><%= df_0.format((cr_RED)+1) %>% to <%= df_0.format((cr_GREEN) - 1) %>%</CENTER></FONT></TD>
				</TR>
				<TR>
					<TD bgcolor="#009B4E"><FONT SIZE="2" COLOR="white"><CENTER><%= df_0.format(cr_GREEN) %>% or more</CENTER></FONT></TD>
				</TR>
			</TABLE></center>
		</TD>
	</TR>
	</TABLE>

<h3><font color="#006699"><b>Update Goals and Weights:</b></font></h3>
<font color="#006699"><i>(Under Construction)</i></font>

<h3><font color="#006699"><b>Update Case Closure YTD:</b></font></h3>
<font color="#006699"><i>(Under Construction)</i></font>
</br>
<h3><font color="#006699"><b>Update Closure Rates:</b></font></h3>
<font color="#006699"><i>(Under Construction)</i></font>

<h3><font color="#006699"><b>Update Case Review Rates:</b></font></h3>
<font color="#006699"><i>(Under Construction)</i></font>







		<%
			AMER_TSE_DAY_GOAL = 0;
			AMER_TSE_WEEK_GOAL = 0;
			AMER_TSE_MONTH_GOAL = 0;
			AMER_CSR_DAY_GOAL = 0;
			AMER_CSR_WEEK_GOAL = 0;
			AMER_CSR_MONTH_GOAL = 0;
			AMER_TSE_DAY_WEIGHT = 0.0;
			AMER_TSE_WEEK_WEIGHT = 0.0;
			AMER_TSE_MONTH_WEIGHT = 0.0;
			AMER_CSR_DAY_WEIGHT = 0.0;
			AMER_CSR_WEEK_WEIGHT = 0.0;
			AMER_CSR_MONTH_WEIGHT = 0.0;
			overall_RED = 0;
			overall_GREEN = 0;
			alm_bms_RED = 0;
			alm_bms_GREEN = 0;
			dpg_RED = 0;
			dpg_GREEN = 0;
			csr_RED = 0;
			csr_GREEN = 0;
			cr_RED = 0;
			cr_GREEN = 0;
			date = "";
			wig.closeConnections();
			wig = null;
			rs = null;
		%>




		<br/>
		<br/>

 </BODY>
</HTML>