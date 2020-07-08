<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> Error page </title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/skel.min.js"></script> <!--  da non togliere: è questo che da tutto il layout -->
	<script src="js/init.js"></script><!--  da non togliere: è questo che da tutto il layout -->
	<script src="js/gestionejQuery.js"></script>
	<script src="js/gestioneAjax.js"></script>
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
		<%
			if (request.getParameter("message")==null) {
		%>
		<h2 style="font-size:2.8em;text-align:center;">Ops! Qualcosa è andato storto...</h2><br><br><br>
		<%  } else { %>
		<h2 style="font-size:2.8em;text-align:center;"><%=request.getParameter("message")%></h2><br><br><br>
		<%  } %>
		<div class="container">
			
			<!-- Messaggio di errore -->
			<div style="text-align:center;">
				Si è verificato un problema durante l'elaborazione della tua richiesta.<br>
    			Riprendi la tua esperienza sulla nostra piattaforma tornando alla <a href="homepage.jsp"> homepage</a>.
			</div>	
			<!-- /Messaggio di errore -->
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