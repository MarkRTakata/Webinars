<cfscript>
cfhttp(
    method="GET", 
    useragent=CGI.http_user_agent, 
    result="NFTResult", 
    url="https://api.opensea.io/api/v1/assets?collection=fancy-panthers"
){
    cfhttpparam(name="Accept", type="HEADER", value="application/json");
};
cfhttp(method="GET", useragent=CGI.http_user_agent, result="NFTCollectionResult", url="https://api.opensea.io/api/v1/collection/fancy-panthers"){
    cfhttpparam(name="Accept", type="HEADER", value="application/json");
}
NFTcollection = deserializeJSON(NFTResult.filecontent).assets;
NFTCollectionMain = deserializeJSON(NFTCollectionResult.filecontent).collection;

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
<div style="padding: 10px; background-color: rgba(255,255,255,.75);">
    <a href="/NFT/" class="btn btn-dark btn-sm">HOME</a> | <a href="/NFT/paint.cfm" class="btn btn-dark btn-sm">PAINT</a> | <a href="/NFT/nft.cfm" class="btn btn-dark btn-sm">NFT</a>
</div>
MARK DOES ART
<cfoutput>
<div style="width: 100%;">
    <img src="#NFTCollectionMain.image_url#" alt="#NFTCollectionMain.name#" />
</div>
<br />
<div style="padding: 10px; background-color: rgba(255,255,255,.75);">
    <strong>Average price:</strong>#NFTCollectionMain.stats.average_price#ETH | Total Count in Collection: #NFTCollectionMain.stats.count#
</div>
<cfloop array="#NFTcollection#" item="NFT">
<div class="card" style="background-color: rgba(255,255,255,.5); width: 32%; display: inline-block;margin-bottom: 10px; margin-right: 10px; ">
    <img class="card-img-top" style="padding: 10px;" src="#NFT.image_preview_url#" alt="Card image cap">
    <div class="card-body">
        <h5 class="card-title">#NFT.name#</h5>
    </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">#NFT.description#</li>
    <li class="list-group-item"><strong>Created on:</strong> #dateFormat(NFT.asset_contract.created_date,"MM-dd-YYYY")#</li>
    <cfif isNull(NFT.sell_orders)>
        <li class="list-group-item">NOT FOR SALE</li>
    <cfelse>
        <cfset currentPrice = NFT.sell_orders[1].current_price * .000000000000000001 />
        <li class="list-group-item">FOR SALE: #currentPrice#<strong>ETH</strong></li>
    </cfif>
    <li class="list-group-item">
        <a href="#NFT.permalink#" class="btn btn-success btn-dark" style="width: 100%; text-align: center;" target="_blank">
            <cfif isNull(NFT.sell_orders)>VIEW<cfelse>BUY</cfif> ON OPENSEA
        </a>
    </li>
  </ul>
</div>
</cfloop>
</cfoutput>
<cfscript>
 writeDump(deserializeJSON(NFTResult.filecontent).assets);
 writeDump(deserializeJSON(NFTCollectionResult.filecontent).collection);
</cfscript>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>