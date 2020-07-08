<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.cestore.model.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Ordine </title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/skel.min.js"></script> <!--  da non togliere: è questo che da tutto il layout -->
	<script src="js/init.js"></script><!--  da non togliere: è questo che da tutto il layout -->
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
		function visualCarta() {
			document.getElementById("visualCarta").removeAttribute("hidden");
			document.getElementById("visualBonifico").setAttribute("hidden","true");
		}
		
		function visualBonifico() {
			document.getElementById("visualBonifico").removeAttribute("hidden");
			document.getElementById("visualCarta").setAttribute("hidden","true");
		}
 	</script>
</head>
<body>
	<%
		ArrayList<BeanCapo> carrello= (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
		if (carrello==null) {
			response.sendRedirect("./OrdineControl?action=carrello");
			return;
		}
		
		//recuperiamo l'utente e i relativi metodi di pagamento
		BeanUtente utente = (BeanUtente) request.getSession().getAttribute("utente");
		
		ArrayList<BeanCartaDiCredito> carte= null;
		if (request.getSession().getAttribute("carte")!=null)
			carte=(ArrayList<BeanCartaDiCredito>) request.getSession().getAttribute("carte");
		
		ArrayList<BeanBonifico> bonifici=null;
		if (request.getSession().getAttribute("bonifici")!=null)
			bonifici=(ArrayList<BeanBonifico>) request.getSession().getAttribute("bonifici");
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
		<h2 style="font-size:2.8em;text-align:center;"> Dettagli ordine</h2><br><br><br>
		<div class="container">
			<form action="OrdineControl?action=acquisto" method="post"> 
				<%
					//controlliamo se è arrivato un messaggio di errore dalla request
					String error=(String) request.getAttribute("message");
					if (error!=null) {	
				%> 	
				<h3 style="color: #ea9c74;text-align:center;"> <%=error%></h3> <!-- colore arancione -->								
				<%
					}
				%>
				<!-- Ordine -->
				<div class="row">
					<div class="capo">
						<h1>Seleziona il metodo di pagamento</h1>
 				 		<input type="radio" name="method" value="cartaDiCredito" onclick="visualCarta()"> Carta di credito<br>
 				 		<input type="radio" name="method" value="bonifico" onclick="visualBonifico()"> Bonifico<br>
						<div class="capo" hidden="true" id="visualCarta">
							<% 
								if (utente!=null) {
  									if (carte.size()!=0) {
  									//utente loggato e recupero le carte dalla sessione
  							%>
  							<section>
  								<input type="text" hidden="true" value="pagaCarta">
  								<h1> Dati Carta di credito: </h1>
  								<label>Numero Carta: </label><input type="text" name="nCarta" id="nCarta" size="20" value="<%=carte.get(0).getNumeroCarta()%>" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
  								<label>Data scadenza: </label><input type="text" name="data" id="data" size="10" value="<%=carte.get(0).getDataScadenza()%>" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
  								<label>CVV: </label><input type="text" name="cvv" id="cvv" size="5" value="<%=carte.get(0).getCvv()%>" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
  							</section>
  							<%  	} else { 
  									//utente loggato che deve essere inserita una nuova carta di credito
  							%>
  							<section>
  								<input type="text" hidden="true" value="pagaCarta">
  								<h1> Dati Carta di credito: </h1>
  								<label>Numero Carta: </label><input type="text" name="nCarta" id="nCarta" size="20" onblur="validanCarta(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  								<label>Data scadenza: </label><input type="text" name="data" id="data" size="10" onblur="validaData(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  								<label>CVV: </label><input type="text" name="cvv" id="cvv" size="5" onblur="validaCvv(this)" style="border:none;border-bottom:1px solid #ea9c74;">
  							</section>
  							<%  	} 
								} else {
  									//utente occasionale che deve inserire una nuova carta di credito
  							%>
  							<section>
  								<input type="text" hidden="true" value="pagaCarta">
  								<h1> Dati Carta di credito: </h1>
  								<label>Numero Carta: </label><input type="text" name="nCarta" id="nCarta" size="20" onblur="validanCarta(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  								<label>Data scadenza: </label><input type="text" name="data" id="data" size="10" onblur="validaData(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  								<label>CVV: </label><input type="text" name="cvv" id="cvv" size="5" onblur="validaCvv(this)" style="border:none;border-bottom:1px solid #ea9c74;">
  							</section>
  							<% 		} %>
  						</div>

  						<div class="capo" hidden="true" id="visualBonifico">
  							<% 
  								if (utente!=null) {
									if (bonifici.size()!=0) {
									//utente loggato e recupero i bonifici dalla sessione
  							%>
  							<section>
  								<input type="text" hidden="true" value="pagaBonifico">
  								<h1>Dati bonifico: </h1>
  								<label>Nome mittente: </label><input type="text" name="nomeMittente" id="nomeMittente" value="<%=bonifici.get(0).getNomeMittente()%>" size="15" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
  								<label>IBAN: </label><input type="text" name="iban" id="iban" value="<%=bonifici.get(0).getIban()%>" size="30" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
  							</section>
  							<%  	} else { 
  									//utente loggato che deve essere inserito un nuovo bonifico
  							%>
  							<section>
  								<input type="text" hidden="true" value="pagaBonifico">
  								<h1>Dati bonifico: </h1>
  								<label>Nome mittente: </label><input type="text" name="nome" id="nomeMittente" onblur="validaNome(this)" size="20" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  								<label>IBAN: </label><input type="text" name="iban" id="iban" size="30" onblur="validaIban(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  							</section>
  							<%  	} 
  								} else { 
  							%>
  							<section>
  								<input type="text" hidden="true" value="pagaBonifico">
  								<h1>Dati bonifico: </h1>
  								<label>Nome mittente: </label><input type="text" name="nomeMittente" id="nomeMittente" onblur="validaNome(this)" size="20" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  								<label>IBAN: </label><input type="text" name="iban" id="iban" size="30" onblur="validaIban(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  							</section>
  							<%  }  %>
  						</div>
  					</div>
  				
  					<div class="capo" >
  						<section>
  							<h1>Totale ordine: </h1>
  						</section>
  						<%
  							float totale=0;
  							for(int i=0;i<carrello.size();i++) {
  								totale+=carrello.get(i).getCosto();
  							}
  						%>
  						<p><input type="text" name="spesaTotale" id="spesaTotale" value="<%=totale%>" size="5" style="border:none;border-bottom:1px solid #ea9c74;" readonly> &euro;
  					</div>
  					<script type="text/javascript">
  						function noplus() {
  							document.getElementById("plus").setAttribute("hidden","true");
  							document.getElementById("spesaTotale").setAttribute("value","<%=totale%>");
  						}
  						
  						function siplus() {
  							document.getElementById("plus").removeAttribute("hidden");
  							document.getElementById("spesaTotale").setAttribute("value","<%=totale+5%>");
  						}
  					</script>
  					<div class="capo">	
						<h1>Seleziona la tipologia di spedizione</h1>
 				 		<input type="radio" name="sped" id="standard" name="standard" onclick="noplus()" value="Spedizione standard" checked>Spedizione standard 5/7 giorni lavorativi<br>
 				 		<input type="radio" name="sped" id="express" name="express" onclick="siplus()" value="Spedizione express"> Spedizione express 2/3 giorni<br>
  						<section>
  							<h1>Ditta di spedizione</h1>
  							<%
  								//generazione random della ditta di spedizione
  								ArrayList<String> ditte=new ArrayList<String>();
  								ditte.add("SDA"); ditte.add("BRT"); ditte.add("GLS"); ditte.add("DHL");
  							
  								Random random=new Random();
  								int value=random.nextInt(3);
  							%>
  							<input type="text" name="ditta" id="ditta" hidden="true" value="<%=ditte.get(value)%>">
  							<p><%=ditte.get(value)%></p><p id="plus" hidden> Sovrapprezzo previsto: 5&euro;</p>
  						</section>
					</div>	
				</div>
				<br><br><br>
				<div class="row">
					<section>
  						<h1>Indirizzo di spedizione</h1>
  					</section>
  					<%
  						if (utente!=null) {
  							//si tratta di un utente registrato e loggato
  					%>
  					<p>
  					<div class="form" style="text-align:center;">
  						Nome:<input type="text" name="nome" id="nome" value="<%=utente.getNome()%>" size="25" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
						Cognome:<input type="text" name="cognome" id="cognome" value="<%=utente.getCognome()%>" size="25" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
						Via:<input type="text" name="via" id="via" value="<%=utente.getVia()%>" size="25" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
						n° civico:<input type="text" name="numeroCivico" id="numeroCivico" value="<%=utente.getnCivico()%>" size="7" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
						provincia:<input type="text" name="provincia" id="provincia" value="<%=utente.getProvincia()%>" size="7" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
						CAP:<input type="text" name="CAP" id="CAP" value="<%=utente.getCap()%>" size="7" style="border:none;border-bottom:1px solid #ea9c74;" readonly>
						città:<input type="text" name="citta" id="citta" value="<%=utente.getCitta()%>" size="25" style="border:none;border-bottom:1px solid #ea9c74;" readonly><br>
					</div>
					<%
  						} else {
  							//si tratta di un utente occasionale che deve inserire l'indirizzo di spedizione
					%>
					<div>
 						<label> Nome </label> <input type="text" name="nome" class="text" onblur="validaNome(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
  						<label> Cognome </label> <input type="text" name="cognome" class="text" onblur="validaCognome(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
						<label> Città </label> <input type="text" name="citta" class="text" onblur="validaCitta(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>	
						<label> Provincia </label> <input type="text" name="provincia"class="text" onblur="validaProvincia(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
				   	 	<label> Via </label> <input type="text" name="via" class="text" onblur="validaVia(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
						<label> Numero Civico </label><input type="text" name="numeroCivico" class="text" onblur="validaNumeroCivico(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>
						<label> CAP </label> <input type="text" name="CAP" class="text" onblur="validaCAP(this)" style="border:none;border-bottom:1px solid #ea9c74;"><br>					
  					</div>
  					<%
  						}
  					%>
				</div>
			
				<div class="row">
					<section>
  						<h1>Riepilogo ordine</h1>
  					</section>
  					<%
						for(int i=0;i<carrello.size();i++) {
							String tabella;
							if (carrello.get(i).getClass()==BeanVestiario.class)
								tabella="vestiario";
							else
								tabella="accessorio";
					%>
              		<div>
               			<div class="row">
               				<div class="capo" id="img_ordine">
               					<img width="60px" height="70px" src="GetPictureServlet?codCapo=<%=carrello.get(i).getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1">
               				</div>
               				<div class="capo">
               					<% 	
               						String descrizione=carrello.get(i).getDescrizione();
               						
									int inizio=descrizione.indexOf("marca");
									int fine=descrizione.indexOf(",",inizio);
									String marca=descrizione.substring((inizio+6),fine);
								%>
								<h3> Marca </h3><%=marca%><br><br>
							</div>
							<div class="capo">
               					<%
               						String info="";
           							if (tabella.equals("vestiario")) {
           								inizio=descrizione.indexOf("info");
										fine=descrizione.indexOf(",",inizio);
										info=descrizione.substring((inizio+5),fine);
           							} else {
           								inizio=descrizione.indexOf("info");
										fine=descrizione.indexOf(" ", (inizio+5));
										info=descrizione.substring(inizio+5,fine);
           							}
               					%> 
               					<h3> Informazioni capo </h3><%=info%><br><p>
               				</div>
               				<div class="capo">
								<h3> Costo </h3><%=carrello.get(i).getCosto()%>€<br><br>
							</div>
							<div class="capo">
								<%
									if (carrello.get(i).getClass()==BeanVestiario.class) {
										BeanVestiario vestiario= (BeanVestiario) carrello.get(i);
								%>
								<h3> Taglia </h3><%=vestiario.getTaglia()%><br>
								<%
									} else {
								%>
								<h3> Taglia </h3>onesize<br>
								<% } %>
							</div>
						</div>				
  						<% 
  							}
						%>
					</div>
				</div>
				<br><br>
				<div class="row" style="align:center;">
					<section>
  						<input type="submit" class="button medium" value="Concludi l'ordine">
  					</section> 
  				</div>
  			</form>
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