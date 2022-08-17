<script>
let username = "";
let words = "";
let NUMBER_OF_GUESSES = "";
let guessesRemaining = NUMBER_OF_GUESSES;
let currentGuess = [];
let nextLetter = 0;
let rightGuessString = "";
let animateCSS = "";
let letterColor = ''
let box = "";
let letter = "";

let letterPosition = "";
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coldle</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" /> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>
<body hx-trigger="load" hx-get="welcome.cfm" hx-target="#viewport">
    <h1> Coldle Word Game </h1>
    <div id="viewport">
        
    </div>
    <a href="/coldle/" id="btnPlayAgain" class="btn btn-success" style="display: none;">PLAY AGAIN</a>
    <h3>Top Scores</h3>
    <div id="topscores" hx-get="getTopScores.cfm" hx-target="#topscores" hx-trigger="every 2s"></div>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://unpkg.com/htmx.org@1.8.0"></script>
</body>
</html>