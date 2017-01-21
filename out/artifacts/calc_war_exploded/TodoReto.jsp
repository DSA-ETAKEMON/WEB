<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
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
            <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;EtakemonGo</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="index.jsp">Principal</a></li>
            <li><a href="MisEtakemon.jsp">Mis Etakemons</a></li>
            <li class="active"><a href="Ranking.jsp">Ranking</a></li>
            <li><a href="#">Luchar!</a></li>
        </ul>
        <button class="btn btn-danger navbar-btn">Cerrar Sesión</button>
    </div>
</nav>
<br>

<div class="container">
    <div class="jumbotron" style='background: #C7E8EF;'>
        <center>
            <h1>Ranking EtakemonGO</h1>
            <img src="http://topcinque.com/wp-content/uploads/2014/10/top_cinque_logo_retina.png" class="img-rounded"
                 alt="Cinque Terre" width="304" height="236">
        </center>
    </div>

    <center>
        <div id="formulario">
                <center>
                    <div id="recibidos" class="alert alert-info">
                        <strong>Retos recibidos</strong>
                    </div>
                    <div id="enviados" class="alert alert-info">
                        <strong>Retos enviados</strong>
                    </div>
                </center>
        </div>
    </center>

</div>
<script>

    var BASE_URI = "http://localhost:9091/etakemon/";
    var warningVisible = true;
    var i = 0;

    //enviado
    $(document).ready(function () {
        var obj = JSON.parse(localStorage.getItem("user"));
        var fight = {"contrincantedos":obj.id,"estado2":"IDLE"};
        console.log(obj.name);
        var id =  parseInt(obj.id);
        //  alert("mi id es :" + obj.id);
        // obj.nick = $("#inputNick").val();
        // obj.password = $("#inputPass").val();
        $.ajax({
            url: BASE_URI + "fight/misretos",
            type: 'POST',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(fight),
            success: function (response) {
                if(parseInt(response.length)==0) {
                    $('#recibidos').append("<div class='alert alert-warning'><strong>No tienes ningun reto!</strong></center></div>");
                }else{

                $.each(response, function (k, v) {
                        i++;
                        var cont = k + 1;
                        var id2 = parseInt(v.id);
                        // alert("id2 es " + v.id + "id 1 es" + id);
                        //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                        $('#recibidos').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                        $('#recibidos').append("<div class='panel-body'>Oponente: " + v.contrincanteuno + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estado: " + v.estado2 + "</center></div>");
                        $('#recibidos').append("<div class='btn-group'><button onClick='Accept(" + JSON.stringify(v) + ")' type='button' class='btn btn-success'>Aceptar</button><button onClick='Cancel(" + JSON.stringify(v) + ")' type='button' class='btn btn-danger'>Rechazar</button></div>");
                    });}
            },
            error: function (response) {
                console.log("Fail cargando la lista de topUsers  " + response);
            }


    });



        //enviados
        $.ajax({
            url: BASE_URI + "fight/misretos",
            type: 'POST',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
             data: JSON.stringify(obj),
            success: function (response) {
                $.each(response, function (k, v) {
                    var cont = k + 1;
                    var id2 = parseInt(v.id);
                    // alert("id2 es " + v.id + "id 1 es" + id);
                    //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                    $('#enviados').append("<div onClick='reply_click(" + id2 + "," + id + ")' class='panel-heading'<br>Ranking: " + cont + "</br></div>");
                    $('#recibidos').append("<div class='panel-body'>Nick :" + v.name + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Puntos :" + v.puntuacionTotal + "</center></div>");
                });
            },
            error: function (response) {
                console.log("Fail cargando la lista de topUsers  " + response);
            }
        });


    });

    function Accept(v) {
        var obj = {'id': v.id ,'estado1': 'TRUE', 'estado2': 'TRUE', 'contrincanteuno': v.contrincanteuno, 'contrincantedos': v.contrincantedos};
        //alert(obj.contrincantedos+ obj.contrincanteuno);
        var answer = confirm("Desea aceptar el reto con el jugador con id "+ v.contrincanteuno +"?");
        if (answer) {
            //some code
            $.ajax({
                url: BASE_URI + "fight/returnreto",
                type: 'POST',
                crossDomain: true,
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(obj),
                success: function (response) {
                    // alert("ok", response);
                    // $.each(response, function (k, v) {
                    alert("Reto aceptado, espere que su oponente juegue.");
                },
                error: function (response) {
                    console.log("Fail al aceptar reto " + response);
                }
            });
        }
        else {
            //some code
            alert("OK");
        }
    }

    function Cancel(v) {
        var obj = {'id': v.id ,'estado1': 'TRUE', 'estado2': 'FALSE','contrincanteuno': v.contrincanteuno, 'contrincantedos': v.contrincantedos};
        //alert(obj.contrincantedos+ obj.contrincanteuno);
        var answer = confirm("Desea rechazar el reto con el jugador con id "+ v.contrincanteuno +"?");
        if (answer) {
            //some code
            $.ajax({
                url: BASE_URI + "fight/returnreto",
                type: 'POST',
                crossDomain: true,
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(obj),
                success: function (response) {
                    // alert("ok", response);
                    // $.each(response, function (k, v) {
                    alert("Reto rechazado, asumajao.");
                },
                error: function (response) {
                    console.log("Fail al rechazar reto " + response);
                }
            });
        }
        else {
            //some code
            alert("OK");
        }
    }
</script>

</body>
</html>
