USE e_commerce_abbigliamento;

INSERT INTO sitoWeb VALUES ("000.11.222.3", "https://www.CEStore.com"); 

INSERT INTO deposito VALUES ("Deposito e-commerce CEStore", "Via Corso Europa, 30");

INSERT INTO ditta VALUES ('DHL', "Via Roma, 10");
INSERT INTO ditta VALUES ('BRT', "Via Francesco Tedesco, 30");
INSERT INTO ditta VALUES ('SDA', "Via Parco Puccini, 52");
INSERT INTO ditta VALUES ('GLS', "Via Cuoco, 27");

INSERT INTO categoria VALUES ('01', "donna");
INSERT INTO categoria VALUES ('02', "uomo");
INSERT INTO categoria VALUES ('03', "unisex");

INSERT INTO anagrafica_cliente VALUES ("CRLMRY97R42A508K", "Mary", "Cerullo",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("LEITRS98U59B273L", "Teresa", "Elia",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("CFTGSY98L47F837A", "Giusy", "Castaldo",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("CPRNMO40P60L562S", "Noemi", "Cipriano",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("RSSSDR95A01F839Z", "Sandro", "Rossi",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("NNAGLM80A01F839U", "Anna", "Girolamo",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("VRDNNA80A41C352G", "Anna", "Verdi",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("FCCRSR90L42B963F", "Rosaria", "Fiocca",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("LRLBCC80A01F839X", "Lorella", "Boccia",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("CRLNDR80A01F839B", "Andrea", "Cerioli",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("VNCGNN63S11F839Q", "Giovanni", "Vincenzi",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("LCUNRM80A01F839T", "Luca", "Annarumma",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("VNCTSC80A01F839Z", "Vincenzo", "Tedesco",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("DFSSVT89L07A509Y", "Salvatore", "De Fusco",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("BNCPQL80A01F205P", "Pasquale", "Bianco",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("LCUGLL80A01F839H", "Lucia", "Gigliello",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("SNWJHN89E06F205F", "John", "Snow",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("FLVDCC80A01F839I", "Flavia", "De Cicco",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("RBRPCL80A01F839M", "Roberta", "Pascoli",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("MDDDLL80A01F839K", "Maddalena", "De Lellis",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("RCCPPL80A01F839I", "Rocco", "Papaleo",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("LCNBLZ80A01F839U", "Luciano", "Bellizzi",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("DFRCCC73E07G743F", "Ciccio", "De Franco",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("RTNCST93R54D969V", "Cristina", "Rotondi",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("DPLSLV80A41F205M", "Silvia", "Di Paola",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("SPHNRT80A01F839W", "Sophia", "Andreotti",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("GGLPLA93T21H361A", "Paolo", "Guglia",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("NNNMRC80A01F839N", "Marco", "Iannone",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("MRADLC80A01F839J", "Maria", "De Lucia",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("FLVGRR80A01F839D", "Fulvia", "Guerriero",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO anagrafica_cliente VALUES ("CRSDNT80A01F839O", "Cristiano", "De Santis",(SELECT indirizzo_IP FROM sitoWeb));

INSERT INTO cartaDiCredito(numero_carta,data_scadenza,CVV,cf_cliente) VALUES ("1111 1111 1111 1111","05/21","123","CRLMRY97R42A508K");
INSERT INTO bonifico(IBAN,nome_mittente,cf_cliente) VALUES ("IT60X0542811101000000123456","Mary Cerullo","CRLMRY97R42A508K");

INSERT INTO indirizzo_cliente VALUES ("Via Rossa", "AV", "83100", "20", "Avellino","CRLMRY97R42A508K");
INSERT INTO indirizzo_cliente VALUES ("Via Rocca de Baldi", "VV", "89817", "95", "Briatico","LEITRS98U59B273L");
INSERT INTO indirizzo_cliente VALUES ("Via Roma", "AT", "14014", "15", "Montafia","CFTGSY98L47F837A");
INSERT INTO indirizzo_cliente VALUES ("Via Paolo Gaidano","UD","33019", "4","Leonacco","CPRNMO40P60L562S");
INSERT INTO indirizzo_cliente VALUES ("Viale Ippocrate", "CO", "22010", "10", "Sant Abbondio","RSSSDR95A01F839Z");
INSERT INTO indirizzo_cliente VALUES ("Via Volto San Luca", "TO", "10080", "55","Meugliano","NNAGLM80A01F839U");
INSERT INTO indirizzo_cliente VALUES ("Via Melisurgo","LU","55036","109","Pieve Fosciana","VRDNNA80A41C352G");
INSERT INTO indirizzo_cliente VALUES ("Via Nuova Agnano", "FG", "71020", "66", "Borgo Cervaro","FCCRSR90L42B963F");
INSERT INTO indirizzo_cliente VALUES ("Via San Cosmo fuori Porta Nolana","MI","20060", "69","Pozzuolo Martesana", "LRLBCC80A01F839X");
INSERT INTO indirizzo_cliente VALUES ("Via Matteo Schilizzi", "GE", "16155", "34", "Pegli","CRLNDR80A01F839B");
INSERT INTO indirizzo_cliente VALUES ("Via Sergente Maggiore", "PI", "56020" ,"125","La Serra","VNCGNN63S11F839Q");
INSERT INTO indirizzo_cliente VALUES ("Via Santa Lucia","PG","06030","127","Colfiorito","LCUNRM80A01F839T");
INSERT INTO indirizzo_cliente VALUES ("Via Varrone", "CE", "81100", "104", "Vaccheria","VNCTSC80A01F839Z");
INSERT INTO indirizzo_cliente VALUES ("Via Moiariello", "CN", "12030" ,"16","San Lazzaro Saluzzo","DFSSVT89L07A509Y");
INSERT INTO indirizzo_cliente VALUES ("Via Giulio Petroni", "BG", "24050", "57", "Lurano", "BNCPQL80A01F205P");
INSERT INTO indirizzo_cliente VALUES ("Viale Ippocrate","CO","22030","58","Proserpio","LCUGLL80A01F839H");
INSERT INTO indirizzo_cliente VALUES ("Via del Caggio", "AR", "52041" ,"94","Pieve Al Toppo", "SNWJHN89E06F205F");
INSERT INTO indirizzo_cliente VALUES ("Via Rocca de Baldi","VV","89833","44","Dinami", "FLVDCC80A01F839I");
INSERT INTO indirizzo_cliente VALUES ("Via Giotto","VR","37010","106","Palazzolo", "RBRPCL80A01F839M");
INSERT INTO indirizzo_cliente VALUES ("Via Longhena","RM","00188","144","Prima Porta","MDDDLL80A01F839K");
INSERT INTO indirizzo_cliente VALUES ("Via delle Coste", "RE", "42030" ,"13","Sologno","RCCPPL80A01F839I");
INSERT INTO indirizzo_cliente VALUES ("Via degli Aldobrandeschi", "CL", "93010" ,"121","Villalba","LCNBLZ80A01F839U");
INSERT INTO indirizzo_cliente VALUES ("Via Galvani","RO","45010","28","Ceregnano","DFRCCC73E07G743F");
INSERT INTO indirizzo_cliente VALUES ("Via Bologna","LU","55040","81", "Azzano", "RTNCST93R54D969V");
INSERT INTO indirizzo_cliente VALUES ("Piazza Guglielmo Pepi", "MC", "62027", "83", "San Severino Marche","DPLSLV80A41F205M");
INSERT INTO indirizzo_cliente VALUES ("Via Foria", "FO", "47010","103","Bocconi","SPHNRT80A01F839W");
INSERT INTO indirizzo_cliente VALUES ("Via Paolo Gaidano","UD","33020","132","Ravascletto","NNNMRC80A01F839N");
INSERT INTO indirizzo_cliente VALUES ("Via Medina","GO","34070","15","Polazzo","MRADLC80A01F839J");
INSERT INTO indirizzo_cliente VALUES ("Piazza della Repubblica","CZ","88044","9","Marcellinara","FLVGRR80A01F839D");
INSERT INTO indirizzo_cliente VALUES ("Via Nazionale","BZ","39059","72","Soprabolzano","CRSDNT80A01F839O");
INSERT INTO indirizzo_cliente VALUES ("Via Paolo Gaidano,","UD","33056","94","Palazzolo Dello Stella","GGLPLA93T21H361A");

INSERT INTO utente VALUES ("randomuser1","randomuser1", "govugezyv-1358@yopmail.com","CRLMRY97R42A508K",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser2","randomuser2", "opead1936@armyspy.com","LEITRS98U59B273L",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser3","randomuser3", "opead1936@cuvox.de","CFTGSY98L47F837A",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser4","randomuser4", "opead1936@dayrep.com","CPRNMO40P60L562S",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser5","randomuser5","opead1936@einrot.com","RSSSDR95A01F839Z",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser6","randomuser6", "guerrinomonaldo@teleworm.us","NNAGLM80A01F839U",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser7","randomuser7", "agamennoneferrari@armyspy.com","VRDNNA80A41C352G",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser8","randomuser8", "alviserossi@dayrep.com","FCCRSR90L42B963F",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser9","randomuser9", "enniococci@jourrapide.com","LRLBCC80A01F839X",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO utente VALUES ("randomuser10","randomuser10", "adelaideromani@armyspy.com","CRLNDR80A01F839B",(SELECT indirizzo_IP FROM sitoWeb)); 

/*cappelli uomo*/
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Polo Ralph Lauren,fantasia monocromo,info cappellino con visiera con logo in rilievo",34.99,"cappelli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Hikari,fantasia bicolore,info cappello bicolore con logo in rilievo",18.84,"cappelli",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca New Era,fantasia melange,info cappellino con visiera e dettagli in rilievo",27.72,"cappelli",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Carhartt WIP,fantasia melange,info berretto in maglia con targhetta logo",15.19,"cappelli",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca BOSS,fantasia righe,info cappello linea tropical in paglia e altre fibre",64.99,"cappelli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca New Era,fantasia militare,info cappellino con visiera e logo in rilievo",22.39,"cappelli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Nike Sportswear,fantasia monocromo,info berretto in maglia con etichetta logo",11.25,"cappelli",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Tommy Hilfiger,fantasia monocromo,info cappellino con visiera e logo frontale in rilievo",23.90,"cappelli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Kangol,fantasia monocromo,info cappello modello panama in viscosa con logo in rilievo",41.90,"cappelli",'02',(SELECT nome_dep FROM deposito));

/*sciarpe uomo*/
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca BOSS,fantasia monocromo,info sciarpa in cotone con frange corte",30.00,"sciarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Jack & Jones,fantasia monocromo,info scaldacollo in acrilica con effetto maglia",24.99,"sciarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Guess,fantasia monocromo,info sciarpa con lavoro a maglia e logo in rilievo",49.24,"sciarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca J.Lindeberg,fantasia melange,info sciarpa in lana con frange lunghe e targhetta logo",83.99,"sciarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Emporio Armani,fantasia monocromo,info sciarpa con logo ricamato sul tessuto",90.99,"sciarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Versace,fantasia stampa,info foulard in seta con decorazioni",109.50,"sciarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Pier One,fantasia monocromo,info sciarpa in lana con frange lunghe",12.99,"sciarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Jack & Jones,fantasia melange,info sciarpa in acrilica con targhetta logo ",17.99,"sciarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Tommy Hilfiger,fantasia stampa,info sciarpa in cotone con stampa logo e decorazioni",54.30,"sciarpe",'02',(SELECT nome_dep FROM deposito));

/*borsa uomo*/
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Superdry,fantasia stampa,info trousse da viaggio in nylon con chiusura con cerniera",17.99,"borsa",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca YourTurn,fantasia monocromo,info ventiquattrore in poliestere con chiusura a cerniera",8.10,"borsa",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Adidas,fantasia stampa,info portacellulare per iphone 8/8s trasparente con logo a colori",19.99,"borsa",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Nike Sportswear,fantasia stampa,info zaino a sacchetto in poliestere con cinte di chiusura",17.99,"borsa",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Guess,fantasia stampa,info ventiquattrore in finta pelle con chiusura a cerniera",70.00,"borsa",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Nike Sportswear,fantasia stampa,info zaino in poliestere con chiusura a cerniera",25.99,"borsa",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Hackett London,fantasia monocromo,info borsa da viaggio in tessuto impermeabile",159.99,"borsa",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Herschel,fantasia monocromo,info zaino con chiusura a cerniera scomparto per portatile",87.87,"borsa",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Delsey,fantasia monocromo,info trousse da viaggio con chiusura magnetica",59.00,"borsa",'03',(SELECT nome_dep FROM deposito));

/*gioielli uomo*/
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Icon Brand,fantasia monocromo,info bracciale con fascia elastica e decorazioni in plastica",12.99,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Diesel,fantasia monocromo,info collana in acciaio con doppia etichetta incisa",69.99,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Fossil,fantasia monocromo,info bracciale con chiusura in pelle e targha in acciaio",44.99,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Diesel,fantasia monocromo,info bracciale con chiusura a fermaglio in acciaio inossidabile",94.90,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Guess,fantasia stampa,info orologio con chiusura con fibbia cassa in acciaio",103.99,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Icon Brand,fantasia monocromo,info bracciale con fascia elastica e decorazioni in acrilico",12.99,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Classics77,fantasia monocromo,info collana con targhetta incisa in ferro e finish mat",14.94,"gioielli",'03',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Emporio Armani,fantasia monocromo,info bracciale in pelle con decorazioni in acciaio",71.30,"gioielli",'02',(SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES 
("marca Versus Versace,fantasia monocromo,info orologio con cassa in acciaio e chiusura in pelle",244.99,"gioielli",'02',(SELECT nome_dep FROM deposito));

/*borse donna*/
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca New Look, fantasia melange, info  borsa in tessuto misto fintapelle con catena ", 17.59, "borsa", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca EVEN&ODD, fantasia monocromo, info borsa in fintapelle con chiusura a sacca", 18.74, "borsa", '01' , (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Herschel, fantasia melange, info zainetto in poliestere con chisura magnetica e scomparto PC", 53.99, "borsa", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Polo Ralph Lauren, fantasia monocromo, info borsa in fintapelle con chiusura a cerniera",  89.99, "borsa",'01' , (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca EVEN&ODD, fantasia monocromo, info zainetto in poliuterano con cerniera", 16, "borsa", '01', (SELECT nome_dep FROM deposito)); 
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca STEVE MADDEN, fantasia melange, info borsa in fintapelle con catena", 59.99, "borsa", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Levi's,fantasia stampa, info borsa in tela", 18.99, "borsa", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Calvin Klein, fantasia monocromo, info borsa in fintapelle con chiusura con cerniera", 67.99, "borsa", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Pepe Jeans, fantasia monocromo, info borsa in fintapelle con chiusura magnetica", 84.99, "borsa", '01', (SELECT nome_dep FROM deposito));

/*gioielli donna*/ 
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Kerbholz, fantasia monocromo, info orologio in pelle con chiusura con fibbia", 169.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca KIOMI, fantasia stampa, info orologio in pelle con chiusura con fibbia", 19.99, "gioielli", '03', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Kerbholz, fantasia monocromo, info orologio in pelle con cassa in acciaio", 129.99, "gioielli", '03', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Olivia Burton, fantasia monocromo, info orologio in pelle con chiusura con fibbia", 158, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Komono, fantasia marmo, info orologio in pelle con chiusura con fibbia", 89.99, "gioielli", '03', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Olivia Burton, fantasia floreale, info orologio in pelle con quadrante in acciaio", 99.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Skagen, fantasia monocromo, info orologio in pelle con quadrante in acciaio", 149.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca REBECCA MINKOFF, fantasia monocromo, info orologio impermeabile in acciaio inossidabile", 103.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca ERASE, fantasia monocromo, info anello ferro e finish lucidato", 14.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca ERASE, fantasia monocromo, info anello in ferro e finish lucidato", 7.50, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca PIECES, fantasia monocromo, info anello in plastica e zinco,con perla e finish lucido", 11.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Konplott, fantasia monocromo, info anello in ferro con gemma e finish mat", 19.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Fossil, fantasia monocromo, info anello in acciaio con cristallo e finish lucido", 42.99, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Elli, fantasia monocromo, info anello in argento sterling", 29.90, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Elli, fantasia monocromo, info anello in argento sterling", 44.90, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca THOMAS SABO, fantasia monocromo, info anello in argento sterling con zircone", 279, "gioielli", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca THOMAS SABO, fantasia monocromo, info anello in argento sterling placcato oro", 119, "gioielli", '01', (SELECT nome_dep FROM deposito));

/*sciarpe donna*/
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca KIOMI, fantasia monocromo, info sciarpa 85% acrilica, 15% lana con frange", 19.99, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca VERO MODA, fantasia melange, info sciarpa 100% poliestere con frange", 16.99, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Only, fantasia monocromo, info sciarpa 100% acrilica con frange", 18.99, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca MASSIMO DUTTI, fantasia stampa, info sciarpa 61% modal, 36% lino", 49.96, "sciarpe", '03', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca EVEN&ODD, fantasia melange, info sciarpa 100% poliestere con frange", 12.74, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca PIECES, fantasia monocromo, info sciarpa 95% acrilica, 5% lana", 15.39, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca Polo Ralph Lauren, fantasia monocromo, info sciarpa 50% lyocell, 32% lana", 89.99, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca HOLZWEILER, fantasia melange, info sciarpa 90% lana, 10% cashmere con frange", 45.99, "sciarpe", '01', (SELECT nome_dep FROM deposito));
INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES
("marca DRYKORN, fantasia melange, info sciarpa 50% acrilica, 30% lana", 53.99, "sciarpe", '03',  (SELECT nome_dep FROM deposito));

/*maglie donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosso","cotone","info t-shirt, marca Carhartt WIP, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.20,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"bianco","cotone","info t-shirt, marca Carhartt WIP, collezione (2018/2019), vestibilità normale, fantasia rigato, stagione primavera/estate",20.20,"maglia",'03',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","cotone","info t-shirt, marca Abercrombie, collezione (2018/2019), vestibilità normale, fantasia pois, stagione primavera/estate",10.30,"maglia",'03',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"azzurro","cotone","info t-shirt, marca Abercrombie, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",15.99,"maglia",'03',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"rosso","cotone","info t-shirt, marca Abercrombie, collezione (2018/2019), vestibilità normale, fantasia rigato, stagione primavera/estate",15.99,"maglia",'03',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","cotone","info t-shirt, marca Tommy Hilfiger, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",40.99,"maglia",'01',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","cotone","info t-shirt, marca Levi's, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20.50,"maglia",'01',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info t-shirt, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.30,"maglia",'01',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone","info t-shirt, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",50.99,"maglia",'01',(SELECT nome_dep FROM deposito));

/*top donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"marrone","seta","info top, marca Zara, collezione (201782019), vestibilità aderente, fantasia maculato, stagione primavera/estate",7.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","seta","info top, marca Zara, collezione (2018/2019), vestibilità aderente, fantasia a stampa, stagione primavera/estate",8.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"arancione","seta","info top, marca Zara, collezione (2018/2019), vestibilità aderente, fantasia a stampa, stagione primavera/estate",5.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"ocra","viscosa","info top, marca Monkl, collezione (2018/2019), vestibilità normale, fantasia a stampa, stagione primavera/estate",4.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"multicolore","cotone","info top, marca Nike, collezione (2018/2019), vestibilità aderente, fantasia quadrettato, stagione primavera/estate",7.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"marrone","viscosa","info top, marca Zara, collezione (2018/2019), vestibilità aderente, fantasia maculato, stagione primavera/estate",7.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","viscosa","info top, marca EVEN&ODD, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",8.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosso","viscosa","info top, marca EVEN&ODD, collezione (2018/2019), vestibilità aderente, fantasia monocromo, stagione primavera/estate",5.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosa","viscosa","info top, marca Zara, collezione (2018/2019), vestibilità aderente, fantasia monocromo, stagione primavera/estate",10.50,"maglia",'01',(SELECT nome_dep FROM deposito));

/*camicia donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"rosa","poliestere","info camicia, marca Missguided, collezione (2018/2019), vestibilità normale, fantasia floreale, stagione primavera/estate",16.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","poliestere","info camicia, marca Missguided, collezione (2018/2019), vestibilità normale, fantasia floreale, stagione primavera/estate",29.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","poliestere","info camicia, marca EVEN&ODD, collezione (2018/2019), vestibilità normale, fantasia floreale, stagione primavera/estate",19.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"rosa","poliestere","info camicia, marca Glamours, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",15.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"blu","satin","info camicia, marca Missguided, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",8.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"rosso","satin","info camicia, marca Mango, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",8.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"bianco","poliestere","info camicia, marca Mango, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.50,"maglia",'01',(SELECT nome_dep FROM deposito));

/*felpa donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bianco","cotone","info felpa, marca The North Face, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",30.50,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info felpa, marca The North Face, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",30.50,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"grigio","cotone","info felpa, marca The North Face, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autuno/inverno",50.80,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"rosa","cotone poliestere","info felpa, marca Original, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",19.99,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"bianco","cotone","info felpa, marca Original, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",60.50,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"rosa","cotone","info felpa, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/invernoe",20.80,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","cotone","info felpa, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia a righe, stagione autunno/inverno",20.99,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","cotone","info felpa, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",30.50,"maglia",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","cotone","info felpa, marca Fila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",30.50,"maglia",'03',(SELECT nome_dep FROM deposito));

/*t-shirt uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","jersey","info t-shirt, marca Levi's, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",25,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"verde","jersey","info t-shirt, marca Calvin Klein, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",60,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","jersey","info t-shirt, marca Alpha Industries, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",50,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bordeaux","jersey","info t-shirt, marca The North Face, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",40,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","jersey","info t-shirt, marca Napapijri, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",50,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"azzurrino","jersey","info t-shirt, marca Nike, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",45,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bianco","jersey","info t-shirt, marca Kappa, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",30,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosso","jersey","info t-shirt, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",35,"maglia",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","piquè","info t-shirt, marca Lacoste, collezione (2018/2019), vestibilità piccola, fantasia melange, stagione primavera/estate",100,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"verde","piquè","info t-shirt, marca Lacoste, collezione (2018/2019), vestibilità piccola, fantasia melange, stagione primavera/estate",100,"maglia",'02',(SELECT nome_dep FROM deposito));

/*felpa e pullover uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES
('XL',"nero","sintetico","info felpa, marca Nike, collezione (2018/2019), vestibilità piccola, fantasia monocromo, stagione autunno/inverno",60,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"beige","maglina","info pullover, marca Armor Lux, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",160,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"marrone","cotone","info felpa, marca Carhartt WIP, collezione (2018/2019), vestibilità normale, fantasia melange, stagione autunno/inverno",90,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","sintetico","info felpa, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",65,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"multicolore","sintetico","info felpa, marca Fila Sportwear, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione autunno/inverno",80,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone","info felpa, marca Kappa, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",60,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"rosso","cotone","info felpa, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione autunno/inverno",70,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"verde","cotone","info pullover, marca Knowledge Cotton Apparel, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",80,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bianco","maglina","info pullover, marca Calvin Klein, collezione (2018/2019), vestibilità piccola, fantasia melange, stagione autunno/inverno",110,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"multicolore","maglina","info pullover, marca Q/S Designed By, collezione (2018/2019), vestibilità piccola, fantasia melange, stagione autunno/inverno",50,"maglia",'02',(SELECT nome_dep FROM deposito));

/*camicia uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"multicolore","cotone","info camicia, marca Sisley, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",49.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"multicolore","cotone","info camicia, marca Benetton, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",29.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","cotone","info camicia, marca Tom Tailor Denim, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",29.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"verde","lino","info camicia, marca Pull&Bear, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"bianco","lino","info camicia, marca Pull&Bear, collezione (2018/2019), vestibilità normale, fantasia righe, stagione primavera/estate",20,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"celeste","cotone","info camicia, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",24.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"multicolore","cotone","info camicia, marca Polo Ralph Lauren, collezione (2018/2019), vestibilità normale, fantasia a scacchi, stagione primavera/estate",99.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","cotone","info camicia, marca Hugo, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",69.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info camicia, marca Tommy Jeans, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",70,"maglia",'02',(SELECT nome_dep FROM deposito));

/*canotta uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"bianco","jersey","info canotta, marca Alpha Industries, collezione (2018-2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",19.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","jersey","info canotta, marca Nike, collezione (2018-2019), vestibilità normale, fantasia stampa, stagione primavera/estate",24.99,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","rete","info canotta, marca Jordan, collezione (2018-2019), vestibilità ampia, fantasia stampa, stagione primavera/estate",55,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","rete","info canotta, marca Nike, collezione (2018-2019), vestibilità normale, fantasia stampa, stagione primavera/estate",35,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","jersey","info canotta, marca Adidas, collezione (2018-2019), vestibilità normale, fantasia stampa, stagione primavera/estate",19.95,"maglia",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"multicolore","jersey","info canotta, marca YourTurn, collezione (2018-2019), vestibilità normale, fantasia righe, stagione primavera/estate",16.99,"maglia",'02',(SELECT nome_dep FROM deposito));

/*giacca uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone poliestere","info giacca, marca Levi's, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",129.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"nero","similpelle","info giacca, marca River Island, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",95,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"blu","cotone pelle","info giacca, marca Wearecph, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",220,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosso","cotone poliestere","info giacca, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione autunno/inverno",80,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"nero","jersey","info giacca, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",79.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","poliammide","info giacca, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione autunno/inverno",69.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"verde","poliestere","info giacca, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",49.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","poliestere","info giacca, marca The North Face, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione autunno/inverno",149.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","jeans","info giacca, marca Siksilk, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",70,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"marrone","pelle","info giacca, marca Jack & Jones, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",139.99,"giacca",'02',(SELECT nome_dep FROM deposito));

/*cappotto uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"grigio","poliestere","info cappotto, marca Colmar, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",234.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"nero","poliestere","info cappotto, marca Derbe, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",220,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","poliestere","info cappotto, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",119.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"verde","poliestere","info cappotto, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",100,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","lana poliammide cashmere","info cappotto, marca Hugo, collezione (2018/2019), vestibilità normale, fantasia melange, stagione autunno/inverno",349.99,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"beige","poliestere","info cappotto, marca Kiomi, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",80,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","poliestere","info cappotto, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",130,"giacca",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"verde","poliestere","info cappotto, marca K-Way, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",200,"giacca",'02',(SELECT nome_dep FROM deposito));

/*jeans uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info jeans taglio largo, marca Pull&Bear, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",35.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"blu","cotone","info jeans taglio largo, marca Pull&Bear, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",35.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","cotone","info jeans taglio largo, marca Solid, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",50,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","cotone","info jeans taglio largo, marca Solid, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",50,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"blu","cotone","info jeans slim fit, marca Bershka, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione primavera/estate",30,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"blu","cotone","info jeans a sigaretta, marca Pull&Bear, collezione (2018/2019), vestibilità a sigaretta, fantasia monocromo, stagione primavera/estate",29.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"blu","cotone","info jeans a sigaretta, marca Pull&Bear, collezione (2018/2019), vestibilità a sigaretta, fantasia monocromo, stagione primavera/estate",29.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","cotone","info jeans, marca Levi's, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",110,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info jeans, marca Levi's, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",110,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"nero","cotone","info jeans slim fit, marca Only & Sons, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione primavera/estate",39.99,"pantalone",'02',(SELECT nome_dep FROM deposito));

/*pantalone classico uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone","info pantalone classico, marca Jack & Jones, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione primavera/estate",39.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"verde","cotone e lino","info pantalone classico, marca Pier One, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione primavera/estate",40,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"beige","cotone","info pantalone classico, marca Dockers, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",90,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"verde","cotone","info pantalone classico, marca Jack & Jones, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione primavera/estate",54.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"grigio","cotone","info pantalone classico, marca Tommy Hilfiger, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",100,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"beige","cotone","info pantalone classico, marca G-Star, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",100,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info pantalone classico, marca Scotch & Soda, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione primavera/estate",90,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"grigio","poliestere viscosa","info pantalone classico, marca Gabba, collezione (2018/2019), vestibilità gamba stretta, fantasia a scacchi, stagione autunno/inverno",89.99,"pantalone",'02',(SELECT nome_dep FROM deposito));

/*pantalone elegante uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","lana","info pantalone elegante, marca Massimo Dutti, collezione (2018/2019), vestibilità slim, fantasia melange, stagione primavera/estate",79.95,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"grigio","poliestere viscosa","info pantalone elegante, marca Jack & Jones, collezione (2018/2019), vestibilità slim, fantasia melange, stagione primavera/estate",49.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","poliestere viscosa","info pantalone elegante, marca Selected Homme, collezione (2018/2019), vestibilità slim, fantasia melange, stagione autunno/inverno",69.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"blu","acetato cotone","info pantalone elegante, marca Massimo Dutti, collezione (2018/2019), vestibilità slim, fantasia righe, stagione primavera/estate",79.95,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"grigio","poliestere","info pantalone elegante, marca Selected Homme, collezione (2018/2019), vestibilità slim, fantasia a scacchi, stagione autunno/inverno",149.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone poliammide","info pantalone elegante, marca Drykorn, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",129.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","cotone","info pantalone elegante, marca Boss, collezione (2018/2019), vestibilità a sigaretta, fantasia monocromo, stagione autunno/inverno",200,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","lana","info pantalone elegante, marca Hugo, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",129.99,"pantalone",'02',(SELECT nome_dep FROM deposito));

/*pantaloncino uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone","info pantaloncino, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",34.95,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"celeste","cotone","info pantaloncino, marca Petrol Industries, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",60,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","cotone poliestere","info pantaloncino, marca Jordan, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",34.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info pantaloncino, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia stampa, stagione primavera/estate",40,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"giallo","cotone","info pantaloncino, marca Selected Homme, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",39.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"beige","cotone","info pantaloncino, marca Only & Sons, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",24.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"verde","cotone","info pantaloncino, marca Scotch & Soda, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",80,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"rosso","poliestere","info pantaloncino, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",29.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"grigio","cotone poliestere","info pantaloncino, marca Fila, collezione (2018/2019), vestibilità normale, fantasia melange, stagione primavera/estate",44.99,"pantalone",'02',(SELECT nome_dep FROM deposito));

/*pantaloni sportivi uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone poliestere","info pantalone sportivo, marca Adidas, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",69.99,"pantalone",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"grigio","cotone poliestere","info pantalone sportivo, marca Nike, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",39.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"rosso","cotone poliestere","info pantalone sportivo, marca Adidas, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",59.95,"pantalone",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","poliammide","info pantalone sportivo, marca Puma, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",100,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone poliestere","info pantalone sportivo, marca Puma, collezione (2018/2019), vestibilità gamba stretta, fantasia stampa, stagione autunno/inverno",60,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone poliestere","info pantalone sportivo, marca Fila, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",79.99,"pantalone",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"nero","cotone poliestere","info pantalone sportivo, marca Fila, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",49.99,"pantalone",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XL',"nero","cotone poliestere","info pantalone sportivo, marca Kappa, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",49.99,"pantalone",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone poliestere","info pantalone sportivo, marca Alpha Industries, collezione (2018/2019), vestibilità gamba stretta, fantasia monocromo, stagione autunno/inverno",69.99,"pantalone",'02',(SELECT nome_dep FROM deposito));

/*modello vestito uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"blu","acetato poliestere","info vestito, marca Pier One, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",109.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"blu","poliestere","info vestito, marca Pier One, collezione (2018/2019), vestibilità slim, fantasia a scacchi, stagione autunno/inverno",109.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"grigio","poliestere","info vestito, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia a scacchi, stagione autunno/inverno",139.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","poliestere","info vestito, marca LindBergh, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",149.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","poliestere","info vestito, marca Lindbergh, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",179.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","poliestere","info vestito, marca Esprit Collection, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",199.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","lana poliestere","info vestito, marca Calvin Klein, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",379.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","poliestere","info vestito, marca Selected Homme, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",189.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","lana poliestere","info vestito, marca Calvin Klein, collezione (2018/2019), vestibilità slim, fantasia monocromo, stagione autunno/inverno",379.99,"vestito",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","poliestere","info vestito, marca Isaac Dewhirst, collezione (2018/2019), vestibilità slim, fantasia a scacchi, stagione autunno/inverno",99.99,"vestito",'02',(SELECT nome_dep FROM deposito));

/*sneakers uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"bianco","finta pelle","info sneakers, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",75.95,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"nero","pelle tessuto","info sneakers, marca Vans, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",74.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"bianco","pelle","info sneakers, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",99.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"bianco","finta pelle,tessuto","info sneakers, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",84.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"nero","tessuto","info sneakers, marca Converse, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",74.99,"scarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"multicolore","pelle tessuto","info sneakers, marca Saucony, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",94.99,"scarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"nero","pelle","info sneakers, marca Puma, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",84.99,"scarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"marrone","pelle tessuto","info sneakers, marca New Balance, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",74.95,"scarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"bianco","pelle tessuto","info sneakers, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",79.99,"scarpe",'03',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"nero","pelle","info sneakers, marca Nike, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",139.99,"scarpe",'03',(SELECT nome_dep FROM deposito));

/*scarpe eleganti uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"marrone","scamosciato","info scarpe eleganti, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",59.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"blu","tessuto","info scarpe eleganti, marca Madden, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",64.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"marrone","finta pelle","info scarpe eleganti, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",54.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"nero","finta pelle","info scarpe eleganti, marca Selected Homme, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",99.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"marrone","pelle","info scarpe eleganti, marca Walk London, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",84.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"nero","pelle","info scarpe eleganti, marca Lloyd, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",189.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"marrone","pelle","info scarpe eleganti, marca Zign, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",89.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"marrone","pelle","info scarpe eleganti, marca Lloyd, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",149.99,"scarpe",'02',(SELECT nome_dep FROM deposito));

/*stivali uomo*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"nero","pelle","info stivali, marca Zign, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",79.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"verde","tessuto","info stivali, marca Timberland, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",139.90,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"marrone","pelle","info stivali, marca Blundstone, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",164.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('41',"nero","finta pelle","info stivali, marca YourTurn, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",44.99,"scarpe",'02',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('42',"marrone","pelle","info stivali, marca Pier One, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",79.99,"scarpe",'02',(SELECT nome_dep FROM deposito));

/*giacca donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","jersey","info giacca, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia floreale, stagione autunno/inverno",50.90,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","poliestere","info giacca, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia floreale, stagione autunno/inverno",70.99,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"nero","viscosa","info giacca, marca Vero Moda, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",50.99,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"giallo","poliestere","info giacca, marca Only, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",60.00,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"marrone","pelle","info giacca, marca Vicris, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",106.99,"giacca",'01',(SELECT nome_dep FROM deposito));

/*cappotto donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"nero","cotone poliestere","info cappotto, marca Only, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",100.99,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bordeaux","cotone poliestere","info cappotto, marca Only, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",100.99,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","poliestere lana","info cappotto, marca Vero Moda, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",80.99,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bordeaux","poliestere lana","info cappotto, marca Even&Odd, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",60.99,"giacca",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"grigio","poliestere lana","info cappotto, marca Even&Odd, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",60.99,"giacca",'01',(SELECT nome_dep FROM deposito));

/*jeans e pantalone donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"rosa","cotone poliestere","info jeans vita alta , marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","cotone poliestere","info jeans vita alta , marca Topshop, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20.50,"pantalone",'01',(SELECT nome_dep FROM deposito)); 
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","cotone poliestere","info jeans vita alta , marca Topshop, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primaver/estate",20.00,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone poliestere","info jeans vita alta , marca Topshop, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","cotone poliestere","info jeans slim fit , marca Desigual, collezione (2018/2019), vestibilità aderente, fantasia floreale, stagione autunno/inverno",110.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","cotone poliestere","info jeans skinny fit, marca Esprit, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",50.99,"pantalone",'01',(SELECT nome_dep FROM deposito));

/*pantalone elegante donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"nero","cotone","info pantalone classico, marca Desigual, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",40.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"viola","cotone","info pantalone classico, marca Desigual, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",40.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","cotone","info pantalone classico, marca Vero Moda, collezione (2018/2019), vestibilità normale, fantasia a righe, stagione primavera/estate",25.90,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","cotone","info pantalone classico, marca Kiomi, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.20,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"marrone","cotone","info pantalone classico, marca Only, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",15.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"multicolore","jersey","info pantalone classico, marca Missguided, collezione (2018/2019), vestibilità normale, fantasia a righe, stagione primavera/estate",15.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","jersey","info pantalone classico, marca Only, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",15.99,"pantalone",'01',(SELECT nome_dep FROM deposito));

/*pantaloncino donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"blu","cotone","info pantaloncino, marca Pull&Bear, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",10.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('L',"nero","cotone","info pantaloncino, marca Pull&Bear, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",15.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"bianco","cotone","info pantaloncino, marca Pull&Bear, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",9.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","cotone poliestere","info pantaloncino, marca New Look, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",10.99,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"verde","cotone","info pantaloncino, marca Twintip, collezione (2018/2019), vestibilità normale, fantasia militare, stagione primavera/estate",8.40,"pantalone",'01',(SELECT nome_dep FROM deposito));

/*leggings e pantalone sportivo donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"multicolore","viscosa","info leggings, marca Bershka, collezione (2018/2019), vestibilità aderente, fantasia a scacchi, stagione autunno/inverno",10.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","viscosa","info leggings, marca Bershka, collezione (2018/2019), vestibilità aderente, fantasia monocromo, stagione autunno/inverno",10.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"nero","jersey","info leggings, marca Springfield, collezione (2018/2019), vestibilità aderente, fantasia a scacchi, stagione autunno/inverno",30.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"grigio","jersey","info leggings, marca Adidas, collezione (2018/2019), vestibilità aderente, fantasia monocromo, stagione primavera/estate",10.50,"pantalone",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosso","jersey","info leggings, marca Adidas, collezione (2018/2019), vestibilità aderente, fantasia monocromo, stagione primavera/estate",20.50,"pantalone",'01',(SELECT nome_dep FROM deposito));

/*vestito donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"bianco","cotone","info vestito, marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",10.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"rosa","cotone","info vestito, marca Zara, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"giallo","cotone","info vestito, marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"blu","cotone","info vestito, marca Zara, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",40.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"verde","viscosa","info vestito, marca EVEN&ODD, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",14.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('XS',"marrone","viscosa","info vestito, marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",13.99,"vestito",'01',(SELECT nome_dep FROM deposito));

/*gonna donna*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"bianco","cotone","info vestito, marca Adidas, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",10.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"rosa","cotone","info vestito, marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"rosso","cotone","info vestito, marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",30.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('M',"nero","velluto","info vestito, marca Zara, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",40.50,"vestito",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('S',"blu","jersey","info vestito, marca Vila, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",14.50,"vestito",'01',(SELECT nome_dep FROM deposito));

/*sandali donna- no link foto 3*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('37',"nero","similpelle","info sandali, marca Dorothy, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",10.59,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('38',"rosa","similpelle","info sandali, marca Dorothy, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",10.59,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('39',"blu","similpelle","info sandali, marca Tamaris, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",9.50,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"bianco","similpelle","info sandali, marca Dorothy, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",19.90,"scarpe",'01',(SELECT nome_dep FROM deposito));

/*scarpe col tacco donna- no link foto 3*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('37',"rosa","similpelle","info scarpe col tacco, marca Dorothy, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20.50,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('38',"blu","similpelle","info scarpe col tacco, marca Dorothy, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",20.50,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('39',"nero","similpelle","info scarpe col tacco, marca Anna Field, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione primavera/estate",70.50,"scarpe",'01',(SELECT nome_dep FROM deposito));

/*stivali donna- no link foto 3*/
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('36',"nero","similpelle","info stivali, marca Tamaris, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",30.50,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('38',"marrone","similpelle","info stivali, marca Zign, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",40.50,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('39',"nero","similpelle","info stivali, marca Anna Field, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",50.99,"scarpe",'01',(SELECT nome_dep FROM deposito));
INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES 
('40',"nero","similpelle","info stivali, marca Anna Field, collezione (2018/2019), vestibilità normale, fantasia monocromo, stagione autunno/inverno",70.50,"scarpe",'01',(SELECT nome_dep FROM deposito));

/* per rendere visibili i capi sul sito web */
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),1);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),2);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),3);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),4);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),5);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),6);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),7);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),8);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),9);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),10);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),11);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),12);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),13);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),14);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),15);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),16);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),17);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),18);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),19);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),20);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),21);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),22);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),23);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),24);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),25);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),26);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),27);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),28);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),29);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),30);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),31);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),32);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),33);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),34);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),35);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),36);

INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),37);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),38);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),39);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),40);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),41);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),42);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),43);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),44);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),45);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),46);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),47);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),48);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),49);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),50);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),51);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),52);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),53);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),54);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),55);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),56);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),57);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),58);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),59);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),60);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),61);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),62);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),63);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),64);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),65);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),66);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),67);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),68);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),69);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),70);
INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),71);

/*rende visibile donna*/
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),1);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),2);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),3);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),4);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),5);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),6);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),7);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),8);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),9);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),10);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),11);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),12);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb), 13);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),14);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),15);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),16);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),17);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),18);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),19);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),20);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),21);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),22);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),23);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),24);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),25);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),26);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),27);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),28);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),29);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),30);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),31);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),32);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),33);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),34);

INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),165);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),166);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),167);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),168);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),169);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),170);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),171);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),172);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),173);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),174);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),175);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),176);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),177);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),178);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),179);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),180);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),181);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),182);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),183);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),184);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),185);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),186);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),187);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),188);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),189);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),190);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),191);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),192);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),193);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),194);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),195);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),196);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),197);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),198);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),199);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),200);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),201);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),202);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),203);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),204);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),205);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),206);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),207);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),208);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),209);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),210);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),211);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),212);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),213);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),214);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),215);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),216);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),217);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),218);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),219);

