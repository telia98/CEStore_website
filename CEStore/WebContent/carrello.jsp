<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.cestore.model.*"%>

<!DOCTYPE HTML>

<html>
	<head>
		<title> CEStore </title>
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
			String action=request.getParameter("action");
			ArrayList<BeanCapo> carrello=(ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
			if(carrello==null) {
				String redirect="./CarrelloControl?action=" + action;
				response.sendRedirect(redirect);
				return;
			}
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
				<div>
					<div id="ilmiocarrello">
						<h2> Il mio carrello </h2>
					</div>
					<br><br>
					
					<%
						if (carrello.size()==0) {
					%>
						<h3 style="text-align:center;color: #aed1a8;">Il carrello è vuoto</h3> <!-- colore verde -->
					<%
						} else {
							for(int i=0;i<carrello.size();i++) {
								String tabella;
								if (carrello.get(i).getClass()==BeanVestiario.class)
									tabella="vestiario";
								else
									tabella="accessorio";
					%>
              		<div>
               			<div class="row">
               				<div class="capo">
               					<img id="imgCart" width="150px" height="170px" src="GetPictureServlet?codCapo=<%=carrello.get(i).getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1">
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
								<h3> Taglia disponibile </h3><%=vestiario.getTaglia()%><br>
								<%
									} else {
								%>
								<h3> Taglia disponibile </h3>onesize<br>
								<% } %>
							</div>
							<div class="capo">
								<form action="CarrelloControl?action=elimina" method="post">
									<input type="text" value="<%=carrello.get(i).getCodCapo()%>" name="codCapo" hidden="true">
									<input type="text" value="<%=tabella%>" name="tabella" hidden="true">
									<input type="submit" value="elimina">
								</form>
							</div>
						</div>
					</div>					
  					<% 
  							}
						}
					%>
  					
  					<%
  						if (carrello.size()!=0) {
  					%>
  					<section style="text-align:center;">
						<a href="preOrdine.jsp" class="button medium"> Procedi all'acquisto</a>
					</section>	
					<%  } %> 
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