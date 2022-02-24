  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Airtable</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css" rel="stylesheet" />
</head>
<body>
<table id="apitable" name="apitable" class="dataTable" style="width: 100%">
    <thead>
        <tr>
            
            <th>Item</th>
            <th>Notes</th>
            <th>Done?</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {
    $('#apitable').DataTable( {
        ajax: {
            url: 'getData.cfm',
            dataSrc: 'fields'
        },
        columns: [
            
            {data: 'item'},
            {data: 'notes'},
            {data: 'done'}
        ]
    } );
} );
</script>
</body>
</html>