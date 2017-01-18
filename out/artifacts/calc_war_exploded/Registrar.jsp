
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
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

<br>
<br>
<div class="container">
    <div class="jumbotron" style='background: #C7E8EF;'>
        <center>
            <h1>Registro EtakemonGO</h1>
        </center>
    </div>
</div>
<center>

    <div class="container">
        <div class="jumbotron" id="formulario" style='background: #C7E8EF;'>
            <form>
                 
                <div class="form-group">
                        <label for="inputNick">Nick :</label>     <input
                        class="form-control" id="inputNick" name="inputNick" type="text">  
                </div>
                 
                <div class="form-group">
                        <label for="inputPass">Password :</label>     <input
                        class="form-control" id="inputPass" type="password">  
                </div>

                <div class="form-group">
                        <label for="inputName">Name :</label>     <input
                        class="form-control" id="inputName" type="text">  
                </div>

                <div class="form-group">
                        <label for="inputSurName">Surname :</label>     <input
                        class="form-control" id="inputSurName" type="text">  
                </div>

                <div class="form-group">
                        <label for="inputMail">Email :</label>     <input
                        class="form-control" id="inputMail" type="mail">  
                </div>



                <button type="button" id="submit" class="btn btn-default">Acceder</button>
            </form>
        </div>
    </div>
</center>


<script>
    var BASE_URI = "http://localhost:9091/etakemon/";
    var warningVisible = true;

    $(document).ready(function() {
                $("#submit").on("click",function(e) {
                            e.preventDefault();

                            if (!$("#inputNick").val() || !$("#inputPass").val()
                                || !$("#inputName").val() || !$("#inputSurName").val()
                                || !$("#inputMail").val() ){
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
                                obj.name = $("#inputName").val();
                                obj.surname =$("#inputSurName").val();
                                obj.email = $("#inputMail").val();
                                $.ajax({
                                    url: BASE_URI + "user/register",
                                    type: 'POST',
                                    crossDomain: true,
                                    contentType: 'application/json',
                                    dataType: 'json',
                                    data: JSON.stringify(obj),
                                    success: function (response) {
                                        alert("Usuario registrado ok" + obj.nick);
                                        localStorage.setItem("usuario", obj);
                                        window.location.href = 'Login.jsp';
                                    },
                                    error: function (response) {
                                        console.log("login fail" + response);
                                    }
                                });

                            }

                        });
            });
</script>

</body>
</html>