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

	<script>
		var BASE_URI = "http://localhost:9091/etakemon/";
		var warningVisible = true;
		
		$(document)
				.ready(
						function() {
							$("#submit")
									.on(
											"click",
											function(e) {
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
													window.location.href = 'index.jsp';
												}

											});
						});
	</script>

	<script>
		function getSong(uri) {

			var authToken = JSON.parse(sessionStorage["auth-token"]);
			$
					.ajax({
						url : uri,
						type : 'GET',
						crossDomain : true,
						dataType : "json",
						headers : {
							"X-Auth-Token" : authToken.token
						}

					})
					.done(
							function(data, status, jqxhr) {

								var song1 = data;
								$("#song_subject").replaceWith(
										'<h2 id="anuncio_subject" class="modal-title" style="color:black">'
												+ song1.artist + ' - '
												+ song1.title + '</h2>');
								console.log(song1.audio);
								if (song1.audio === undefined) {
									$("#song")
											.replaceWith(
													'<div id="song"><br><br>'
															+ '<p id="api_externa"></p></div>');
								} else {
									$("#song")
											.replaceWith(
													'<div id="song"><audio src="'+ UPLOADFOLDER + song.audio + '" preload="auto" controls></audio><br><br>'
															+ '<p id="api_externa"></p></div>');
								}
								loadDatosCancion(song1.artist, song1.title);
								//data.links=linksToMap(data.links);
							}).fail(
							function() {
								console.log("ERROR");
								$("#song").text("");
								$("#song").replaceWith(
										"<div class='alert alert-block alert-danger'><p>Algo falló :(</p></div>"
												+ '<p id="api_externa"></p>');
							});
		}
	</script>




	 
	</div>















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
					<form>
						 
						<div class="form-group">
							    <label for="inputdefault">Nick :</label>     <input
								class="form-control" id="inputNick" type="text">  
						</div>
						 
						<div class="form-group">
							    <label for="inputlg">Password :</label>     <input
								class="form-control" id="inputPass" type="password">  
						</div>



						<button type="button" id="submit" class="btn btn-default">Acceder</button>
					</form>
				</div>
			</div>
		</center>
</body>
</html>