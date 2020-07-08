<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>

<!-- faccio il controllo delle variabili che andranno a customizzare il form -->
<%
	//controllo che tutti i valori passati dal form come attributi sono validi
	//se sono stringhe null, l'attributo non esiste - devo settarlo a stringa vuota
	String email= (String) request.getAttribute("email");
	if(email==null) 
		email="";
		
	String username= (String) request.getAttribute("username");
	if(username==null) 
		username="";
		
	String password= (String) request.getAttribute("password");
	if(password==null) 
		password="";

	String nome= (String) request.getAttribute("nome");
	if(nome==null) 
		nome="";
	
	String cognome= (String) request.getAttribute("cognome");
	if(cognome==null) 
		cognome="";
	
	String codiceFiscale= (String) request.getAttribute("codiceFiscale");
	if(codiceFiscale==null) 
		codiceFiscale="";

	String citta= (String) request.getAttribute("citta");
	if(citta==null) 
		citta="";
	
	String provincia= (String) request.getAttribute("provincia");
	if(provincia==null) 
		provincia="";
	
	String via= (String) request.getAttribute("via");
	if(via==null) 
		via="";
	
	String numeroCivico= (String) request.getAttribute("numeroCivico");
	if(numeroCivico==null) 
		numeroCivico="";
	
	String CAP= (String) request.getAttribute("CAP");
	if(CAP==null) 
		CAP="";
%>

<html>
	<head>
		<title> Registrazione </title>
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<script src="js/gestionejQuery.js"></script>
		<script src="js/gestioneJavascript.js"></script>
		<link rel="stylesheet" href="css/style.css"/>
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
				</div>
			</div>
			<!-- /Header -->
		
			<!-- Banner -->
			<div id="banner">
				<div class="container"></div>
			</div>
			<!-- /Banner -->
		</div>
		
		<!-- Main -->
		<div id="main">	
			<h2 style="font-size:2.8em;text-align:center;"> Registrazione </h2><br><br><br>
			<div class="container">
				<%
					//controlliamo se è arrivato un messaggio di errore dalla request
					String error=(String) request.getAttribute("error");
					if (error!=null) {	
				%> 
				<h3 style="text-align:center;color: #ea9c74;"> <%=error%></h3> <!-- colore arancione -->
				<%
					}
					//controlliamo i vari messaggi della response
					String message=(String) request.getAttribute("message");
					if (message!=null) {	
				%>
				<h3 style="text-align:center;color: #aed1a8;"> <%=message%></h3> <!-- colore verde -->
				<%
					}
				%>
				<!-- Registrazione -->
				<div id="registrazione">
					<form action="RegistrazioneControl" method="post" name="registrazione" class="form">
					    
						<h1 style="font-size:1em; text-transform:uppercase;" > Registrati con il tuo indirizzo email </h1>
						<label for="email">E-mail:</label><br>
 						<input type="email" name="email" class="text" onblur="validaMail(this)" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
 						<label for="username">Username:</label><br>   <!-- RICORDARSI DI DARE ERRORE SE INSERISCE UN USERNAME GIA' IN USO -->
 						<input type="text" name="username" class="text" onblur="validaUsername(this)" style="border:none;border-bottom:1px solid #ea9c74;" required><br>
 						<h1 style="font-size:0.8em;"> L'username non deve superare 30 caratteri </h1>
 						<label for="password">Password:</label><br>
  						<input type="password" name="password" class="text" onblur="validaPassword(this)" style="border:none;border-bottom:1px solid #ea9c74;" required><br>	
				        <h1 style="font-size:0.8em;"> La password deve contenere minimo 6 caratteri e almeno un numero </h1><br><br>
  					
  					    
  						<h1 style="font-size:1em; text-transform:uppercase;" > Inserisci i tuoi dati </h1>
 						<label> Nome </label> <input type="text" name="nome" class="text" onblur="validaNome(this)" style="border:none;border-bottom:1px solid #ea9c74;">
  						<label> Cognome </label> <input type="text" name="cognome" class="text" onblur="validaCognome(this)" style="border:none;border-bottom:1px solid #ea9c74;">
						<label> Codice Fiscale </label> <input type="text" name="codiceFiscale" class="text" onblur="validaCodiceFiscale(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br><br>
						<label> Città </label> <input type="text" name="citta" class="text" onblur="validaCitta(this)" style="border:none;border-bottom:1px solid #ea9c74;">	
						<label> Provincia </label> <input type="text" name="provincia"class="text" onblur="validaProvincia(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br><br>
				        <label> Via </label> <input type="text" name="via" class="text" onblur="validaVia(this)" style="border:none;border-bottom:1px solid #ea9c74;">
						<label> Numero Civico </label><input type="text" name="numeroCivico" onblur="validaNumeroCivico(this)" class="text" style="border:none;border-bottom:1px solid #ea9c74;">
						<label> CAP </label> <input type="text" name="CAP" class="text" onblur="validaCAP(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>	
	
  						<section style="text-align:center;">
  							<input type="submit" class="button medium" value="Registrati su CEStore">
  						</section>  				
  					</form>
				</div>	
					
				<!-- /Registrazione -->
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
	</body>
</html>