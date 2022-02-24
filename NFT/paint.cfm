<cfscript>
PaintCollection = ArrayNew(1);
PaintCollection[1] = {name="Beau",description="Good kitty", sell_orders=null, image_preview_url="images/i-crKWFs5-L.jpg", permalink="https://techfiend.smugmug.com/Art/Paintings/i-crKWFs5/A"};
PaintCollection[2] = {name="Space",description="So universe, much planets", sell_orders=null, image_preview_url="images/i-c56MKB6-L.jpg", permalink="https://techfiend.smugmug.com/Art/Paintings/i-c56MKB6/A"};
PaintCollection[3] = {name="Tree",description="Hug a tree", sell_orders=true, image_preview_url="images/i-L2PPZSQ-X2.jpg", permalink="https://techfiend.smugmug.com/Art/Paintings/i-L2PPZSQ/A",current_price = 200};
PaintCollection[4] = {name="Ryan on the Beach",description="I miss this one", sell_orders=null, image_preview_url="images/i-LSbsQtR-L.jpg", permalink="https://techfiend.smugmug.com/Art/Paintings/i-LSbsQtR/A"};
PaintCollection[5] = {name="Sunrise",description="Paint & gel on canvas", sell_orders=true, image_preview_url="images/i-PH9Qbz2-L.jpg", permalink="https://techfiend.smugmug.com/Art/Paintings/i-PH9Qbz2/A",current_price = 350};

</cfscript>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Opensea.io NFT API Demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
<style>
* {
    font-family:'Open Sans', sans-serif;
}
body {
    background-image: radial-gradient(red, teal, pink);
}
</style>
</head>
<body>
<div style="width: 100%;">
    Mark's Art
</div>
<br />
<div style="padding: 10px; background-color: rgba(255,255,255,.75);">
    <a href="/NFT/" class="btn btn-dark btn-sm">HOME</a> | <a href="/NFT/paint.cfm" class="btn btn-dark btn-sm">PAINT</a> | <a href="/NFT/nft.cfm" class="btn btn-dark btn-sm">NFT</a>
</div>
<cfoutput>
<cfloop array="#PaintCollection#" item="NFT">
<div class="card" style="background-color: rgba(255,255,255,.5); width: 32%; display: inline-block;margin-bottom: 10px; margin-right: 10px; ">
    <img class="card-img-top" style="padding: 10px;" src="#NFT.image_preview_url#" alt="Card image cap">
    <div class="card-body">
        <h5 class="card-title">#NFT.name#</h5>
    </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">#NFT.description#</li>
    <cfif isNull(NFT.sell_orders)>
        <li class="list-group-item">NOT FOR SALE</li>
    <cfelse>
        <cfset currentPrice = NFT.current_price />
        <li class="list-group-item">FOR SALE: $#currentPrice#</li>
    </cfif>
    <li class="list-group-item">
        <a href="#NFT.permalink#" class="btn btn-success btn-dark" style="width: 100%; text-align: center;" target="_blank">
            <cfif isNull(NFT.sell_orders)>VIEW<cfelse>BUY</cfif> ON SMUG MUG
        </a>
    </li>
  </ul>
</div>
</cfloop>
</cfoutput>
<cfscript>
 //writeDump(deserializeJSON(NFTResult.filecontent).assets);
 //writeDump(deserializeJSON(NFTCollectionResult.filecontent).collection);
</cfscript>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>