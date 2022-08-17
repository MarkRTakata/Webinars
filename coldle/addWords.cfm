<cfif isDefined("FORM.wordtext")>
    <cfif FORM.wordtext NEQ "">
        <cfquery name="addNewWord" datasource="coldle">
        INSERT INTO tblwords (gameID,text)
        VALUES (1,<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#FORM.wordtext#">)
        </cfquery>
        <div>New word "<cfoutput>#FORM.wordtext#</cfoutput>" inserted!</div><br>
    </cfif>
</cfif>
<form method="post" action="addWords.cfm" name="addwords">
<input type="text" maxlength="5" id="wordtext" name="wordtext" value="" />
<button name="saveword" id="saveword">Save Word</button>
</form>

<div id="viewport" hx-get="getAllWords.cfm" hx-trigger="every 5s"></div>
<script src="https://unpkg.com/htmx.org@1.8.0"></script>