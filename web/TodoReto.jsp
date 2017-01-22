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
                    <div id="enviadosAceptados" class="alert alert-info">
                        <strong>Retos enviados aceptados</strong>
                    </div>
                    <div id="enviadosIDLE" class="alert alert-info">
                        <strong>Retos enviados pendientes</strong>
                    </div>
                    <div id="enviadosPendienteJuego" class="alert alert-info">
                        <strong>Partidas enviadas pendientes</strong>
                    </div>
                    <div id="recibidosPendientesJuego" class="alert alert-info">
                        <strong>Partidas recibidas pendientes</strong>

                    </div>
                    <div id="enviadosFinalizados" class="alert alert-info">
                        <strong>Partidas enviadas finalizadas</strong>
                    </div>
                    <div id="recibidosFinalizados" class="alert alert-info">
                        <strong>Partidas recibidas Finalizadas</strong>
                    </div>
                </center>
        </div>
    </center>

</div>
<script>

    var BASE_URI = "http://10.192.253.237:9091/etakemon/";
    var warningVisible = true;
    var i = 0;

    //recibidos
    $(document).ready(function () {
        var obj = JSON.parse(localStorage.getItem("user"));
        var fight = {"contrincantedos":obj.id,"estado2":"IDLE"};
        console.log(obj.name);
        var id =  parseInt(obj.id);
        //  alert("mi id es :" + obj.id);
        // obj.nick = $("#inputNick").val();
        // obj.password = $("#inputPass").val();

        // mis retos recibidos
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


        // mis retos recibidos a jugar o jugados
        $.ajax({
            url: BASE_URI + "fight/misretosajugar",
            type: 'POST',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(fight),
            success: function (response) {
                if(parseInt(response)==0) {
                    $('#recibidosPendientesJuego').append("<div class='alert alert-warning'><strong>No tienes ningun reto!</strong></center></div>");
                }else{
                    $.each(response, function (k, v) {
                        var emp = "empate";
                        var nulo = ""+"null";
                        var ganad = "" + v.ganador;
                        var juego1 = "" + v.juego1;
                        var juego2 = "" + v.juego2;
                        i++;
                        var cont = k + 1;
                        var id2 = parseInt(v.id);
                        if(juego1!=nulo && ((v.ganador)==null)){
                            //juego recibidos pendientes de jugar
                            $('#recibidosPendientesJuego').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                            $('#recibidosPendientesJuego').append("<div class='panel-body'>Oponente: " + v.contrincanteuno + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estado: " + v.estado2 + "</center></div>");
                            $('#recibidosPendientesJuego').append("<div class='btn-group'><button onClick='Jugar(" + JSON.stringify(v) + ")' type='button' class='btn btn-success'>Jugar</button></div>");
                        }else if(juego1!=nulo && juego2 !=nulo && (v.ganador)!=(nulo)){
                           //partidas recibidas finalizadas
                            $('#recibidosFinalizados').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                            $('#recibidosFinalizados').append("<div class='panel-body'>Oponente: " + v.contrincanteuno + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ganador: " + v.ganador + "</center></div>");
                            $('#recibidosFinalizados').append("<div class='btn-group'><button onClick='Accept(" + JSON.stringify(v) + ")' type='button' class='btn btn-success'>Aceptar</button><button onClick='Cancel(" + JSON.stringify(v) + ")' type='button' class='btn btn-danger'>Rechazar</button></div>");
                        }});}
            },
            error: function (response) {
                console.log("Fail cargando la lista de topUsers  " + response);
            }


        });

        var fightidle = {"contrincanteuno":obj.id};
        var nulo = ""+"null";

        //enviados (pendientes)
        $.ajax({
            url: BASE_URI + "fight/misretosenviadosidle",
            type: 'POST',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
             data: JSON.stringify(fightidle),
            success: function (response) {
                if(parseInt(response.length)==0){
                    $('#recibidosPendientesJuego').append("<div class='alert alert-warning'><strong>No tienes ningun reto!</strong></center></div>");
                }else{
                $.each(response, function (k, v) {
                    var cont = k + 1;
                    var id2 = parseInt(v.id);
                    // alert("id2 es " + v.id + "id 1 es" + id);
                    //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                    $('#enviadosIDLE').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                    $('#enviadosIDLE').append("<div class='panel-body'>Oponente: " + v.contrincantedos + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estado: " + v.estado2 + "</center></div>");
                });}
            },
            error: function (response) {
                console.log("Fail cargando la lista de topUsers  " + response);
            }
        });


        //enviados (aceptados)
        $.ajax({
            url: BASE_URI + "fight/misretosenviadosaccept",
            type: 'POST',
            crossDomain: true,
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(fightidle),
            success: function (response) {
                if(parseInt(response.length)==0) {
                    $('#enviadosAceptados').append("<div class='alert alert-warning'><strong>No tienes ningun reto!</strong></center></div>");
                    $('#enviadosPendienteJuego').append("<div class='alert alert-warning'><strong>No tienes ningun reto!</strong></center></div>");
                    $('#enviadosFinalizados').append("<div class='alert alert-warning'><strong>No tienes ningun reto!</strong></center></div>");
                }else{
                $.each(response, function (k, v) {
                    var emp = "empate";
                    var nulo = ""+"null";
                    var ganad = "" + v.ganador;
                    var juego1 = "" + v.juego1;
                    var juego2 = "" + v.juego2;
                    var cont = k + 1;
                    var id2 = parseInt(v.id);
                    //partidas enviadas finalizadas
                    if(juego1!=nulo && juego2!=nulo && (ganad)!=(nulo)  )
                {
                    $('#enviadosFinalizados').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                    $('#enviadosFinalizados').append("<div class='panel-body'>Oponente: " + v.contrincantedos + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gandor: " + v.ganador + "</center></div>");
                }
                if(v.juego1==null && v.juego2==null && v.ganador==null) { // retos enviados aceptados para jugarlos

                        // alert("id2 es " + v.id + "id 1 es" + id);
                        //  alert("Lista etakemons cargada : " + (v.tipo) + " y la k es"  + k);
                        $('#enviadosAceptados').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                        $('#enviadosAceptados').append("<div class='panel-body'>Oponente: " + v.contrincantedos + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estado: " + v.estado2 + "</center></div>");
                        $('#enviadosAceptados').append("<button onClick='Jugar(" + JSON.stringify(v) + ")' type='button' class='btn btn-success'>Jugar</button>");
                    }

//                        console.log("nulo es:" + (nulo) + "emp es" + emp);
                    if( ((v.ganador)==null) && v.juego2==null && v.juego1!=null)   {

                        //Juegos enviados pendientes del contrincante2
                        if((juego1!=nulo))
                        {

                                $('#enviadosPendienteJuego').append("<div class='panel-heading'<br>Reto: " + cont + "</br></div>");
                                $('#enviadosPendienteJuego').append("<div class='panel-body'>Oponente: " + v.contrincantedos + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Estado: " + v.estado2 + "</center></div>");

                            }


                    }
                    });}
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
                    localStorage.setItem("fight", JSON.stringify(response))
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


    function Jugar(v) {
        localStorage.setItem("fightToPlay",JSON.stringify(v));
        window.location.href = "Jugar.jsp";
    }
</script>

</body>
</html>
