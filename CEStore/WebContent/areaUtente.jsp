<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.cestore.model.*"%>
<!DOCTYPE html>

<!-- faccio il controllo delle variabili che andranno a customizzare i form -->
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
	
	BeanUtente utente= (BeanUtente) request.getSession().getAttribute("utente");
%>

<html>
	<head>
		<title> Area Utente </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<script src="js/gestionejQuery.js"></script>
		<script src="js/gestioneAjax.js"></script>
		<script src="js/gestioneJavascript.js"></script>
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
		<script type="text/javascript">
			/**
			 * operazione per attivazione dei campi del form di modifica informazioni personali
			 */
			function editabiliInfo() {
				document.getElementById("nome").removeAttribute("readonly");
				document.getElementById("cognome").removeAttribute("readonly");
				document.getElementById("codiceFiscale").removeAttribute("readonly");
				document.getElementById("username").removeAttribute("readonly");
				document.getElementById("password").removeAttribute("readonly");
				document.getElementById("email").removeAttribute("readonly");
				document.getElementById("modifica").removeAttribute("hidden");
				
				document.getElementById("nome").setAttribute("onblur","validaNome(this)");
				document.getElementById("cognome").setAttribute("onblur","validaCognome(this)");
				document.getElementById("codiceFiscale").setAttribute("onblur","validaCodiceFiscale(this)");
				document.getElementById("username").setAttribute("onblur","validaUsername(this)");
				document.getElementById("password").setAttribute("onblur","validaPassword(this)");
				document.getElementById("email").setAttribute("onblur","validaMail(this)");
			}
			
			function editabiliIndirizzo() {
				document.getElementById("via").removeAttribute("readonly");
				document.getElementById("numeroCivico").removeAttribute("readonly");
				document.getElementById("provincia").removeAttribute("readonly");
				document.getElementById("CAP").removeAttribute("readonly");
				document.getElementById("citta").removeAttribute("readonly");
				document.getElementById("modificaIndirizzo").removeAttribute("hidden");
				
				document.getElementById("via").setAttribute("onblur","validaVia(this)");
				document.getElementById("numeroCivico").setAttribute("onblur","validaNumeroCivico(this)");
				document.getElementById("provincia").setAttribute("onblur","validaProvincia(this)");
				document.getElementById("CAP").setAttribute("onblur","validaCAP(this)");
				document.getElementById("citta").setAttribute("onblur","validaCitta(this)");
			}
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
				<div class="container"></div>
			</div>
			<!-- /Banner -->
		</div>
		
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section class="sidebar" id="side">
							<header>
								<h2> Il mio account </h2>
							</header>
							<ul class="default">
								<li><a href="#info"> Le mie info </a></li>
								<li><a href="#indirizzo"> Il mio indirizzo di consegna </a></li>
								<li><a href="#ordine"> I miei ordini </a></li>
								<li><a href="#pagamento"> I miei metodi di pagamento </a></li>
								<li><a href="Logout"> Logout </a></li>
							</ul>
						</section>
					</div>
					
					<div class="9u skel-cell-important">
						<section id="info">
							<header>
								<h2> Le mie info <a href="javascript:editabiliInfo()"><img src="images/pencil.ico"></a></h2>
								<span class="byline"> Tutte le informazioni che hai inserito al momento della registrazione </span>
							</header>
							<div>
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
								<h3 style="color: #aed1a8;"> <%=message%></h3> <!-- colore verde -->								
								<%
									}
								%>
								<form action="AreaUtenteControl?action=modificaInfo" method="post" name="infoPersonali">
									<p> <h1> Informazioni anagrafiche</h1>
									Nome: <input type="text" id="nome" name="nome" value="<%=utente.getNome()%>" onblur="validaNome(this)" size="25" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									Cognome:<input type="text" id="cognome" name="cognome" value="<%=utente.getCognome()%>" size="25" onblur="validaCognome(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									Codice fiscale:<input type="text" id="codiceFiscale" name="codiceFiscale" value="<%=utente.getCodiceFiscale()%>" size="20" onblur="validaCodiceFiscale(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br><br>
									<h1> Informazioni login </h1>
									Username:<input type="text" id="username" name="username" value="<%=utente.getUsername()%>" size="25" onblur="validaUsername(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									Password:<input type="password" id="password" name="password" value="<%=utente.getPassword()%>" size="25" onblur="validaPassword(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									E-mail:<input type="email" id="email" name="email" value="<%=utente.getMail()%>" size="30" onblur="validaMail(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br><br>
									<input type="submit" value="modifica" id="modifica" hidden="true">
								</form> 
							</div>
						</section>
						
						<section id="indirizzo">
							<header>
								<h2> Il mio indirizzo di consegna <a href="javascript:editabiliIndirizzo()"><img src="images/pencil.ico"></a></h2>
								<span class="byline"> Il tuo indirizzo di consegna corrisponderà a quello di fatturazione </span>
							</header>
							<div>
								<form action="AreaUtenteControl?action=modificaIndirizzo" method="post" name="indirizzo">
									<p> <h1> Indirizzo di fatturazione </h1>
									Via:<input type="text" name="via" id="via" value="<%=utente.getVia()%>" size="25" onblur="validaVia(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									n° civico:<input type="text" name="numeroCivico" id="numeroCivico" value="<%=utente.getnCivico()%>" size="7" onblur="validaNumeroCivico(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									provincia:<input type="text" name="provincia" id="provincia" value="<%=utente.getProvincia()%>" size="7" onblur="validaProvincia(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									CAP:<input type="text" name="CAP" id="CAP" value="<%=utente.getCap()%>" size="7" onblur="validaCAP(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br>
									città:<input type="text" name="citta" id="citta" value="<%=utente.getCitta()%>" size="25" onblur="validaCitta(this)" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
									<br><br>
									<input type="submit" value="modifica" id="modificaIndirizzo" hidden="true">
								</form>
							</div>
						</section>
						
						<section id="ordine">
							<%
								ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
								if (fatture!=null) {
							%>
							<header>
								<h2>I miei ordini </h2>
								<span class="byline"> Rivedi tutti i tuoi acquisti </span>
							</header>
							<%
									for(BeanFattura f: fatture) {
							%>
							<p>
							 <h1> Ordine </h1>
							 Id ordine: <%=f.getIdFattura()%><br>
							 Totale ordine: <%=f.getTotale()%><br>
							 	<%  } %>
							 <%  } %>
						</section>
						
						<section id="pagamento">
							<%
								ArrayList<BeanCartaDiCredito> carte=(ArrayList<BeanCartaDiCredito>) request.getSession().getAttribute("carte");
								if (carte!=null) {
							%>
							<header>
								<h2> I miei metodi di pagamento </h2>
								<span class="byline"> Tutte le informazioni su come hai eseguito i tuoi pagamenti </span>
							</header>
							<%
									for(BeanCartaDiCredito c: carte) {
							%>
							<p>
							 <h1> Carta di credito </h1>
							 Titolare carta: <%=utente.getNome() + " " + utente.getCognome()%><br>
							 Numero carta: <%=c.getNumeroCarta()%><br>
							 Scadenza: <%=c.getDataScadenza()%><br>
							 	<%  } %>
							 <%  } %>
							 
							 <%
								ArrayList<BeanBonifico> bonifici=(ArrayList<BeanBonifico>) request.getSession().getAttribute("bonifici");
								if (bonifici!=null) {
									for(BeanBonifico b: bonifici) {
							%>
							<p> 
							 <h1> Bonifico</h1>
							 IBAN: <%=b.getIban()%><br>
							 Nome mittente: <%=b.getNomeMittente()%><br>
							 	<%  } %>
							 <%  } %>
						</section>
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
	</body>
</html>