/*rende visibile uomo*/
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),35);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),36);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),37);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),38);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),39);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),40);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),41);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),42);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),43);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),44);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),45);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),46);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),47);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),48);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),49);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),50);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),51);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),52);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),53);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),54);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),55);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),56);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),57);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),58);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),59);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),60);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),61);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),62);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),63);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),64);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),65);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),66);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),66);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),67);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),68);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),69);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),70);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),71);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),72);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),73);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),74);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),75);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),76);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),77);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),78);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),79);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),80);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),81);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),82);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),83);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),84);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),85);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),86);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),87);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),88);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),89);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),90);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),91);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),92);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),93);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),94);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),95);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),96);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),97);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),98);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),99);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),100);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),101);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),102);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),103);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),104);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),105);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),106);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),107);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),108);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),109);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),110);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),111);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),112);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),113);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),114);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),115);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),116);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),117);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),118);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),119);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),120);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),121);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),122);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),123);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),124);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),125);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),126);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),127);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),128);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),129);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),130);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),131);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),132);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),133);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),134);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),135);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),136);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),137);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),138);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),139);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),140);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),141);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),142);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),143);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),144);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),145);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),146);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),147);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),148);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),149);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),150);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),151);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),152);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),153);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),154);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),155);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),156);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),157);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),158);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),159);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),160);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),161);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),162);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),163);
INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),164);


