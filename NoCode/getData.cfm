<cfhttp url="https://api.airtable.com/v0/appiojBAIWLUG8A3o/Table%201?api_key=#request.airtableapikey#" method="get" result="result" />

<cfset apiOutput = deserializeJSON(result.filecontent) />

<cfset apiOutput = serializeJSON(apiOutput.records) />
<cfoutput>#apiOutput#</cfoutput>