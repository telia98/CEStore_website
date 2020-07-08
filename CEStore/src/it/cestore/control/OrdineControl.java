package it.cestore.control;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.BeanAccessorio;
import it.cestore.model.BeanBonifico;
import it.cestore.model.BeanCapo;
import it.cestore.model.BeanCartaDiCredito;
import it.cestore.model.BeanFattura;
import it.cestore.model.BeanOrdine;
import it.cestore.model.BeanUtente;
import it.cestore.model.BeanVestiario;
import it.cestore.model.CapoModelDM;
import it.cestore.model.PagamentoModelDM;
import it.cestore.model.UtenteModelDM;

/**
 * Servlet implementation class OrdineControl
 */
@WebServlet("/OrdineControl")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DateTimeFormatter FORMATO_DIA = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	private int nFattura=0;
	private int nTrack=0;
	private String expNome="^[a-z A-Z àéèìòù]{2,15}$";
	private String expCognome="^[a-z A-Z àéèìòù]{2,20}$";
	private String expCitta="^[a-z A-Z àéèìòù]{2,30}$";
	private String expProvincia="^[a-z A-Z àéèìòù]{2,20}$";
	private String expVia="^[a-z A-Z àéèìòù]{2,50}$";
	private String expNCivico="^[a-z A-Z 0-9]{2,4}$";
	private String expCap="^[0-9]{2,7}$";
	private String expNCarta="^([0-9]{4}( |\\\\-)){3}[0-9]{4}$";
	private String expCVV="^[0-9]{3,4}$";
	private String expDataScadenza="^(0[1-9]|1[0-2]|[1-9])\\/(1[4-9]|[2-9][0-9]|20[1-9][1-9])$";
	private String expIban="IT\\d{2}[ ][a-zA-Z]\\d{3}[ ]\\d{4}[ ]\\d{4}[ ]\\d{4}[ ]\\d{4}[ ]\\d{3}|IT\\d{2}[a-zA-Z]\\d{22}";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CapoModelDM model=new CapoModelDM();
		UtenteModelDM modelUtente=new UtenteModelDM();
		PagamentoModelDM modelPag=new PagamentoModelDM();
		BeanUtente account=(BeanUtente) request.getSession().getAttribute("utente");
		ArrayList<BeanCartaDiCredito> carte= (ArrayList<BeanCartaDiCredito>) request.getSession().getAttribute("carte");
		ArrayList<BeanBonifico> bonifici=(ArrayList<BeanBonifico>) request.getSession().getAttribute("bonifici");
		ArrayList<BeanCapo> capi=(ArrayList<BeanCapo>) request.getSession().getAttribute("capi");
		String action=request.getParameter("action");
		String redirect="";
		String message="";
		
		String nome="";
		String cognome="";
		String citta="";
		String provincia="";
		String via="";
		String nCivico="";
		String cap="";
		String nomeMittente="";
		String iban="";
		String nCarta="";
		String data="";
		String cvv="";
		
		if (action!=null) {
			if (action.equals("carrello")) {
				//devo recuperare solo il carrello
				
				//recupero il falso carrello
				ArrayList<BeanCapo> carrello = model.getCarrello("FFFFFF00F00F000F");
				
				//salvo il carrello nella sessione
				request.getSession().setAttribute("carrello",carrello);
				redirect="/ordine.jsp";
			} else if (action.equals("acquisto")) { 
				// INIZIO ACQUISTO
				//devo procedere all'acquisto
				
				if (account!=null) {
					//INIZIO ACQUISTO CON ACCOUNT
					
					String ditta=request.getParameter("ditta");
					float spesaTotale=Float.parseFloat(request.getParameter("spesaTotale"));
					String metodoPagamento=request.getParameter("method");
					
					//devo controllare se ho le carte e i bonifici
					if (carte.size()!=0 && bonifici.size()!=0) {
						//INIZIO ACQUISTO CON CARTE E BONIFICI DA SISTEMA
					
						boolean rs=true;
						//controllo se esiste gia' il carrello dell'utente
						int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
						if(codCarrello==-1) {
							//creo il carrello relativo all'utente se non esiste
							rs=model.createCarrello(account.getCodiceFiscale());
						}
					
						//se il carrello relativo all'utente esiste gia'
						if (rs) {
							//creo l'ordine
							BeanOrdine ordine=new BeanOrdine();
							ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
							ordine.setCodiceFiscale(account.getCodiceFiscale());
							LocalDate dataOggi=LocalDate.now();
							ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
							ordine.setDittaSpedizione(ditta);
							String n_tracking="TRACK_" + (++nTrack) ;
							ordine.setNumeroTracking(n_tracking);
							if (metodoPagamento.equals("cartaDiCredito")) {
								ordine.setPagamentoConCarta(carte.get(0).getIdPagamento());
							} else {
								ordine.setPagamentoConBonifico(bonifici.get(0).getIdPagamento());
							}
							System.out.println("ORDINE CREATO: " + ordine);
							modelPag.createOrdine(ordine);
						
							//creo la fattura perche' mi servirà poi dopo nell'area utente
							String n_fattura="f_00" + (++nFattura);
							modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
							
							//aggiungo la fattura alla lista della sessione
							BeanFattura fattura=modelPag.findFattura(n_fattura);
							ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
							fatture.add(fattura);
							request.getSession().setAttribute("fatture",fatture);
						} 
						
						//recupero il carrello e elimino i capi dal sistema
						ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
						for(int i=0;i<carrello.size();i++) {
							if (carrello.get(i).getClass()==BeanVestiario.class) {
								//elimino il capo di vestiario dal sistema
								model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
							} else {
								//elimino il capo accessorio dal sistema
								model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
							}
						}
						
						request.getSession().removeAttribute("carrello");
						redirect="/ordineConcluso.jsp";
						//FINE ACQUISTO CON CARTE E BONIFICI DA SISTEMA
					} else if (carte.size()!=0 && bonifici.size()==0) {
						//INIZIO ACQUISTO CON CARTE DA SISTEMA E BONIFICI ASSENTI
						
						if (metodoPagamento.equals("cartaDiCredito")) {
							//posso procedere direttamente all'acquisto
							
							boolean rs=true;
							//controllo se esiste gia' il carrello dell'utente
							int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
							if(codCarrello==-1) {
								//creo il carrello relativo all'utente se non esiste
								rs=model.createCarrello(account.getCodiceFiscale());	
							}
						
							//se il carrello relativo all'utente esiste gia'
							if (rs) {
								//creo l'ordine
								BeanOrdine ordine=new BeanOrdine();
								ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
								ordine.setCodiceFiscale(account.getCodiceFiscale());
								LocalDate dataOggi=LocalDate.now();
								ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
								ordine.setDittaSpedizione(ditta);
								String n_tracking="TRACK_" + (++nTrack) ;
								ordine.setNumeroTracking(n_tracking);
								ordine.setPagamentoConCarta(carte.get(0).getIdPagamento());
								
								System.out.println("ORDINE CREATO: " + ordine);
								modelPag.createOrdine(ordine);
							
								//creo la fattura perche' mi servirà poi dopo nell'area utente
								String n_fattura="f_00" + (++nFattura);
								modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
								
								//aggiungo la fattura alla lista della sessione
								BeanFattura fattura=modelPag.findFattura(n_fattura);
								ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
								fatture.add(fattura);
								request.getSession().setAttribute("fatture",fatture);
								
								//recupero il carrello e elimino i capi dal sistema
								ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
								for(int i=0;i<carrello.size();i++) {
									if (carrello.get(i).getClass()==BeanVestiario.class) {
										//elimino il capo di vestiario dal sistema
										model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
									} else {
										//elimino il capo accessorio dal sistema
										model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
									}
								}
							} 
							
							request.getSession().removeAttribute("carrello");
							redirect="/ordineConcluso.jsp";
						} else {
							//devo prelevare i dati del bonifico inseriti
							nomeMittente=request.getParameter("nome");
							iban=request.getParameter("iban");
							
							if (valida(nomeMittente,cognome,citta,provincia,via,nCivico,cap,nCarta,cvv,data,iban)) {
								//creo il bonifico relativo all'utente
								BeanBonifico bonifico=new BeanBonifico();
								bonifico.setCodiceFiscale(account.getCodiceFiscale());
								bonifico.setIban(iban);
								bonifico.setNomeMittente(nomeMittente);
								modelPag.insertBonifico(bonifico);
								
								boolean rs=true;
								//controllo se esiste gia' il carrello dell'utente
								int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
								if(codCarrello==-1) {
									//creo il carrello relativo all'utente se non esiste
									rs=model.createCarrello(account.getCodiceFiscale());
								}
							
								//recupero il bonifico inserito e creo l'ordine
								if(rs) {
									bonifici=modelUtente.getBonifici(account.getCodiceFiscale());
									request.getSession().setAttribute("bonifici",bonifici);
								
									//creo l'ordine
									BeanOrdine ordine=new BeanOrdine();
									ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
									ordine.setCodiceFiscale(account.getCodiceFiscale());
									LocalDate dataOggi=LocalDate.now();
									ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
									ordine.setDittaSpedizione(ditta);
									String n_tracking="TRACK_" + (++nTrack) ;
									ordine.setNumeroTracking(n_tracking);
									ordine.setPagamentoConBonifico(bonifici.get(0).getIdPagamento());
								
									System.out.println("ORDINE CREATO: " + ordine);
									modelPag.createOrdine(ordine);
							
									//creo la fattura perche' mi servirà poi dopo nell'area utente
									String n_fattura="f_00" + (++nFattura);
									modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
									
									//aggiungo la fattura alla lista della sessione
									BeanFattura fattura=modelPag.findFattura(n_fattura);
									ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
									fatture.add(fattura);
									request.getSession().setAttribute("fatture",fatture);
									
									request.getSession().removeAttribute("carrello");
									redirect="/ordineConcluso.jsp";
									
									//recupero il carrello e elimino i capi dal sistema
									ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
									for(int i=0;i<carrello.size();i++) {
										if (carrello.get(i).getClass()==BeanVestiario.class) {
											//elimino il capo di vestiario dal sistema
											model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
										} else {
											//elimino il capo accessorio dal sistema
											model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
										}
									}
								}
							} else {
								message="formato dati non valido: assicurarsi che tutti campi siano verdi";
								request.setAttribute("message",message);
								
								redirect="/ordine.jsp";
							}
						}
						//FINE ACQUISTO CON CARTE DA SISTEMA E BONIFICI ASSENTI
					} else if (carte.size()==0 && bonifici.size()!=0) {
						//INIZIO ACQUISTO CON CARTE ASSENTI E BONIFICI DA SISTEMA
						
						if (metodoPagamento.equals("bonifico")) {
							//posso procedere direttamente all'acquisto
							
							boolean rs=true;
							//controllo se esiste gia' il carrello dell'utente
							int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
							if(codCarrello==-1) {
								//creo il carrello relativo all'utente se non esiste
								rs=model.createCarrello(account.getCodiceFiscale());
							}
						
							//se il carrello relativo all'utente esiste gia'
							if (rs) {
								//creo l'ordine
								BeanOrdine ordine=new BeanOrdine();
								ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
								ordine.setCodiceFiscale(account.getCodiceFiscale());
								LocalDate dataOggi=LocalDate.now();
								ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
								ordine.setDittaSpedizione(ditta);
								String n_tracking="TRACK_" + (++nTrack) ;
								ordine.setNumeroTracking(n_tracking);
								ordine.setPagamentoConCarta(bonifici.get(0).getIdPagamento());
								
								System.out.println("ORDINE CREATO: " + ordine);
								modelPag.createOrdine(ordine);
							
								//creo la fattura perche' mi servirà poi dopo nell'area utente
								String n_fattura="f_00" + (++nFattura);
								modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
								
								//aggiungo la fattura alla lista della sessione
								BeanFattura fattura=modelPag.findFattura(n_fattura);
								ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
								fatture.add(fattura);
								request.getSession().setAttribute("fatture",fatture);
								
								request.getSession().removeAttribute("carrello");
								redirect="/ordineConcluso.jsp";
								
								//recupero il carrello e elimino i capi dal sistema
								ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
								for(int i=0;i<carrello.size();i++) {
									if (carrello.get(i).getClass()==BeanVestiario.class) {
										//elimino il capo di vestiario dal sistema
										model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
									} else {
										//elimino il capo accessorio dal sistema
										model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
									}
								}
							} 
						} else {
							//devo prelevare i dati della carta inseriti
							nCarta=request.getParameter("nCarta");
							data=request.getParameter("data");
							cvv=request.getParameter("cvv");
							
							if (valida(nome,cognome,citta,provincia,via,nCivico,cap,nCarta,cvv,data,iban)) {
								//creo la carta di credito relativa all'utente
								BeanCartaDiCredito carta=new BeanCartaDiCredito();
								carta.setCodiceFiscaleTitolare(account.getCodiceFiscale());
								carta.setNumeroCarta(nCarta);
								carta.setDataScadenza(data);
								carta.setCvv(cvv);
								modelPag.insertCartaDiCredito(carta);
							
								boolean rs=true;
								//controllo se esiste gia' il carrello dell'utente
								int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
								if(codCarrello==-1) {
									//creo il carrello relativo all'utente se non esiste
									rs=model.createCarrello(account.getCodiceFiscale());
								}
							
								//recupero la carta di credito inserita e creo l'ordine
								if(rs) {
									carte=modelUtente.getCarteDiCredito(account.getCodiceFiscale());
									request.getSession().setAttribute("carte",carte);
								
									//creo l'ordine
									BeanOrdine ordine=new BeanOrdine();
									ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
									ordine.setCodiceFiscale(account.getCodiceFiscale());
									LocalDate dataOggi=LocalDate.now();
									ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
									ordine.setDittaSpedizione(ditta);
									String n_tracking="TRACK_" + (++nTrack) ;
									ordine.setNumeroTracking(n_tracking);
									ordine.setPagamentoConCarta(carte.get(0).getIdPagamento());
								
									System.out.println("ORDINE CREATO: " + ordine);
									modelPag.createOrdine(ordine);
							
									//creo la fattura perche' mi servirà poi dopo nell'area utente
									String n_fattura="f_00" + (++nFattura);
									modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
									
									//aggiungo la fattura alla lista della sessione
									BeanFattura fattura=modelPag.findFattura(n_fattura);
									ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
									fatture.add(fattura);
									request.getSession().setAttribute("fatture",fatture);
									
									//recupero il carrello e elimino i capi dal sistema
									ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
									for(int i=0;i<carrello.size();i++) {
										if (carrello.get(i).getClass()==BeanVestiario.class) {
											//elimino il capo di vestiario dal sistema
											model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
										} else {
											//elimino il capo accessorio dal sistema
											model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
										}
									}
									
									request.getSession().removeAttribute("carrello");
									redirect="/ordineConcluso.jsp";
								}
							} else {
								message="formato dati non valido: assicurarsi che tutti i campi siano verdi";
								request.setAttribute("message",message);
								
								redirect="/ordine.jsp";
							}
						}
						//FINE ACQUISTO CON CARTE ASSENTI E BONIFICI DA SISTEMA
					} else if (carte.size()==0 && bonifici.size()==0) {
						//INIZIO ACQUISTO CON CARTE E BONIFICI ASSENTI
						
						//sono loggato ma non ho soldi né per le carte né per il bonifico
						
						if (metodoPagamento.equals("bonifico")) {
							//devo prendermi i dati del bonifico inseriti
							nomeMittente=request.getParameter("nome");
							iban=request.getParameter("iban");
							
							if (valida(nomeMittente,cognome,citta,provincia,via,nCivico,cap,nCarta,cvv,data,iban)) {
								//creo il bonifico relativo all'utente
								BeanBonifico bonifico=new BeanBonifico();
								bonifico.setCodiceFiscale(account.getCodiceFiscale());
								bonifico.setIban(iban);
								bonifico.setNomeMittente(nomeMittente);
								modelPag.insertBonifico(bonifico);
								
								boolean rs=true;
								//controllo se esiste gia' il carrello dell'utente
								int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
								if(codCarrello==-1) {
									//creo il carrello relativo all'utente se non esiste
									rs=model.createCarrello(account.getCodiceFiscale());
								}
							
								//recupero il bonifico inserito e creo l'ordine
								if(rs) {
									bonifici=modelUtente.getBonifici(account.getCodiceFiscale());
									request.getSession().setAttribute("bonifici",bonifici);
								
									//creo l'ordine
									BeanOrdine ordine=new BeanOrdine();
									ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
									ordine.setCodiceFiscale(account.getCodiceFiscale());
									LocalDate dataOggi=LocalDate.now();
									ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
									ordine.setDittaSpedizione(ditta);
									String n_tracking="TRACK_" + (++nTrack) ;
									ordine.setNumeroTracking(n_tracking);
									ordine.setPagamentoConBonifico(bonifici.get(0).getIdPagamento());
								
									System.out.println("ORDINE CREATO: " + ordine);
									modelPag.createOrdine(ordine);
							
									//creo la fattura perche' mi servirà poi dopo nell'area utente
									String n_fattura="f_00" + (++nFattura);
									modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
									
									//aggiungo la fattura alla lista della sessione
									BeanFattura fattura=modelPag.findFattura(n_fattura);
									ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
									fatture.add(fattura);
									request.getSession().setAttribute("fatture",fatture);
									
									//recupero il carrello e elimino i capi dal sistema
									ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
									for(int i=0;i<carrello.size();i++) {
										if (carrello.get(i).getClass()==BeanVestiario.class) {
											//elimino il capo di vestiario dal sistema
											model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
										} else {
											//elimino il capo accessorio dal sistema
											model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
										}
									}
									
									request.getSession().removeAttribute("carrello");
									redirect="/ordineConcluso.jsp";
								}
							} else {
								message="formato dati non valido: assicurarsi che tutti i campi siano verdi";
								request.setAttribute("message",message);
								
								redirect="/ordine.jsp";
							}
						} else {
							//devo prendermi i dati della carta di credito inseriti
							nCarta=request.getParameter("nCarta");
							data=request.getParameter("data");
							cvv=request.getParameter("cvv");
							
							if (valida(nome,cognome,citta,provincia,via,nCivico,cap,nCarta,cvv,data,iban)) {
								//creo la carta di credito relativa all'utente
								BeanCartaDiCredito carta=new BeanCartaDiCredito();
								carta.setCodiceFiscaleTitolare(account.getCodiceFiscale());
								carta.setNumeroCarta(nCarta);
								carta.setDataScadenza(data);
								carta.setCvv(cvv);
								modelPag.insertCartaDiCredito(carta);
							
								boolean rs=true;
								//controllo se esiste gia' il carrello dell'utente
								int codCarrello=model.getCodCarrello(account.getCodiceFiscale());
								if(codCarrello==-1) {
									//creo il carrello relativo all'utente se non esiste
									rs=model.createCarrello(account.getCodiceFiscale());
								}
							
								//recupero la carta di credito inserita e creo l'ordine
								if(rs) {
									carte=modelUtente.getCarteDiCredito(account.getCodiceFiscale());
									request.getSession().setAttribute("carte",carte);
									
									//creo l'ordine
									BeanOrdine ordine=new BeanOrdine();
									ordine.setCodiceCarrello(model.getCodCarrello(account.getCodiceFiscale()));
									ordine.setCodiceFiscale(account.getCodiceFiscale());
									LocalDate dataOggi=LocalDate.now();
									ordine.setDataOrdine(dataOggi.format(FORMATO_DIA));
									ordine.setDittaSpedizione(ditta);
									String n_tracking="TRACK_" + (++nTrack) ;
									ordine.setNumeroTracking(n_tracking);
									ordine.setPagamentoConCarta(carte.get(0).getIdPagamento());
								
									System.out.println("ORDINE CREATO: " + ordine);
									modelPag.createOrdine(ordine);
							
									//creo la fattura perche' mi servirà poi dopo nell'area utente
									String n_fattura="f_00" + (++nFattura);
									modelPag.createFattura(modelPag.findOrdine(n_tracking),(int)spesaTotale, n_fattura);
								
									//aggiungo la fattura alla lista della sessione
									BeanFattura fattura=modelPag.findFattura(n_fattura);
									ArrayList<BeanFattura> fatture=(ArrayList<BeanFattura>) request.getSession().getAttribute("fatture");
									fatture.add(fattura);
									request.getSession().setAttribute("fatture",fatture);
									
									//recupero il carrello e elimino i capi dal sistema
									ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
									for(int i=0;i<carrello.size();i++) {
										if (carrello.get(i).getClass()==BeanVestiario.class) {
											//elimino il capo di vestiario dal sistema
											model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
										} else {
											//elimino il capo accessorio dal sistema
											model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
										}
									}
									
									request.getSession().removeAttribute("carrello");
									redirect="/ordineConcluso.jsp";
								}
							} else {
								message="formato dati non valido: assicurarsi che tutti i campi siano verdi";
								request.setAttribute("message",message);
								
								redirect="/ordine.jsp";
							}
						}
						//FINE ACQUISTO CON CARTE E BONIFICI ASSENTI
					}
					//FINE ACQUISTO CON ACCOUNT
				} else {
					//INIZIO ACQUISTO SENZA ACCOUNT
					
					//devo recuperare tutti i dati dal form, sia per l'utente che per il pagamento
					nome=request.getParameter("nome");
					cognome=request.getParameter("cognome");
					citta=request.getParameter("citta");
					provincia=request.getParameter("provincia");
					via=request.getParameter("via");
					nCivico=request.getParameter("numeroCivico");
					cap=request.getParameter("CAP");
					nomeMittente="";
					iban="";
					nCarta="";
					data="";
					cvv="";
					String metodoPagamento=request.getParameter("method");
				
					if (metodoPagamento.equals("bonifico")) {
						//devo prelevare i dati del bonifico inseriti
						nomeMittente=request.getParameter("nome");
						iban=request.getParameter("iban");
					} else {
						//devo prelevare i dati della carta inseriti
						nCarta=request.getParameter("nCarta");
						data=request.getParameter("data");
						cvv=request.getParameter("cvv");
					}
					
					if (valida(nome,cognome,citta,provincia,via,nCivico,cap,nCarta,cvv,data,iban)) {
						ArrayList<BeanCapo> carrello = (ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
					
						//provvedo semplicemente ad eliminare i capi perche' l'utente che sta acquistando è un utente che non si è iscritto vuole acquistare e basta
						for(int i=0;i<carrello.size();i++) {
							if (carrello.get(i).getClass()==BeanVestiario.class) {
								//elimino il capo di vestiario dal sistema
								model.deleteCapoVestiario((BeanVestiario) carrello.get(i));
							} else {
								//elimino il capo accessorio dal sistema
								model.deleteCapoAccessorio((BeanAccessorio) carrello.get(i));
							}
						}
						
						request.getSession().removeAttribute("carrello");
						redirect="/ordineConcluso.jsp";
					} else {
						message="formato dati non valido: assicurarsi che tutti i campi siano verdi";
						request.setAttribute("message",message);
						
						redirect="/ordine.jsp";
					}
					//FINE ACQUISTO SENZA ACCOUNT
				}
				// FINE ACQUISTO
			}
		}
		
		//restituisco tutto alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher(redirect);
		dispatcher.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public boolean valida(String nome,String cognome,String citta,String provincia,String via,String civico,String cap,String carta,String cvv,String data,String iban) {
		boolean valido=true;
		
		//se dei valori non sono da validare li setto a stringa vuota
		
		if (!nome.equals("")) {
			if (!Pattern.matches(expNome, nome))
				valido=false;
		}
		
		if (!cognome.equals("")) {
			if (!Pattern.matches(expCognome, cognome)) 
				valido=false;
		}
		
		if (!citta.equals("")) {
			if (!Pattern.matches(expCitta, citta))
				valido=false;
		}
		
		if (!provincia.equals("")) {
			if (!Pattern.matches(expProvincia, provincia))
				valido=false;
		}
		
		if (!via.equals("")) {
			if (!Pattern.matches(expVia, via)) 
				valido=false;
		}
		
		if (!civico.equals("")) {
			if (!Pattern.matches(expNCivico, civico)) 
				valido=false;
		}
		
		if (!cap.equals("")) {
			if (!Pattern.matches(expCap, cap))
				valido=false;
		}
		
		if (!carta.equals("")) {
			if (!Pattern.matches(expNCarta, carta))
				valido=false;
		}
		
		if (!cvv.equals("")) {
			if (!Pattern.matches(expCVV, cvv))
				valido=false;
		}
		
		if (!data.equals("")) {
			if (!Pattern.matches(expDataScadenza, data))
				valido=false;
		}
		
		if (!iban.equals("")) {
			if (!Pattern.matches(expIban, iban))
				valido=false;
		}
		
		return valido;
	}
}