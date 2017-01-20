<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABWeL3JlQN2uQ9xBUkMjDWdnN09wYqEqY&callback=initMap"
  async defer>
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#formulario {
	width: 400px;
}

body {
	background-color: #646367;
}
.alert {
   width:40%;    
}
#map {
        height: 100%;
      }

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jugar - EtakemonGO</title>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;EtakemonGo</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Principal</a></li>
      <li><a href="MisEtakemon.jsp">Mis Etakemons</a></li>
      <li><a href="Ranking.jsp">Ranking</a></li>
      <li><a href="#">Luchar!</a></li>
<li>  <button class="btn btn-danger navbar-btn">Cerrar Sesión</button></li>
    </ul>
 
  </div>
</nav>

	<br>
	<br>
	
	<div class="container">
		<div class="jumbotron" style='background: #C7E8EF;'>
			<center>
				<h1>Mapa Etakemons</h1>
				<img src="http://pokemongohackonline.com/wp-content/uploads/2016/07/unnamed-13.png" class="img-rounded" alt="Cinque Terre" >
			</center>
		</div>
		</div>
		<br>
		<center>
			<div id="alert" class="alert alert-warning">
	  		<strong>Su turno de jugar!</strong> Pinche las casillas para realizar su ataque.
	<button type="button" id="reset"  class="btn btn-danger">Reset jugada</button>
			</div>
			<br>
			<div id="map" style="width: 900px; height: 500px"></div> 
			
		</center>
		
		
		
		
    <script>
	
      function initMap() {
	        var myLatLng = {lat: 41.40916031593916, lng: 2.154841007710515};
	        var myLatLng2 = {lat: 41.40616031593916, lng: 2.154341007710515};
	        var myLatLng3 = {lat: 41.40919031593916, lng: 2.154801007710515};
	        var myLatLng4 = {lat: 41.40716031593916, lng: 2.150841007710515};

          var pos1 =(Math.random() * (0.120 - 0.0200) + 0.0200).toFixed(4)
          var pos2 =(Math.random() * (0.120 - 0.0200) + 0.0200).toFixed(4)
          var pos3 =(Math.random() * (0.120 - 0.0200) + 0.0200).toFixed(4)
          var pos4 =(Math.random() * (0.120 - 0.0200) + 0.0200).toFixed(4)

			var a =  parseFloat(myLatLng.lat)+ parseFloat(pos1);


          var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 12,
        });
          var infoWindow = new google.maps.InfoWindow({map: map});

          //circulo radio
			var myCity = new google.maps.Circle({
			    center: myLatLng,
			    radius: 500,
			    strokeColor: "#0000FF",
			    strokeOpacity: 0.8,
			    strokeWeight: 2,
			    fillColor: "#0000FF",
			    fillOpacity: 0.4
			  });
			  myCity.setMap(map);
          var a=0;
          if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(function(position) {
                  var pos = {
                      lat: position.coords.latitude,
                      lng: position.coords.longitude
                  };
                  a ={
                      lat:  parseFloat(pos.lat)+ parseFloat(pos1),
                      lng:  parseFloat(pos.lng)+ parseFloat(pos1)
                  };

//Create a marker and set its position.
                  var marker = new google.maps.Marker({
                      map: map,
                      position: a,
                      animation: google.maps.Animation.BOUNCE,
                      title: 'Etakemon1'
                      //  icon: "pinkball.png"
                  });


                 // infoWindow.setPosition(pos);
                 // infoWindow.setContent('Location found.');
                  map.setCenter(pos);
              }, function() {
                  handleLocationError(true, infoWindow, map.getCenter());
              });
          } else {
              // Browser doesn't support Geolocation
              handleLocationError(false, infoWindow, map.getCenter());
          }
			alert(a);

		//Create a marker and set its position.
		        var marker = new google.maps.Marker({
		          map: map,
					position: myLatLng,
	  			  animation: google.maps.Animation.BOUNCE,
		          title: 'Etakemon1'
				//  icon: "pinkball.png"
		        });

		//Create a marker and set its position.
		        var marker = new google.maps.Marker({
		          map: map,
		          position: myLatLng,
		 		  animation: google.maps.Animation.BOUNCE,
		          title: 'Etakemon2'
		        });

		//Create a marker and set its position.
		        var marker = new google.maps.Marker({
		          map: map,
		          position: myLatLng3,
		  		  animation: google.maps.Animation.BOUNCE,
		          title: 'Etakemon3'
		        });

		//Create a marker and set its position.
		        var marker = new google.maps.Marker({
		          map: map,
		          position: myLatLng4,
		  		  animation: google.maps.Animation.BOUNCE,
		          title: 'Etakemon4'
		        });



        // Try HTML5 geolocation.
       
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }

    </script>

		
		
	

<br><br><br><br>
</body>
</html>