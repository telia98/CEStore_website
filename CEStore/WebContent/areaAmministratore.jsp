<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.cestore.model.*"%>

<!DOCTYPE html>
<html>
	<head>
		<title> Area amministratore </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script> <!--  da non togliere: è questo che da tutto il layout -->
		<script src="js/init.js"></script><!--  da non togliere: è questo che da tutto il layout -->
		<script src="js/gestionejQuery.js"></script>
		<script src="js/gestioneAjax.js"></script>
		<link rel="stylesheet" href="css/style.css"/>
		<script type="text/javascript">
			$(document).ready(function(){   				
		   		//quando il bottone menu è cliccato
				$(".btn-responsive-menu").click(function() {
					$("li#search").css("left","10px");
					$("li#search").css("right","10px");
					$("li#search").css("line-height","50px");
					$("#nav").toggle();
				});
	    	});
		</script>
	</head>

	<body>
		<div id="header-wrapper">
			<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
					<div id="logo">
						<a href="homepage.jsp"><img src="images/logoStore.png" alt="logo CEStore"></a>
					</div>
					<!-- /Logo -->
					
					<!-- Icona menu -->
					<div class="btn-responsive-menu" style="background-color:#252525;">
						<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
           				<span class="icon-bar"></span>
					</div>
					<!-- /Icona menu -->
					
					<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="visualizzazioneCapi.jsp?page=1&filter=si&action=donna"> Donna </a></li>
							<li><a href="visualizzazioneCapi.jsp?page=1&filter=si&action=uomo"> Uomo </a></li>
							<li><a href="visualizzazioneCapi.jsp?page=1&filter=si&action=unisex"> Unisex </a></li>
							<li id="search">
								<form action="FilterControl?action=ajax&filter=si&page=1" method="post">								
									<div>
										<input type="text" name="ricerca" size="40" maxlength="60" class="text" value="" style="border:none;border-bottom:1px solid #ea9c74;" list="ricerca-datalist" onkeyup="ricerca(this.value,this.name)"/>
										<img id="imgSearch" src="images/search.ico" alt="search">
										<datalist id="ricerca-datalist"></datalist>
									</div>
								</form>
							</li>
							<li id="login">
							<%
								if (request.getSession().getAttribute("nameuser")==null) {
							%>
								<a href="#loginForm">Accedi</a>
							<%
								} else {
							%>
								<a href="areaUtente.jsp"><%=request.getSession().getAttribute("nameuser")%></a>
							<%
								}
							%>
							</li>
							<li><a href="carrello.jsp?action=null"> Carrello </a></li>
						</ul>
						<form id="loginForm" action="Login" method="post">
							<label>username</label><input type="text" name="username" class="text" size="20" style="border:none;border-bottom:1px solid #ea9c74;"><br>
							<label>password</label><input type="password" name="password" class="text" size="20" style="border:none;border-bottom:1px solid #ea9c74;"><br>
							<input type="submit" value="accedi" style="float:right;"><br>
							Se non sei registrato,<a href="registrazione.jsp">clicca qui</a>
						</form>
					</nav>
					<!-- /Nav -->
				</div>
			</div>
			<!-- /Header -->
		
			<!-- Banner -->
				<div id="banner">
					<div class="container">
			
					</div>
				</div>
			<!-- /Banner -->
		</div>
		
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section class="sidebar">
							<header>
								<h2> Il mio account </h2>
							</header>
							<ul class="default">
								<li><a href="#insertEdelete"> Inserimento e cancellazione</a></li>
								<li><a href="Logout"> Logout </a></li>
							</ul>
						</section>
					</div>

					<div class="9u skel-cell-important">
						<div id="#insertEdelete">
							<header>
								<h2> Inserimento e cancellazione</h2>
								<span class="byline"> Campi per l'inserimento e la cancellazione di un capo in catalogo </span>
							</header>
							
							<div>	
								<label>Selezionare il tipo di operazione che si vuole eseguire: </label>	
								<input type="radio" name="tipoOperazione" value="inserimento" id="inserimento">Inserimento
								<input type="radio" name="tipoOperazione" value="cancellazione" id="cancellazione">Cancellazione<br>	
								<label>Selezionare il tipo di capo su cui si intende operare: </label>		
								<input type="radio" name="tipoCapo" value="vestiario" id="checkVestiario">Vestiario
								<input type="radio" name="tipoCapo" value="accessorio" id="checkAccessorio">Accessorio<br>
								<input type="button" name="impostazioni" value="richiedi" onclick="controlla()">
								<br><br><br>
							</div>	
							<%
								//controlliamo se è arrivato un messaggio di errore dalla request
								String error=(String) request.getAttribute("error");
								if (error!=null) {	
							%> 	
							<h3 style="color: #ea9c74;"> <%=error%></h3> <!-- colore arancione -->								
							<%
								}
		
								//controlliamo i vari messaggi della response
								String message=(String) request.getAttribute("message");
								if (message!=null) {	
							%>
							<h3 style="color: #aed1a8;"> <%=message%></h3> <!-- colore verde -->								<%
								}
							%>
							
							<div id="insertVestiario" hidden="true">
								<form action="AreaAdminControl?action=insertVestiario" method="post" enctype="multipart/form-data">
									<h1> Inserire le informazioni previste per un capo di vestiario</h1>
									<label>Codice categoria: </label>
									<select name="codiceCategoria">
										<option>01</option>
										<option>02</option>
										<option>03</option>
									</select><br>
									<label>Taglia: </label>
									<select name="taglia">
										<option>XS</option>
										<option>S</option>
										<option>M</option>
										<option>L</option>
										<option>XL</option>
										<option>36</option>
										<option>37</option>
										<option>38</option>
										<option>39</option>
										<option>40</option>
										<option>41</option>
										<option>42</option>
									</select><br>
									<label>Colore: </label><input type="text" name="colore" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Materiale: </label><input type="text" name="materiale" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Info:</label><input type="text" name="info" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Marca:</label><input type="text" name="marca" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Collezione:</label><input type="text" name="collezione" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Vestibilita':</label><input type="text" name="vestibilita" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Fantasia:</label><input type="text" name="fantasia" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Stagione:</label>
									<select name="stagione">
										<option>primavera/estate</option>
										<option>autunno/inverno</option>
									</select><br>
									<label>Modello:</label>
									<select name="modello">
										<option>maglia</option>
										<option>giacca</option>
										<option>pantalone</option>
										<option>vestito</option>
										<option>scarpe</option>
									</select><br>
									<label>Costo:</label><input type="text" name="costo" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Foto frontale del capo: </label><input type="file" name="linkFoto1" accept="image/*"><br>
									<label>Foto retro del capo: </label><input type="file" name="linkFoto2" accept="image/*"><br>
									<label>Foto del capo indossato: </label><input type="file" name="linkFoto3" accept="image/*"><br>
									<section style="text-align:left;">
										<input type="submit" value="inserisci">
									</section>
								</form>
								<% for(int j=0;j<5;j++) { %>
									<br>
								<% } %>
							</div>
						
							<div id="insertAccessorio" hidden="true">
								<form action="AreaAdminControl?action=insertAccessorio" method="post" enctype="multipart/form-data">
									<h1> Inserire le informazioni previste per un capo accessorio </h1>
									<label>Codice categoria:</label>
									<select name="codiceCategoria">
										<option>01</option>
										<option>02</option>
										<option>03</option>
									</select><br>
									<label>Marca:</label><input type="text" name="marca" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Fantasia:</label><input type="text" name="fantasia" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Info:</label><input type="text" name="info" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>									
									<label>Costo:</label><input type="text" name="costo" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									<label>Tipologia:</label>
									<select name="tipologia">
										<option>borsa</option>
										<option>gioielli</option>
										<option>scarpe</option>
										<option>cappelli</option>
									</select><br>
									<label>Foto frontale del capo: </label><input type="file" name="linkFoto1" accept="image/*"><br>
									<label>Foto retro del capo: </label><input type="file" name="linkFoto2" accept="image/*"><br>
									<label>Foto del capo indossato (opzionale): </label><input type="file" name="linkFoto3" accept="image/*"><br>
									
									<section style="text-align:left;">
										<input type="submit" value="inserisci">
									</section>
								</form>
								<% for(int j=0;j<5;j++) { %>
									<br>
								<% } %>
							</div>
							
							<div id="deleteAccessorio" hidden="true">
								<form action="AreaAdminControl?action=deleteAccessorio" method="post">
									<h1> Inserire il codice del capo di accessorio da eliminare </h1>
									<label>Codice capo:</label><input type="text" name="codiceCapo" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									
									<section style="text-align:left;">
										<input type="submit" value="elimina">
									</section>
								</form>
								<% for(int j=0;j<5;j++) { %>
									<br>
								<% } %>
							</div>
							
							<div id="deleteVestiario" hidden="true">
								<form action="AreaAdminControl?action=deleteVestiario" method="post">
									<h1> Inserire il codice del capo di vestiario da eliminare </h1>
									<label>Codice capo:</label><input type="text" name="codiceCapo" class="text" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
									
									<section style="text-align:left;">
										<input type="submit" value="elimina">
									</section>
								</form>
								<% for(int j=0;j<5;j++) { %>
									<br>
								<% } %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- /Main -->
	
	<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				<p> Tutti i diritti sono riservati CEStore <br>
				    sede legale: Via Corso Europa 30, Napoli
				</p>
			</div>
		</div>
	<!-- /Copyright -->
	
	<script type="text/javascript">
		function controlla() {
			var vestiario = document.getElementById("checkVestiario");
			var inserimento = document.getElementById("inserimento");
			
			if (vestiario.checked && inserimento.checked) {
				//visualizzo per inserimento vestiario 
				document.getElementById("insertVestiario").removeAttribute("hidden");
				document.getElementById("insertAccessorio").setAttribute("hidden","true");
				document.getElementById("deleteVestiario").setAttribute("hidden","true");
				document.getElementById("deleteAccessorio").setAttribute("hidden","true");
			} else if(!vestiario.checked && inserimento.checked) {
				//visualizzo per inserimento accessorio
				document.getElementById("insertAccessorio").removeAttribute("hidden");
				document.getElementById("insertVestiario").setAttribute("hidden","true");
				document.getElementById("deleteVestiario").setAttribute("hidden","true");
				document.getElementById("deleteAccessorio").setAttribute("hidden","true");
			} else if (vestiario.checked && !inserimento.checked) {
				//visualizzo per cancellazione vestiario
				document.getElementById("deleteVestiario").removeAttribute("hidden");
				document.getElementById("insertVestiario").setAttribute("hidden","true");
				document.getElementById("deleteAccessorio").setAttribute("hidden","true");
				document.getElementById("insertAccessorio").setAttribute("hidden","true");
			} else if (!vestiario.checked && !inserimento.checked ) {
				//visualizzo per cancellazione accessorio
				document.getElementById("deleteAccessorio").removeAttribute("hidden");
				document.getElementById("insertVestiario").setAttribute("hidden","true");
				document.getElementById("deleteVestiario").setAttribute("hidden","true");
				document.getElementById("insertAccessorio").setAttribute("hidden","true");
			}
		}
	</script>
	</body>
</html>