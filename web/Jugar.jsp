<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jugar - EtakemonGO</title>
</head>
<body>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="Menu.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;EtakemonGo</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="MisEtakemon.jsp">Mis Etakemons</a></li>
			<li><a href="Ranking.jsp">Ranking</a></li>
			<li><a href="TodoReto.jsp">Retos</a></li>
			<li><a href="Jugar.jsp">Luchar!</a></li>
		</ul>
		<li class="navbar-btn"><a class="btn btn-danger" href="Logout.jsp">Cerrar Sesión</a></li>
	</div>
</nav>

	<br>
	<br>
	
	<div class="container">
		<div class="jumbotron" style='background: #C7E8EF;'>
			<center>
				<h1>Juego</h1>
				<img src="http://pokemongohackonline.com/wp-content/uploads/2016/07/unnamed-13.png" class="img-rounded" alt="Cinque Terre" >
			</center>
		</div>
		</div>
		<br>
		<center>
			<div id="alert" class="alert alert-warning">
	  		<strong>Su turno de jugar!</strong> Pinche las casillas para realizar su ataque.
	<button type="button" id="reset" onClick="select_clicked(this.id)" class="btn btn-danger">Reset jugada</button>
			</div>
		</center>
		<div id="tabla" class="container">
			<div class="container">
		  <div class="btn-group btn-group-justified">
		    <a id="p1" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		    <a id="p2" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		    <a id="p3" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		  </div>
		</div>
		<br>
		<div class="container">
		  <div class="btn-group btn-group-justified">
		    <a id="p4" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		    <a id="p5" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		    <a id="p6" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		  </div>
		</div>
		<br>
		<div class="container">
		  <div class="btn-group btn-group-justified">
		    <a id="p7" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		    <a id="p8" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		    <a id="p9" onClick="select_clicked(this.id)" class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		  </div>
		</div><br>
		<center>	<button type="button" id="enviar" onClick="EnviarJugada()" class="btn btn-success">Enviar jugada</button>
		</center>
		</div>
	
<script>
    var BASE_URI = "http://localhost:9091/etakemon/";
    var count = 0;
		var btnStyle = document.getElementById('p1').style.backgroundColor;
		var jugada= [0, 0, 0, 0, 0, 0, 0, 0, 0];

		var juego="";
		function EnviarJugada()
		{
            var fight = JSON.parse(localStorage.getItem("fightToPlay"));
            var cont =0;
			for(i =1; i<=9 ;i++){
				var x = document.getElementById("p"+i);
				if(x.style.backgroundColor == 'red')
					{
						jugada[i-1] = 1;
						cont++;
					}
			}
			if(cont=3)
				{
			for(i=0; i<=jugada.length-1;i++) {

                juego += parseInt(jugada[i]);
                console.log(parseInt(jugada[i]));
            }
                    alert(juego);
			if(fight.juego1==null)
					fight['juego1'] = juego;
                   else if(fight.juego2==null)
                        fight['juego2'] = juego;

                        Fight(fight);
				}
			else
				alert("Debes seleccionar 3 casillas para poder enviar la jugada");
		}
		
		function select_clicked(clicked_id)
		{
	        document.getElementById("p1").innerHTML = clicked_id;
			var a = clicked_id;
			if(a == 'reset'){
	        	alert("Listo!! juego reseteado");
				count = 0;
				for(i =1; i<=9 ;i++){
				document.getElementById("p"+i).style.backgroundColor = btnStyle;
				}
			}
			else{
			if(count<3){
	        var btn = document.getElementById(clicked_id);
	        if(btn.style.backgroundColor != btnStyle ) {
		    	btn.style.backgroundColor = btnStyle;
		       count--;       
		    }
		    else  if (btn.style.backgroundColor != "red") {
		    	btn.style.backgroundColor = "red";
		        count++;
		        document.getElementById("p1").innerHTML = count;
		    }
			}
			else
	        	{
	        	alert("Listo!! puedes enviar tu jugada de ataque");
	        	}
			}
	       
		}
		function Fight(F)
		{
            $.ajax({
                url: BASE_URI + "fight/jugar",
                type: 'POST',
                crossDomain: true,
                contentType: 'application/json',
               // dataType: 'json',
                data: JSON.stringify(F),
                success: function (response) {
                    // alert("ok", response);
                    // $.each(response, function (k, v) {
                    alert("Juego enviado, "+ response);
                },
                error: function (response) {
                    console.log("Fail al rechazar reto " + response);
                }
            });

		}

</script>
<br><br><br><br>
</body>
</html>