<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="it.cestore.model.*,java.util.*"%>
<!DOCTYPE html>

<html>
	<head>
		<title> CEStore </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width">
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
					$("#nav").toggle();
				});
	    	});
		</script>
	</head>

	<body>
		<%
			BeanCapo capo=(BeanCapo) request.getAttribute("capo");
			if (capo==null) {
				String string="./CapoControl?pos=" + request.getParameter("pos");
				response.sendRedirect(string);
				return;
			}
			
			String tabella;
			if (capo.getClass()==BeanVestiario.class)
				tabella="vestiario";
			else
				tabella="accessorio";
			
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
					<div class="row">
						<div class="3u">
     	 					<section class="sidebar">						                		
                				<div class="foto">
                					<img id="img_fronte" alt="foto frontale del capo" width="150px" height="170px" src="GetPictureServlet?codCapo=<%=capo.getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1" onclick="changeImg(this.src)">
                					<img id="img_retro" alt="foto retro del capo" width="150px" height="170px" src="GetPictureServlet?codCapo=<%=capo.getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto2" onclick="changeImg(this.src)">
                					<%
                						byte[] foto=PhotoControl.load(capo.getCodCapo(),tabella,"linkFoto3");
                						if (foto!=null) {
                					%>
                					<img id="img_lato" alt="foto laterale del capo" width="150px" height="170px" src="GetPictureServlet?codCapo=<%=capo.getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto3" onclick="changeImg(this.src)">
                					<%  } %>
                				</div>
                				<script type="text/javascript">
     	 							function changeImg(imgNuova) {
     	 								document.getElementById("img_grande").setAttribute("src",imgNuova);
     	 							}
     	 						</script>	
							</section>
						</div>
					
						<div style="max-width:100%;">
							<div class="capo">
                				<img id="img_grande" alt="foto del capo" height="600px" src="GetPictureServlet?codCapo=<%=capo.getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1">
                			</div>	

                			<div class="capo">
               					<form action="AggiungiAlCarrelloServlet?capo=<%=capo.getCodCapo()%>&tabella=<%=tabella%>" method="post">
               						<% 
               							String descrizione=capo.getDescrizione();
               						
										int inizio=descrizione.indexOf("marca");
										int fine=descrizione.indexOf(",",inizio);
										String marca=descrizione.substring((inizio+6),fine);
									%>
									<h3> Marca </h3><%=marca%><br><br>
               						<h3> Descrizione capo </h3><p>
               						<%
               							//elimino la sezione marca dalla stringa della descrizione perchè già letta precedentemente
               							String part1=descrizione.substring(0,inizio);
               							String part2=descrizione.substring(fine+1);
               							String description=part1.concat(part2);
               						
               							//individuo le sotto sezioni della stringa separate dalla virgola
               							StringTokenizer token= new StringTokenizer(description, ",");
               							while (token.hasMoreTokens()) {       									
               						%> 
               							<%=token.nextToken()%><br>
									<% 	}  %>
									<h3> Costo </h3><%=capo.getCosto()%>&euro;<br><br>
									<%
										if (capo.getClass()==BeanVestiario.class) {
											BeanVestiario vestiario= (BeanVestiario) capo;
									%>
									<h3> Taglia disponibile </h3><%=vestiario.getTaglia()%><br>
									<%
										} else {
									%>
									<h3> Taglia disponibile </h3>onesize<br>
									<%  } %>
									<input type="submit"  class="button medium" value="Aggiungi al carrello">
								</form>
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
	</body>
</html>