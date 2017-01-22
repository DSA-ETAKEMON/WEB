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
	width: 500px;
}

body {
	background-color: #646367;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
        <li class="navbar-btn"><a class="btn btn-danger" href="Logout.jsp">Cerrar Sesi�n</a></li>
    </div>
</nav>	<br>

	<div class="container">
		<div class="jumbotron" style='background: #C7E8EF;'>
			<center>
				<h1>Ranking EtakemonGO</h1>
                <img src="http://www.eoi.es/blogs/alfredo-fernandez-lorenzo/files/2016/10/ranking-1.jpg" class="img-rounded" alt="Cinque Terre" width="304" height="236">
                <br>
                <img src="http://topcinque.com/wp-content/uploads/2014/10/top_cinque_logo_retina.png" class="img-rounded" alt="Cinque Terre" width="304" height="236">
			</center>
		</div>
    </div>
<center>
<div id="formulario">
<div id="listado" class="panel panel-danger">
      <center>

    </center>
    </div>
</div>
</center>


<script>

    var BASE_URI = "http://10.192.253.237:9091/etakemon/";
    var warningVisible = true;


    $(document).ready(function () {
        var obj = JSON.parse(localStorage.getItem("user"));
        console.log(obj.name);
        var id = parseInt(obj.id);
        // obj.nick = $("#inputNick").val();
        // obj.password = $("#inputPass").val();
        $.ajax({
            url: BASE_URI + "fight/GetTopUsers",
            type: 'GET',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
            // data: JSON.stringify(obj),
            success: function (response) {
                $.each(response, function(k, v) {
                    var cont = k+1;
                    //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                    $('#listado').append("<div class='panel-heading'<br>Posici�n: "+  cont+"</br></div>");
                    $('#listado').append("<div class='panel-body'>Nick: "+ v.nick +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Puntos: "+ v.puntuacionTotal+"</center></div><br>");


                });
            },
            error: function (response) {
                console.log("Fail cargando la lista de topUsers  " + response);
            }
        });


    });

</script>

</body>
</html>