<cfquery name="getsessions" datasource="****DATASOURCENAME*****">
  select session_day,session_name,utctime,speakers
  from tbl_schedule
  ORDER BY session_day,displayorder
</cfquery>
<br /><br />
<cfset counter = 0 />
<cfoutput group="session_day" query="getsessions"  groupcasesensitive="no">
<div class="divider">
	<span class="section_name">#session_day#</span>
</div>
  	<cfoutput>
	<div class="session-info">
		<cfset n = dateconvert("local2utc",getsessions.utctime)>
		
        <span class="time" id="time#counter#"></span>
		<script>
			d = new Date();
			d.setUTCHours(#timeformat(n, "H")#);
			d.setUTCMinutes(#timeformat(n, "m")#);
			timestring = d.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit"});
			document.getElementById("time#counter#").innerHTML = timestring;
		</script>
        <span class="session-title">#getsessions.session_name#</span><br />
        <span class="session-speakers">#getsessions.speakers#</span>
      </div>
	  <cfset counter++ />
  </cfoutput>
	
</cfoutput>
<!---
<br /><br />
<cfdump var="#getSessions#" />--->