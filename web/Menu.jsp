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
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
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
            <li><button class="btn btn-danger navbar-btn">Cerrar Sesi�n</button></li>
        </ul>

    </div>
</nav>  <br>
<div class="container">
    <div class="jumbotron" style='background: #C7E8EF;'>
        <center>
            <h1>EtakemonGO</h1>
            <img src="http://www.pd4pic.com/images/head-africa-branches-circle-lion-art-animal-mane.png" class="img-rounded" alt="Cinque Terre" width="304" height="236">
        </center>
    </div>
</div>
    <center>
        <div class="container">
            <div class="jumbotron" id="formulario" style='background: #C7E8EF;'>
                <h4>Seleccione una secci�n <p id="nick"></p> </h4>
                <br> <a href="MisEtakemon.jsp"><button class="btn btn-info">&nbsp;Mis Etakemons&nbsp;</button></a><br>
                <br> <a href="Jugar.jsp"><button class="btn btn-info">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Luchar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></a><br>
                <br> <a href="Ranking.jsp"><button class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ranking&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></a><br>
                <br> <a href="Cazar.jsp"><button class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cazar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></a><br>
            </div>
        </div>
    </center>


    <script type="text/javascript">
        var obj = JSON.parse(localStorage.getItem("user"));
        console.log("Menu --> obj es ..... ",obj);
        $('#nick').append(obj.nick);
    </script>

</body>
</html>