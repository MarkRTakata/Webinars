<cfif isDefined("URL.id")>
    <cfif isNumeric(#URL.id#)>
        <cfquery name="deleteWord" datasource="coldle">
            DELETE FROM tblwords
            WHERE wordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#URL.id#">                    
        </cfquery>
    </cfif>
</cfif>
<cflocation url="addWords.cfm" addtoken="no" />