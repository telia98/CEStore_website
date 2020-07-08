<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.cestore.model.*"%>

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
			String action=request.getParameter("action");
			String filter=request.getParameter("filter");
			String p=request.getParameter("page");
			ArrayList<BeanCapo> capi=(ArrayList<BeanCapo>) request.getSession().getAttribute("capi");
			
			//da homepage per far funzionare Uomo/Donna/Unisex quando capi è null
			if (filter.equals("si")) {
				String string="./FilterControl?page=" + p + "&filter=" + filter + "&action=" + action;
				if (capi==null) {
					response.sendRedirect(string);
					return;
				}
			}
			
			//da homepage per fa funzionare scopri la nuova collezione quando capi è null
			if (filter.equals("no")) {
				String string="./CapiControl?page=" + p + "&filter=" + filter;
				if (capi==null) {
					response.sendRedirect(string);
					return;
				}
			}
			
			int pagina=Integer.parseInt(request.getParameter("page"));
			filter= (String) request.getSession().getAttribute("filter");
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
						<li><a href="FilterControl?page=1&filter=si&action=donna"> Donna </a></li>
						<li><a href="FilterControl?page=1&filter=si&action=uomo"> Uomo </a></li>
						<li><a href="FilterControl?page=1&filter=si&action=unisex"> Unisex </a></li>
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
						<li><a href="carrello.jsp"> Carrello </a></li>
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
				<div class="container"></div></div>
			<!-- /Banner -->
		</div>

		<!-- Main -->
		<div id="main">
			<div class="container">
							
				<!-- menu orizzontale -->
				<div id="nav">
					<ul id="capi">
						<li id="taglia"><a href="#taglia"> Taglia </a>
							<div id="taglia" style="height:200px;overflow:auto;">
								<form action="FilterFormControl?action=taglia&page=1&filter=si" method="post">
									<input type="checkbox" name="size" value="XS"><label for="XS"> XS</label><br>
									<input type="checkbox" name="size" value="S"><label for="S"> S</label><br>
									<input type="checkbox" name="size" value="M"><label for="M"> M</label><br>
									<input type="checkbox" name="size" value="L"><label for="L"> L</label><br>
									<input type="checkbox" name="size" value="XL"><label for="XL"> XL</label><br>
									<input type="checkbox" name="size" value="36"><label for="36"> 36</label><br>
									<input type="checkbox" name="size" value="37"><label for="37"> 37</label><br>
									<input type="checkbox" name="size" value="38"><label for="38"> 38</label><br>
									<input type="checkbox" name="size" value="39"><label for="39"> 39</label><br>
									<input type="checkbox" name="size" value="40"><label for="40"> 40</label><br>
									<input type="checkbox" name="size" value="41"><label for="41"> 41</label><br>
									<input type="checkbox" name="size" value="42"><label for="42"> 42</label><br>
									<input type="reset" value="annulla">
									<input type="submit" value="salva">
								</form>
							</div>
						</li>
						<li id="colore"><a href="#colore"> Colore </a>
							<div id="colore" style="height:200px;overflow:auto;">
								<form action="FilterFormControl?action=colore&page=1&filter=si" method="post">
                             		<input type="checkbox" name="color" value="rosso"><img alt="red" src="./images/rosso.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="giallo"><img alt="yellow" src="./images/giallo.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="verde"><img alt="green" src="./images/verde.jpg" style="height: 20px;width: 20px;"><br>
                              		<input type="checkbox" name="color" value="bordeaux"><img alt="bordeaux" src="./images/bordeaux.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="nero"><img alt="black" src="./images/nero.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="grigio"><img alt="grey" src="./images/grigio.jpg" style="height: 20px;width: 20px;"><br>
                              		<input type="checkbox" name="color" value="rosa"><img alt="pink" src="./images/rosa.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="blu"><img alt="blue" src="./images/blu.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="bianco"><img alt="white" src="./images/bianco.jpg" style="height: 20px;width: 20px;"><br>
                              		<input type="checkbox" name="color" value="azzurro"><img alt="light blue" src="./images/azzurro.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="arancione"><img alt="orange" src="./images/arancione.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="viola"><img alt="purple" src="./images/viola.png" style="height: 20px;width: 20px;"><br>
                              		<input type="checkbox" name="color" value="marrone"><img alt="brown" src="./images/marrone.jpg" style="height: 20px;width: 20px;">
                              		<input type="checkbox" name="color" value="multicolore"><img alt="multicolor" src="./images/multicolore.jpg" style="height: 20px;width: 20px;"><br>
                              		<input type="reset" value="annulla">
                              		<input type="submit" value="salva">
                                </form>
                       		</div>
						</li>
						<li id="materiale"><a href="#materiale"> Materiale </a>
							<div id="materiale" style="height:200px;overflow:auto;">
								<form action="FilterFormControl?action=materiale&page=1&filter=si" method="post">
									<!-- script per recuperare il materiale dai capi -->
									<% 
										Set<String> materiali=new HashSet<String>();
										
										for(int i=0; i<capi.size(); i++) { 
											//controllo se il capo è un vestiario (perchè solo i capi di vestiario specificano il materiale di fabbricazione)
											if(capi.get(i).getClass()==BeanVestiario.class) {
												BeanVestiario capo=(BeanVestiario) capi.get(i);
												//memorizzo il materiale trovato
												materiali.add(capo.getMateriale());
											}
										}
										
										for(String materiale : materiali) {
									%>
									<input type="checkbox" name="materials" value="<%=materiale%>"><label for="<%=materiale%>"><%=materiale %></label><br>
									<% 
										} 
									%>	
									<input type="reset" value="annulla">
									<input type="submit" value="salva">
								</form>
							</div>
						</li>
						<li id="brand"><a href="#brand"> Brand </a>
							<div id="brand" style="height:200px;overflow:auto;">
								<form action="FilterFormControl?action=brand&page=1&filter=si" method="post">
									<!-- script per recuperare la marca dalla descrizione dei capi -->
									<% 
										Set<String> marche=new HashSet<String>();
									
										for(int i=0; i<capi.size(); i++) { 
											BeanCapo capo=(BeanCapo) capi.get(i);
											//memorizzo il brand trovato
											String descrizione=capo.getDescrizione();
											int inizio=descrizione.indexOf("marca");
											int fine=descrizione.indexOf(",",inizio);
											String marca=descrizione.substring((inizio+6),fine);
											marche.add(marca);
										}
									
										for(String marca : marche) {
									%>
									<input type="checkbox" name="brand" value="<%=marca%>"><label for="<%=marca%>"><%=marca %></label><br>
									<% 
										} 
									%>	
									<input type="reset" value="annulla">
									<input type="submit" value="salva">
								</form>
							</div>
						</li>
						<li id="fantasia"><a href="#fantasia"> Fantasia </a>
							<div id="fantasia" style="height:200px;overflow:auto;">
								<form action="FilterFormControl?action=fantasia&page=1&filter=si" method="post">
									<!-- script per recuperare la fantasia dalla descrizione dei capi -->
									<% 
										Set<String> fantasie=new HashSet<String>();
									
										for(int i=0; i<capi.size(); i++) { 
											BeanCapo capo=(BeanCapo) capi.get(i);
											//memorizzo il brand trovato
											String descrizione=capo.getDescrizione();
											int inizio=descrizione.indexOf("fantasia");
											int fine=descrizione.indexOf(",",inizio);
											String fantasia=descrizione.substring((inizio+9),fine);
											fantasie.add(fantasia);
										}
								
										for(String stile : fantasie) {
									%>
									<input type="checkbox" name="style" value="<%=stile%>"><label for="<%=stile%>"><%=stile%></label><br>
									<% 
										} 
									%>	
									<input type="reset" value="annulla">
									<input type="submit" value="salva">
								</form>
							</div>
						</li>
						<li id="stagione"><a href="#stagione"> Stagione </a>
							<div id="stagione" style="overflow:auto;height:auto;">
								<form action="FilterFormControl?action=stagione&page=1&filter=si" method="post">
									<input type="checkbox" name="pattern" value="autunno/inverno"><label for="autunno/inverno">Autunno/Inverno</label><br>
									<input type="checkbox" name="pattern" value="primavera/estate"><label for="primavera/estate">Primavera/Estate</label><br>
									<input type="button" value="annulla"><input type="submit" value="salva">
								</form>
							</div>
						</li>
					</ul>
				</div>
				<!-- /menu orizzontale -->
			
				<div class="row">
				
					<!-- drop-menu laterale -->
					<div id="totalSidebar"> 
						<section class="sidebar">
							<header>
								<h2><a href="FilterControl?page=1&filter=si&action=vestiario">Vestiario</a></h2>
							</header>
							<ul class="default">
								<li><a href="FilterControl?page=1&filter=si&action=maglia">Maglie</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=giacca">Giacche</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=pantalone">Pantaloni</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=vestito">Vestiti</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=scarpe">Scarpe</a></li>
							</ul>
						</section>
						<section class="sidebar">
							<header>
								<h2><a href="FilterControl?page=1&filter=si&action=accessorio">Accessorio</a></h2>
							</header>
							<ul class="default">
								<li><a href="FilterControl?page=1&filter=si&action=borsa">Borse</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=gioielli">Gioielli</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=sciarpe">Sciarpe</a></li>
								<li><a href="FilterControl?page=1&filter=si&action=cappelli">Cappelli</a></li>
							</ul>
						</section>
					</div>
					<!-- /drop-menu laterale -->
					
					<!-- griglia visualizzazione capi -->
					<div id="grid">
					<% 
						if (capi.size()==0) {
					%>	
					<h3 style="color: #ea9c74;text-align:center;">Non ci sono capi per i criteri di ricerca indicati</h3> <!-- colore arancione -->	
					<%  }
					
						//calcolo indici di inizio e fine della griglia di visualizzazione
						int inizio=(pagina-1)*12;
						int fine=pagina*12;

						boolean ctrl=false;
						for(int i=inizio;i<fine;i=i+3) {
					%>
     					<div> <!-- necessario per far entrare tutto nel contenitore sopra quello del copyright-->
              				<div class="visualCapi">
              					<%
              						String tabella;
              						if (i<capi.size()) { 
              							if (capi.get(i).getClass()==BeanVestiario.class) 
              								tabella="vestiario";
              							else
              								tabella="accessorio";
              					%>
                				<div class="foto">
                					<a href="visualizzazioneCapo.jsp?pos=<%=i%>"><img width="103%" height="120%" src="GetPictureServlet?codCapo=<%=capi.get(i).getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1"></a>
                				</div>
                				<div class="description"><%=capi.get(i).getCosto()%>&euro;</div>
                				<% } else { %>
                				<div class="foto">
                					<img width="105%">
                				</div>
                				<div class="description"></div>
                				<% } %>
              				</div>
              				<div class="visualCapi">
              					<%
              						if (i+1<capi.size()) { 
              							if (capi.get(i+1).getClass()==BeanVestiario.class) 
              								tabella="vestiario";
              							else
              								tabella="accessorio";
              					%>
                				<div class="foto">
                					<a href="visualizzazioneCapo.jsp?pos=<%=i+1%>"><img width="101%" height="120%" src="GetPictureServlet?codCapo=<%=capi.get(i+1).getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1"></a>
                				</div>
                				<div class="description"><%=capi.get(i+1).getCosto()%>&euro;</div>
                				<% } else { %>
                				<div class="foto">
                					<img width="105%">
                				</div>
                				<div class="description"></div>
                				<% } %>
              				</div>
              				<div class="visualCapi">
              					<%
              						if (i+2<capi.size()) { 
              							if (capi.get(i+2).getClass()==BeanVestiario.class) 
              								tabella="vestiario";
              							else
              								tabella="accessorio";
              					%>
                				<div class="foto">
                					<a href="visualizzazioneCapo.jsp?pos=<%=i+2%>"><img width="107%" height="120%" src="GetPictureServlet?codCapo=<%=capi.get(i+2).getCodCapo()%>&tabella=<%=tabella%>&foto=linkFoto1"></a>
                				</div>
                				<div class="description"><%=capi.get(i+2).getCosto()%>&euro;</div>
                				<% } else { %>
                				<div class="foto">
                					<img width="105%">
                				</div>
                				<div class="description"></div>
                				<% } %>
              				</div>           				              				
            			</div>
            		<% 	
            				if (fine>=capi.size()) {
            					ctrl=true;
            				}
						}  
					%>
					</div>
					<!-- /griglia visualizzazione capi -->
					<br>
					<div style="float:right;">
					<%
						if (pagina>1) {
					%>
					<a href="visualizzazioneCapi.jsp?page=<%=pagina-1%>&filter=<%=filter%>"><img style="float:left;" src="images/left-arrow.ico"></a>
					<%
						}	
						if (ctrl!=true) {	
					%>
					<a href="visualizzazioneCapi.jsp?page=<%=pagina+1%>&filter=<%=filter%>"><img style="float:left;" src="images/right-arrow.ico"></a>
					<% } %>
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