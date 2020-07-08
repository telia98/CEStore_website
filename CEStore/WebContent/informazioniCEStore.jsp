<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<title> Come lavoriamo </title>
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
				<div class="container"></div>
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
								<h2>Aiuto</h2>
							</header>
							<ul class="default">
								<li><a href="#informazioni">Informazioni su CEStore </a></li>
								<li><a href="#pagamento">Metodi di pagamento </a></li>
								<li><a href="#spedizione">Tempi di spedizione </a></li>
								<li><a href="#ordini">Come ordinare </a></li>
								<li><a href="#trovaOrdine"> Dove si trova l'ordine </a></li>
							</ul>
						</section>
					</div>
				
					<div class="9u skel-cell-important">
						<section id="informazioni">
							<header>
								<h2>Informazioni su CEStore</h2>
								<span class="byline">Chi siamo</span>
							</header>
							 <p> CEStore è una società italiana di e-commerce con sede a Napoli, specializzata nella vendita online di scarpe, vestiti e altri accessori. 
							 Creata nel 2019, offre il suo servizio di rivendita in 17 stati d'Europa.<br>
							 Per la prima volta online nello stesso anno di fondazione, la società offre un'ampia gamma di prodotti di moda di brand accuratamente selezionati, per soddisfare le esigenze di ogni tipo di cliente.<br>
							 <br>Sede:<br>
							 CEStore sas<br>
							 Via Corso Europa, 30<br>
							 80100 Napoli<br>
							 Italia<br>
							 <br>Titolari:<br>
							 Castaldo Giusy, Cerullo Mary, Cipriano Noemi, Elia Teresa<br>
							 <br> Email:<br>
							 infoazienda@cestore.it<br>
							 </p>
						</section>
						<section id="pagamento">
							<header>
								<h2>Metodi di pagamento</h2>
								<span class="byline">Sicurezza garantita</span>
							</header>
							<p>Potrai scegliere se utilizzare la tua carta di credito Mastercard e Visa e tutte le principali carte di credito e prepagate oppure effettuare un pagamento tramite bonifico.
							   Al momento del pagamento potresti essere indirizzato alla pagina della tua banca per la sua elaborazione.<br>
							   L’ammontare verrà addebitato solo quando il tuo pacco sarà effettivamente spedito.<br>
							   Se restituisci la merce, l’importo verrà riaccreditato sulla stessa carta con cui hai effettuato l'acquisto o sul conto corrente ad essa collegato, a seconda delle impostazioni della tua banca.<br>
							   <br><img src="images/mastercard.ico" alt="mastercard">
							   <img src="images/visa.ico" alt="visa">
							   <img src="images/americanexpress.ico" alt="american express">
							</p>
						</section>
						<section id="spedizione">
							<header>
								<h2>Tempi di spedizione</h2>
								<span class="byline"> Due differenti modalità di spedizione </span>
							</header>
							<p>
							Al momento dell'acquisto sarà assegnata al tuo ordine una ditta di spedizione che si occuperà di far arrivare il pacco all'indirizzo di consegna indicato.<br>
							Potrai scegliere tra:<br>
							- spedizione standard in 7-10 giorni lavorativi<br>
							- spedizione express in 1-3 giorni ad un piccolo costo aggiuntivo<br>
							<br>Lavoriamo con ditte di spedizione note in Italia ed Europa e garantite per sicurezza e puntualità della consegna.<br>
							<br> <img src="images/brt.png" alt="brt" style="height:50px;width:50px">
							<img src="images/dhl.jpg" alt="dhl" style="height:50px;width:50px">
							<img src="images/gls.png" alt="gls" style="height:50px;width:70px">
							<img src="images/sda.png" alt="sda" style="height:50px;width:50px">
							</p>
						</section>
						<section id="ordini">
							<header>
								<h2>Come ordinare</h2>
								<span class="byline"> Tutte le informazioni necessarie per il tuo acquisto </span>
							</header>
							<p>- Cancellare un articolo o un ordine<br>
							Hai ordinato un articolo sbagliato? Potrai cancellare l'ordine oppure eliminare uno o più articoli</p>
							<p>- Prodotto difettoso<br>
							Se un articolo ricevuto è difettoso, potrai procedere ad un reclamo</p>
							<p>- Procedi all'ordine<br>
							Dopo aver scelto il prodotto, seleziona la taglia e poi aggiungilo al carrello</p>
							<p>- La tua taglia è esaurita<br> 
							È possibile che al momento della scelta della taglia questa risulti esaurita</p>
							<p>- Acquisto<br>
							Se sei un nuovo cliente potrai scegliere se registrarti o meno e in entrambi i casi potrai procedere all'acquisto</p>
							<p>- Originalità dei prodotti su CEStore<br>
							I prodotti in vendita su CEStore sono 100% originali</p>
							<p>- Dettagli prodotto<br>
							La pagina che descrive il prodotto fornisce numerose informazioni per aiutarti a scegliere quello giusto per te</p>
							<p>- Come cercare un articolo<br>
							Ricerca l'articolo che preferisci utilizzando i filtri che trovi sulla pagina che visualizzi</p>
							</p>
						</section>
						<section id="trovaOrdine">
							<header>
								<h2>Dove si trova l'ordine</h2>
								<span class="byline">E' fornito un contatto diretto con la ditta di spedizione </span>
							</header>
							<p>
							Puoi rintracciare il tuo ordine direttamente dal sito web della ditta di spedizione che lo gestisce.<br>
							Dopo averlo concluso, questo resterà in elaborazione per un massimo di due giorni lavorativi.
						   	Quando il tuo pacco sarà pronto verrà spedito e sarà rintracciabile.<br>
						   	Gli sarà assegnato un codice ordine attraverso cui lo potrai rintracciare direttamente dal sito web della ditta di spedizione che lo gestisce.
						   	Non ti preoccupare se non viene individuato tramite il codice inserito, la tracciabilità si attiverà entro 72 ore lavorative, dopo le quali potrai visualizzare la data di consegna.<br>
							<br>SDA: <br>
							<a href="https://www.sda.it/wps/portal/sdait.home/">https://www.sda.it</a>
							<br>UPS: <br>
							<a href="https://www.ups.com/us/en/Home.page">https://www.ups.com</a>
							<br>DHL: <br>
							<a href="https://www.logistics.dhl/it-it/home.html">https://www.logistics.dhl</a>
							<br>GLS: <br>
							<a href="https://www.gls-italy.com">https://www.gls-italy.com</a>
							</p>
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