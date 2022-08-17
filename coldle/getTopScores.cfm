
<cfscript>
q = new Query(
    name="getTopScores",
    datasource="coldle",
    sql =   "SELECT id,scoretext
            FROM tblScores
            ORDER BY ID desc"
);
resultSet123 = q.execute().getResult();
for (item in resultSet123){
writeOutput(item.scoretext);

writeOutput("<br />");
}
</cfscript>
