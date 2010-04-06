<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>  </TITLE>
  	<link rel="stylesheet" type="text/css" href="styles/epoch_styles.css" />
	<script type="text/javascript" src="styles/epoch_classes.js"></script>
	<script type="text/javascript">
		/*You can also place this code in a separate file and link to it like epoch_classes.js*/
		var dp_cal;      
		window.onload = function () {
			dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
		};
	</script>
	<script language="JavaScript">

<!--  
function showCalendarBox( id ) { 
	document.all.otherdatetext.style.visibility = 'hidden'; 
	document.all.otherdatetext.value = ''; 
    document.all[ id ].style.visibility = 'visible'; 
    document.all[ id ].focus(); 
}
    -->
</script>
 </HEAD>

 <BODY>
 <h2><font color="#006699">Angel Upload</font></h2>

 <FORM ENCTYPE='multipart/form-data' method='POST' action='AngelUploadServlet'>

	<b><font size="2" color="#006699">  Timeframe of Angel Reports</font></B><br>
	<br>
	<input type="radio" checked="checked" name="date" value="lastWeek" onClick="showCalendarBox( 'zzz' );"> <font size="2" >Last Week</font>
	
	<input type="radio" name="date" value="otherdate" onClick="showCalendarBox( 'otherdatetext' );"> <font size="2" >Other Week <font size="1"><i>(choose any date within the week)</font></font><BR><input id="popup_container" name="otherdatetext" type="text" style="visibility:hidden"/>
	<br>
	<br>

	 <TABLE>
	 <TR>
		<TD><font color="#006699">CSR Agent Stats Report</font></TD>
		<TD><INPUT TYPE='file' NAME='mptest1'></TD>
	 </TR>
	 <TR>
		<TD><font color="#006699">CSR Agent Activity Report</font></TD>
		<TD><INPUT TYPE='file' NAME='mptest2'></TD>
	 </TR>
	 <TR>
		<TD><font color="#006699">TSE Agent Stats Report</font></TD>
		<TD><INPUT TYPE='file' NAME='mptest3'></TD>
	 </TR>
	 <TR>
		<TD><font color="#006699">TSE Agent Activity Report</font></TD>
		<TD><INPUT TYPE='file' NAME='mptest4'></TD>
	 </TR>
	  <TR>
		<TD><font color="#006699">Support Contracts Agent Stats Report</font></TD>
		<TD><INPUT TYPE='file' NAME='mptest5'></TD>
	 </TR>
	  <TR>
		<TD><font color="#006699">Support Contracts Agent Activity Report</font></TD>
		<TD><INPUT TYPE='file' NAME='mptest6'></TD>
	 </TR>
	 </TABLE>
	<br/>
	<INPUT TYPE='submit' VALUE='upload'>

</FORM>
<BR><BR>
 <font color="#006699"><i>Notes about Angel Uploads:
<UL>
	<LI> Each of the 6 reports should be generated directly from Angel and untouched.
	<LI> Browse to each of the six reports on your local computer (all 6 are required).
	<LI> Once all reports have been selected, click upload.
	<LI> You can name each Excel file anything you want, as long as none have the same name.
	<LI> You must insure that the reports contain the desired date range before upload.
	<LI> Be careful to upload each of the 6 reports (and not 2 or more of the same report).
	<LI> If you upload more than once for a particular week, your prior upload results will be purged.
	<LI> One report is generated for every group that exists before upload.  
	<LI> If you define a new group, you will have to re-upload the angel reports for the report to be generated for that group.
	<LI> If the format of any of the 6 Angel reports changes (i.e. an added column), the upload will not work.
	<LI> If anyone’s Angel name changes (i.e. “Ryan Tsai-CA”) then its not going to generate reports for any group that this person is a member of.  It will also not count time off for that person.
	<LI> <B>If anything is changed in Angel, let me know so I can make necessary changes to fix it.<B>

 </UL>
 </i></font>
  
 </BODY>
</HTML>
