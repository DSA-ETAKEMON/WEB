<%@ page import="Etakemon.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="com.google.gson.Gson" %>
<% User usuario = new User(); %>
<% Gson json = new Gson(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        #formulario {
            width: 400px;
        }

        body {
            background-color: #646367;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login - EtakemonGO</title>
</head>
<body>


<script>

    var BASE_URI = "http://localhost:9091/etakemon/";
    var warningVisible = true;


    $(document).ready(function () {
        $("#submitBtn").on("click", function (e) {
            e.preventDefault();
            if (!$("#inputNick").val()
                || !$("#inputPass")
                    .val()) {
                if (warningVisible) {
                    $("#formulario")
                        .append(
                            "<br><div class=\"alert alert-warning\"> <strong>Campos obligatorios !</strong><br> Debe rellenar los dos campos.") // John
                    warningVisible = false;
                }
            } else {
                var obj = {};
                obj.nick = $("#inputNick").val();
                obj.password = $("#inputPass").val();
                $.ajax({
                    url: BASE_URI + "user/login",
                    type: 'POST',
                    crossDomain: true,
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(obj),
                    success: function (response) {

                                               localStorage.setItem("user", JSON.stringify(response));
                       // localStorage.setItem("nick", obj.nick);
                        window.location.href = "Menu.jsp";
                    },
                    error: function (response) {
                        console.log("login fail" + response);
                    }
                });
            }
        });
    });

</script>


<br>
<br>
<div class="container">
    <div class="jumbotron" style='background: #C7E8EF;'>
        <center>
            <h1>Login EtakemonGO</h1>
        </center>
    </div>


    <center>

        <div class="container">
            <div class="jumbotron" id="formulario" style='background: #C7E8EF;'>
                <form id="submitform">
                     
                    <div class="form-group">
                            <label>Nick :</label>     <input
                            class="inputNick" name="inputNick" id="inputNick" type="text">  
                    </div>
                     
                    <div class="form-group">
                            <label>Password :</label>     <input
                            class="form-control" name="inputPass" id="inputPass" type="password">  
                    </div>
                    <button type="button" id="submitBtn" class="btn btn-default">Acceder</button>

                </form>

            </div>
        </div>
    </center>
</div>
</body>
</html>