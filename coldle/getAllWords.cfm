<cfquery name="getAllWords" datasource="coldle" >
SELECT gameID, text, wordID from tblWords
</cfquery>
<cfoutput query="getAllWords">
#text# (<a href="deleteWord.cfm?id=#wordID#">delete</a>)<br />
</cfoutput>