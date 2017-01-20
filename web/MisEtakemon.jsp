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
      <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;EtakemonGo</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="index.jsp">Principal</a></li>
      <li class="active"><a href="MisEtakemon.jsp">Mis Etakemons</a></li>
      <li><a href="Ranking.jsp">Ranking</a></li>
      <li><a href="#">Luchar!</a></li>
    </ul>
   <button class="btn btn-danger navbar-btn">Cerrar Sesión</button>
  </div>
</nav>	

	<br>
	<div class="container">
		<div class="jumbotron" style='background: #C7E8EF;'>
			<center>
				<h1>Mis Etakemons</h1>
				<img src="http://www.pd4pic.com/images/head-africa-branches-circle-lion-art-animal-mane.png" class="img-rounded" alt="Cinque Terre" width="304" height="236">
			</center>
		</div>
	</div>
<div id="result">
		<center>

		 
		<br>
		</center>
	</div>


<script>

    var BASE_URI = "http://localhost:9091/etakemon/";
    var warningVisible = true;


    $(document).ready(function () {
               var obj = JSON.parse(localStorage.getItem("user"));
               console.log(obj.name);
               var id = parseInt(obj.id);
               console.log("id es ", id);
               // obj.nick = $("#inputNick").val();
               // obj.password = $("#inputPass").val();
                $.ajax({
                    url: BASE_URI + "etakemon/misestakemons/"+id,
                    type: 'GET',
                    crossDomain: true,
                    contentType: 'application/json',
                    dataType: 'json',
                   // data: JSON.stringify(obj),
                    success: function (response) {
                        $.each(response, function(k, v) {
                          //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                            $('#result').append("<li class='list-group-item list-group-item-info'>Tipo Etakemon: "+v.tipo+" Puntos Etakemon: "+ v.puntos +" ID :"+ v.id +"</li>");
                            $('#result').append("<center><img src='/img/"+v.tipo+".png' class='img-responsive' alt='Cinque Terre' width='100' height='150'></center>");


                        });

                       // alert("Lista etakemons cargada : " + (response));
                       // localStorage.setItem("nick", obj.nick)
                       // window.location.href = "Menu.jsp";
                    },
                    error: function (response) {
                        console.log("Fail cargando la lista de etakemons  " + response);
                    }
                });


    });

</script>
<ul id="res" class="list-group"></ul>
</body>
</html>