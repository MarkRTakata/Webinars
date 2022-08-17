Please enter your player name
<form>
    <input type="text" name="playername" id="playername" value="">
    <button name="playgame" id="playgame" onclick="setUsername()" hx-target="#viewport" hx-get="interface.cfm" type="button">PLAY GAME</button>
</form>
<script>
function setUsername(){
    console.log($("#playername").val());
    username = $("#playername").val();
    myButton=document.getElementById("playgame");
    htmx.process(myButton);
}
</script>