<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<!-- faccio il controllo delle variabili che andranno a customizzare il form -->
<% 
	//comandi per invalidare la sessione
	//request.getSession().invalidate();
	//System.out.println(request.getSession(false));
	
	//controllo che tutti i valori passati dal form come attributi sono validi
	//se sono stringhe null, l'attributo non esiste - devo settarlo a stringa vuota
	String username= (String) request.getAttribute("username");
	if(username==null) 
		username="";
		
	String password= (String) request.getAttribute("password");
	if(password==null) 
		password="";
%>

<html>
	<head>
		<title> CEStore </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<script src="js/gestionejQuery.js" type="text/javascript"></script>
		<script src="js/gestioneAjax.js" type="text/javascript"></script>
		<link rel="stylesheet" href="css/style.css"/>
		<script type="text/javascript">
			$(document).ready(function(){   				
		   		//quando il bottone menu è cliccato
				$(".btn-responsive-menu").click(function() {
					$("#nav").toggle();
				});
	    	});
		</script>
	</head>

<body class="homepage">
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
									<input id="ricerca" type="text" name="ricerca" size="40" maxlength="60" class="text" style="border:none;border-bottom:1px solid #ea9c74;" list="ricerca-datalist" onkeyup="ricerca(this.value,this.name)"/>
									<datalist id="ricerca-datalist"></datalist>
									<img id="imgSearch" src="images/search.ico" alt="search">
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
				<section>
					<header>
						<h2> Benvenuti su CEStore</h2>
						<span class="byline">Le migliori marche ai miglior prezzi</span>
					</header>
					<a href="visualizzazioneCapi.jsp?page=1&filter=no" class="button medium"> Scopri la nuova collezione </a>
				</section>	
			</div>
		</div>
		<!-- /Banner -->
	</div>

	<!-- Extra -->
	<div id="extra">
		<div class="container">
			<div class="row">
				<section class="3u">
					<span><img src="images/star.ico" alt="img"></span>
					<header>
						<h2> Must Have </h2>
					</header>
					<p>Scopri tutti i prodotti che non possono mancare nel tuo guardaroba</p>
				</section>
				<section class="3u">
					<span><img src="images/plus.ico" alt="img"></span>
					<header>
						<h2> Novità</h2>
					</header>
					<p>Non farti scappare i nuovi arrivi dei tuoi brand preferiti</p>
				</section>
				<section class="3u">
					<span><img src="images/courier.ico" alt="img"></span>
					<header>
						<h2>Consegna rapida</h2>
					</header>
					<p>Garantiamo anche spedizione in 24h</p>
				</section>
				<section class="3u">
					<span><img src="images/block.ico" alt="img"></span>
					<header>
						<h2>Pagamento sicuro</h2>
					</header>
					<p>Puoi utilizzare le tue carte di credito Mastercard e Postepay in tutta sicurezza</p>
				</section>
			</div>
			<a href="informazioniCEStore.jsp" class="button medium"> Come lavoriamo </a>
		</div>
	</div>
	<!-- /Extra -->

	<!-- Main -->
	<div id="main">
		<div class="container">
			<section>
				<header>
					<h2> Il nostro pensiero </h2>
					<span class="byline">Tutto ciò che serve da indossare con un...click</span>
				</header>
			</section>

			<div class="row">
				<section class="6u right">
					<a href="#" class="image full"><img src="images/homepage.jpg" alt=""></a>
					<p>Lo <strong>shopping online</strong> è la nuova frontiera del commercio:<br>
					   niente fila alle casse, niente taglie terminate, niente folla nei negozi!<br>
					   Torna a casa, prepara un caffè, accendi il pc e acquista ciò che vuoi!<br>
					   Noi di CEStore garantiamo i migliori marchi a prezzi imbattibili e a portata di mouse. 
					</p>
				</section>				
				<section class="6u left">
					<a href="#" class="image full"><img src="images/homepage1.jpg" alt=""></a>
					<p>Non perderti neppure un capo di tutte le nuove collezioni.<br>
					   Potrai acquistare i nuovi trend da poco lanciati nelle sfilate di tutto il mondo:<br>
					   New York, Milano, Parigi non saranno più lontane con CEStore!
					</p>
				</section>
			</div>
			<div class="divider"></div>	
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