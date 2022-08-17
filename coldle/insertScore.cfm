<cfif isDefined("FORM.scoretext") AND FORM.scoretext NEQ "">
<cfquery name="insertScore" datasource="coldle">
    INSERT INTO tblscores(scoretext)
    VALUES (<cfqueryparam value="#FORM.scoretext#" cfsqltype="CF_SQL_VARCHAR">)
</cfquery>
</cfif>
