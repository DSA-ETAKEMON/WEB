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
#result {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}

body {
	background-color: #646367;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis Etakemons - EtakemonGO</title>
</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="Menu.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;EtakemonGo</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="MisEtakemon.jsp">Mis Etakemons</a></li>
			<li><a href="Retar.jsp">Retar</a></li>
			<li><a href="TodoReto.jsp">Mis Retos</a></li>
			<li><a href="Ranking.jsp">Ranking</a></li>
			<li><a href="Wiki.jsp">WikiList</a></li>

		</ul>
		<li class="navbar-btn"><a class="btn btn-danger" href="Logout.jsp">Cerrar Sesión</a></li>
	</div>
</nav>	

	<br>
	<div class="container">
		<div class="jumbotron" style='background: #C7E8EF;'>
			<center>
				<img src="/img/logo.png" class="img-rounded" alt="EtakemonGoAsumajao" width="304" height="200">
				<h2>Mis Etakemons</h2>
			</center>
		</div>
	</div>
<div id="result">
	<div id="description">

	<center>

		 
		<br>
		</center>
	</div>


<script>

    var BASE_URI = "http://10.192.253.237:9091/etakemon/";
    var warningVisible = true;


    $(document).ready(function () {
        var ids = [];
        var nombres = [];
        var tipos = [];
        var puntos = [];
        var descripciones = [];
        var contador=0;

        var obj = JSON.parse(localStorage.getItem("user"));
        console.log(obj.name);
        var id = parseInt(obj.id);
        console.log("id es ", id);
        // obj.nick = $("#inputNick").val();
        // obj.password = $("#inputPass").val();
        $.ajax({
            url: BASE_URI + "etakemon/misestakemons/" + id,
            type: 'GET',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
            // data: JSON.stringify(obj),
            success: function (response) {
                $.each(response, function (k, v) {
                    ids.push(v.id);
                    nombres.push(v.name);
                    tipos.push(v.tipo);
                    puntos.push(v.puntos);
                    printar(k);

                    //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                    // $('#result').append("<li class='list-group-item list-group-item-info'><center> <span class='label label-success'>Nombre:</span>"+" "+v.name+" <br> <span class='label label-success'>Tipo:</span> "+" "+v.tipo+" <br> <span class='label label-success'>Puntos:</span> "+" "+ v.puntos +" <br></center></li>");
                    // $('#result').append("<li class='list-group-item list-group-item-warning'><center><img src='/img/"+v.tipo+".png' class='img-responsive' alt='Cinque Terre' width='100' height='150'></center></li><br>");
                });
                // alert("Lista etakemons cargada : " + (response));
                // localStorage.setItem("nick", obj.nick)
                // window.location.href = "Menu.jsp";
            },
            error: function (response) {
                console.log("Fail cargando la lista de etakemons  " + response);
            }
        }).done(function (result) {
          /*  ids.forEach(function (entry) {
                $.ajax({
                    url: BASE_URI + "etakemon/getdescription/" + entry,
                    type: 'GET',
                    crossDomain: true,
                    contentType: 'application/json',
                    dataType: 'json',
                    // data: JSON.stringify(obj),
                    success: function (response) {
                        $.each(response, function (k, v) {

                            descripciones.push(v.poder);
                            printar(contador);
                            contador++;
                        });

                        // alert("Lista etakemons cargada : " + (response));
                        // localStorage.setItem("nick", obj.nick)
                        // window.location.href = "Menu.jsp";
                    },
                    error: function (response) {
                        console.log("Fail cargando la lista de etakemons  " + response);
                    }
                });
            });*/
        });




        //  ids.forEach(function(entry) {

        // nombre,tipo ... carga desde vectores
        function printar(contador) {


            $('#result').append("<li class='list-group-item list-group-item-info'><center> <span class='label label-success'>Nombre:</span>" + " " + nombres[contador] + " <br> <span class='label label-success'>Tipo:</span> " + " " + tipos[contador] + " <br> <span class='label label-success'>Puntos:</span> " + " " + puntos[contador] + " <br></center></li>");

            //imagen del etakemon ...  carga desde vectores
            $('#result').append("<li class='list-group-item list-group-item-warning'><center><img src='/img/" + tipos[contador] + ".png' class='img-responsive' alt='Este Etakemon esta asumajao' width='100' height='150'></center></li><br>");

        }
    });

       // });

  //  });

</script>
<ul id="res" class="list-group"></ul>
</body>
</html>