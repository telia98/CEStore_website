<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.cestore.model.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title> Sei un nostro cliente registrato? </title>
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

	<%
		BeanUtente utente= (BeanUtente) request.getSession().getAttribute("utente");
	%>
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
		<div style="text-align:center;">
			<%
				if (utente!=null) {
			%>
			<h2 style="font-size:2.8em;"> <%=utente.getNome()%> </h2><br>
			<div class="container">
				<p> clicca qui per procedere all'<a href="ordine.jsp">ordine</a><br>
				<p>altrimenti<br>
				<p> se non sei sicuro, torna alla <a href="homepage.jsp">homepage</a><br>
			</div>
		</div>
		<% } else if (utente==null) { %>
		<div style="text-align:center;">
			<h2 style="font-size:2.8em;"> Vuoi registrarti al nostro sito? </h2><br>
			<div class="container">
				<p> clicca qui per <a href="registrazione.jsp">registrarti</a><br>
				<p>oppure<br>
				<p> se sei già registrato, torna alla <a href="homepage.jsp">homepage</a> per effettuare il login<br>
			</div>
			<h2 style="font-size:2.8em;"> Altrimenti procedi all'acquisto</h2><br>
			<div class="container">
				<p> anche senza registrazione, tornando all'<a href="ordine.jsp">ordine</a><br>
			</div>
			<% } %>
		</div>
	</div>
		
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