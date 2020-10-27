<!DOCTYPE html>
<html>

<head>
    <style>
        #header {
            background-color:pink;
            color:white;
            text-align:center;
            padding:5px;
        }
        #nav {
            line-height:30px;
            background-color:pink;
            height:500px;
            width:400px;
            float:left;
            padding:5px;
        }
        #container {
            width: 400px;
            height: 400px;
            position: relative;
            background: yellow;
        }
        #animate {
            width: 50px;
            height: 50px;
            position: absolute;
            background-color: orange;
        }
        #section {
            width:400px;
            float:left;
            padding:10px;
        }
        #footer {
            background-color:pink;
            color:white;
            clear:both;
            text-align:center;
            padding:5px;
        }
    </style>
</head>

<body>

<div id="header">
    <h1>Users can enjoy my animation</h1>
</div>

<div id="nav">
    <p><button onclick="myMove()">Click on me</button></p>

    <div id ="container">
        <div id ="animate"></div>
    </div>

    <script>
        function myMove() {
            var elem = document.getElementById("animate");
            var pos = 0;
            var id = setInterval(frame, 5);
            function frame() {
                if (pos == 350) {
                    clearInterval(id);
                } else {
                    pos++;
                    elem.style.top = pos + "px";
                    elem.style.left = pos + "px";
                }
            }
        }
    </script>

</div>

<div id="section">
    <div onmousedown="mDown(this)" onmouseup="mUp(this)"
         style="background-color:#D94A38;width:150px;height:30px;padding:40px;">Please click</div>

    <h2 onmouseover="style.color='#D94A38'"onmouseout="style.color='black'">Move the mouse over this text</h2>
    <h2 onmouseover="style.color='#D94A38'"onmouseout="style.color='black'">History is continuous, from the remote prehistoric has been walking to the present, affecting the continuous future.</h2>
    <body>
    <p>Click and get the timing</p>

    <button id="myBtn">timing</button>

    <p id="demo"></p>
    </body>

    <script>
        document.getElementById("myBtn").onclick = displayDate;

        function displayDate() {
            document.getElementById("demo").innerHTML = Date();
        }
    </script>


    <script>
        function mDown(obj) {
            obj.style.backgroundColor = "#1ec5e5";
            obj.innerHTML = "Release the mouse";
        }

        function mUp(obj) {
            obj.style.backgroundColor="#D94A38";
            obj.innerHTML="Have a nice day!";
        }
    </script>
</div>

<div id="footer">
    <h1>Thanks for your appreciation!</h1>
</div>

</body>
</html>
