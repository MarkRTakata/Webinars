

<cfscript>
graphqlvalue='{"query": "{beatbobbyflay { airdate contestant1 contestant2 dish genres guest1 guest2 guest3 ingredients judge1 judge2 judge3 numOverall numWithinSeason season title winner }}"}';
cfhttp(url="https://api.baseql.com/gsheets/graphql/#request.baseqlapikey#", method="post", result="result")
{
cfhttpparam(name="Accept", type="header", value="application/json");
cfhttpparam(name="Content-Type", type="header", value="application/json");
cfhttpparam(type="body", value=#graphqlvalue#);
}

result = deserializeJSON(result.fileContent) ;

resultArray = result.data.beatbobbyflay;
resultJSON = serializeJSON(resultArray);

function arrayToQuery(data) {
    return data.reduce(function(accumulator, element) {
        element.each(function(key) {
            if (!accumulator.keyExists(key)) {
                accumulator.addColumn(key, []);
            }
        });
        accumulator.addRow(element);
        return accumulator;
    }, QueryNew(""));
}
resultQuery = arrayToQuery(resultArray);

</cfscript>

<cfquery name="resultQuery" dbtype="query">
SELECT * from resultQuery
WHERE Guest2 != ''

</cfquery>

<cfquery name="chartquery" dbtype="query">
select * from resultQuery
WHERE 1 = 1

</cfquery>

<cfquery name="getWinners" dbtype="query">
  select distinct winner from resultQuery
  WHERE 1=1
  
</cfquery>

<cfquery name="chartquerybobbyperc" dbtype="query">
select * from resultQuery
where winner='Bobby Flay'

</cfquery>

<cfquery name="countGenres" dbtype="query">
  SELECT genres, COUNT(*) as genresCount
  FROM resultQuery
  
  GROUP BY genres
  ORDER BY genresCount DESC
</cfquery>

<cfquery name="countGuest1Success" dbtype="query">
  SELECT guest1, COUNT(*) as guest1Count
  FROM resultQuery
  WHERE winner <> 'Bobby Flay'
  
  GROUP BY guest1
  ORDER BY guest1Count DESC
</cfquery>

<cfquery name="countGuest2Success" dbtype="query">
  SELECT guest2, COUNT(*) as guest2Count
  FROM resultQuery
  WHERE winner != 'Bobby Flay'
  
  AND guest2 != ''
  GROUP BY guest2
  ORDER BY guest2Count DESC
</cfquery>

<cfset guestSuccessArray = ArrayNew(1) />

<cfoutput query="countGuest1Success" maxrows="10">
  <cfquery name="matchGuest2" dbtype="query">
    SELECT * FROM countGuest2Success
    WHERE guest2 = '#countGuest1Success.guest1#'
  </cfquery>
  <cfset guestSuccessTotal = 0 />
<cfif isDefined("matchGuest2.guest2Count") AND matchGuest2.guest2Count IS NOT NULL>
  <cfset guestSuccessTotal = #guest1Count# + #matchGuest2.guest2Count# />
<cfelse>  
  <cfset guestSuccessTotal = #guest1Count# />
</cfif>  
  <cfset ArrayAppend(guestSuccessArray,["#guest1#",#guestSuccessTotal#]) />
  <cfscript>
    guestSuccessQuery = QueryNew("guest,wincount");
    for (i=1; i LTE ArrayLen(guestSuccessArray); i=i+1) {
      newRow = QueryAddRow(guestSuccessQuery);
      QuerySetCell(guestSuccessQuery, "guest", #guestSuccessArray[i][1]# );
      QuerySetCell(guestSuccessQuery, "wincount", #guestSuccessArray[i][2]# );
    }
  </cfscript>
  <cfquery name="qsort" dbtype="query">
    SELECT * 
    FROM guestSuccessQuery
    ORDER BY wincount DESC
  </cfquery>
</cfoutput>
<cfscript>
totalNumberOfShows = chartquery.recordCount();
bobbyFlayWinPerc = numberFormat((chartquerybobbyperc.recordCount() / totalNumberOfShows) * 100);
everyoneelsewinperc = 100-bobbyFlayWinPerc;
</cfscript>
<style>
* {font-family: verdana;}
</style>
<cfdocument format="pdf">

  <h1 style="font-family: arial;">Beat Bobby Flay:</h1> <h2 style="font-family: arial;color: maroon;" class="display-2">Stats & Figures</h2>
<br />
      <div style="width: 100%; background-color: #efefef;text-align: center; border: solid 1px #666; border-radius: 10px;">
      <h1 style="font-family: arial;">Win Percentage</h1>
      <h4 style="font-family: arial;margin-bottom: -20px;color: steelblue; font-size: 25px">Bobby Flay</h4>
      <span style="font-family: arial;font-size: 100px; color: steelblue; padding-top: -40px;"><cfoutput>#bobbyFlayWinPerc#</cfoutput></span><span style="position: relative;top: -50px;font-size: 30px;">%</span>
      <div style="font-family: arial;width: 100%; background-color: #efefef;text-align: center; border: solid 1px #666; border-radius: 10px;">
      <h1>Top 5 Guest Winners</h1>
      <span style="font-family: arial;font-size: 16px; color: steelblue; line-height: 30px;">
      <cfoutput query="qsort" maxrows="5">
        #guest# with #wincount# wins<br />
      </cfoutput>
      </span>
</div></div>
<cfchart format="png" font="Sans-serif" fontBold="no" pieslicestyle="solid" showlegend="false" title="" chartHeight="250" showBorder="no" chartWidth="600" show3d="true">
  <cfchartseries type="pie" dataLabelStyle="columnLabel">
    <cfoutput query="countGenres" maxrows="10">
      <cfchartdata item="#genres#" value=#genresCount#>
    </cfoutput>
  </cfchartseries>
</cfchart>
<div style="page-break-before : always;page-break-after : always;"></div>
<table id="resulttable" class="display" style="font-family: arial; font-size: 12px">
    <thead>
        <tr>
            <th>Contestant 1</th>
            <th>Contestant 2</th>
            <th>Secret Ingredient</th>
            <th>Guest 1</th>
            <th>Guest 2</th>
            <th>Dish</th>
            <th>Winner</th>
        </tr>
    </thead>

        <cfset breaktimer = 0>
      <cfoutput query="resultQuery">
        <cfif guest2 NEQ "">
        <cfif breaktimer EQ 40>
        <cfset breaktimer = 0>
       </tbody>
       </table>
       <div style="page-break-before : always;page-break-after : always;"></div>
       <table id="resulttable" class="display" style="font-family: arial; font-size: 12px">
            <thead> 
        <tr>
            <th>Contestant 1</th>
            <th>Contestant 2</th>
            <th>Secret Ingredient</th>
            <th>Guest 1</th>
            <th>Guest 2</th>
            <th>Dish</th>
            <th>Winner</th>
        </tr>
        </thead>
        </cfif>    <tbody>
        <tr>
          <td>#contestant1#</td>
          <td>#contestant2#</td>
          <td>#ingredients#</td>
          <td>#guest1#</td>
          <td>#guest2#</td>
          <td>#dish#</td>
          <td>#winner#</td>
        </tr>
        <cfset breaktimer = breaktimer + 1>
        </cfif>
      </cfoutput>
    </tbody>
</table>
</cfdocument>