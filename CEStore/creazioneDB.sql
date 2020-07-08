DROP DATABASE IF EXISTS e_commerce_abbigliamento;
CREATE DATABASE e_commerce_abbigliamento;

USE e_commerce_abbigliamento;

/* CREAZIONE DELLE TABELLE DEL DATABASE*/

DROP TABLE IF EXISTS sitoWeb;
CREATE TABLE IF NOT EXISTS sitoWeb(
	indirizzo_IP varchar(100) NOT NULL,
	link varchar(100) NOT NULL,
	PRIMARY KEY (indirizzo_IP));
    
DROP TABLE IF EXISTS deposito;
CREATE TABLE IF NOT EXISTS deposito(
	nome_dep varchar(50) NOT NULL,
    indirizzo varchar(50),
    PRIMARY KEY(nome_dep));
    
DROP TABLE IF EXISTS ditta;
CREATE TABLE IF NOT EXISTS ditta(
	nome_ditta enum('DHL','BRT','SDA','GLS'), 
    indirizzo varchar(50),
    PRIMARY KEY(nome_ditta));
    
DROP TABLE IF EXISTS categoria;
CREATE TABLE IF NOT EXISTS categoria(
	codCat enum('01','02','03') NOT NULL,
    genere varchar(10) NOT NULL,
    PRIMARY KEY(codCat)); 

DROP TABLE IF EXISTS anagrafica_cliente;
CREATE TABLE IF NOT EXISTS anagrafica_cliente(
	CF varchar(16) NOT NULL,
    nome varchar(15),
    cognome varchar(20),
    IP_sito varchar(100),
    PRIMARY KEY (CF),
    FOREIGN KEY(IP_sito) REFERENCES sitoWeb(indirizzo_IP) ON UPDATE CASCADE); 
    
DROP TABLE IF EXISTS indirizzo_cliente;
CREATE TABLE IF NOT EXISTS indirizzo_cliente(	
	via varchar(50) NOT NULL,
    provincia varchar(20) NOT NULL,
    CAP varchar(7) NOT NULL,
    n_civico varchar(4) NOT NULL,
    città varchar(30),
    cf_cliente varchar(16),
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE);

DROP TABLE IF EXISTS utente;
CREATE TABLE IF NOT EXISTS utente(
	username varchar(30) NOT NULL,
    pax varchar(15) NOT NULL,
    mail varchar(100) NOT NULL,
    cf_cliente varchar(16),
    IP_sito varchar(100),
    PRIMARY KEY(username),
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE,
    FOREIGN KEY (IP_sito) REFERENCES sitoWeb(indirizzo_IP) ON UPDATE CASCADE);

DROP TABLE IF EXISTS carrello;
CREATE TABLE IF NOT EXISTS carrello(
	codCar int unsigned auto_increment NOT NULL,
    cf_cliente varchar(16),
    PRIMARY KEY(codCar),
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE);
    
DROP TABLE IF EXISTS vestiario;
CREATE TABLE IF NOT EXISTS vestiario(
	codCapo int unsigned auto_increment NOT NULL,
    taglia ENUM('XS', 'S', 'M', 'L','XL','36','37','38','39','40', '41', '42') NOT NULL, 
    colore varchar(30),
    materiale varchar(50),
    descrizione varchar(200),
    costo float unsigned NOT NULL,
    modello enum('maglia','giacca','pantalone','vestito','scarpe'),
    nomeDeposito varchar(50),
    codCategoria enum('01', '02', '03'),
	linkFoto1 mediumblob,
    linkFoto2 mediumblob,
    linkFoto3 mediumblob,
    PRIMARY KEY(codCapo),
    FOREIGN KEY(nomeDeposito) REFERENCES deposito(nome_dep),
    FOREIGN KEY(codCategoria) REFERENCES categoria(codCat)); 

DROP TABLE IF EXISTS accessorio;
CREATE TABLE IF NOT EXISTS accessorio(
	codCapo int unsigned auto_increment NOT NULL,
    descrizione varchar(200),
    costo float unsigned NOT NULL,
    tipologia enum('borsa','gioielli','sciarpe','cappelli'),
    nomeDeposito varchar(50),
    codCategoria enum('01', '02', '03'), 
	linkFoto1 mediumblob,
    linkFoto2 mediumblob,
    linkFoto3 mediumblob,
    PRIMARY KEY(codCapo),
    FOREIGN KEY(nomeDeposito) REFERENCES deposito(nome_dep),
    FOREIGN KEY(codCategoria) REFERENCES categoria(codCat)); 

DROP TABLE IF EXISTS bonifico;
CREATE TABLE IF NOT EXISTS bonifico(
	ID_pagamento int unsigned auto_increment NOT NULL, 
    IBAN varchar(27) NOT NULL, 
    nome_mittente varchar(30) NOT NULL,
    cf_cliente varchar(16),
    PRIMARY KEY(ID_pagamento),
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE);
    
DROP TABLE IF EXISTS cartaDiCredito;
CREATE TABLE IF NOT EXISTS cartaDiCredito( 
	ID_pagamento int unsigned auto_increment NOT NULL,
    numero_carta varchar(20) NOT NULL,
    data_scadenza varchar(7) NOT NULL, 
    CVV int unsigned NOT NULL, 
    cf_cliente varchar(16),
    PRIMARY KEY(ID_pagamento),
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE);

DROP TABLE IF EXISTS ordine;
CREATE TABLE IF NOT EXISTS ordine(
	codOr int unsigned auto_increment NOT NULL,
    dataOr varchar(10),
    ora varchar(10), 
    n_tracking varchar(10) NOT NULL,
    cf_cliente varchar(16),
    codCarrello int unsigned,
	pag_bonifico int unsigned,
    pag_carta int unsigned,
    nomeDitta enum('DHL','BRT','SDA','GLS'),
    PRIMARY KEY(codOr),
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE,
    FOREIGN KEY(codCarrello) REFERENCES carrello(codCar) ON DELETE CASCADE,
    FOREIGN KEY(pag_bonifico) REFERENCES bonifico(ID_pagamento) ON DELETE CASCADE,
    FOREIGN KEY(pag_carta) REFERENCES cartaDiCredito(ID_pagamento) ON DELETE CASCADE,
    FOREIGN KEY(nomeDitta) REFERENCES ditta(nome_ditta) ON DELETE CASCADE ON UPDATE CASCADE); 

DROP TABLE IF EXISTS fattura;
CREATE TABLE IF NOT EXISTS fattura(
	ID_fattura varchar(7) NOT NULL,
    importo_totale float unsigned NOT NULL,
    codOrdine int unsigned,
    PRIMARY KEY(ID_fattura),
    FOREIGN KEY(codOrdine) REFERENCES ordine(codOr) ON DELETE CASCADE);

DROP TABLE IF EXISTS numero_telefono;
CREATE TABLE IF NOT EXISTS numero_telefono(
	numero varchar(15) NOT NULL,
    nomeDitta enum('DHL', 'BRT', 'SDA', 'GLS'),
    PRIMARY KEY(numero), 
    FOREIGN KEY(nomeDitta) REFERENCES ditta(nome_ditta) ON DELETE CASCADE); 
    
DROP TABLE IF EXISTS contiene;
CREATE TABLE IF NOT EXISTS contiene(
	codVestiario int unsigned,
    codAccessorio int unsigned,
    codCarrello int unsigned,
    cf_cliente varchar(16),
	FOREIGN KEY(codVestiario) REFERENCES vestiario(codCapo) ON DELETE CASCADE,
    FOREIGN KEY(codAccessorio) REFERENCES accessorio(codCapo) ON DELETE CASCADE,
    FOREIGN KEY(codCarrello) REFERENCES carrello(codCar) ON DELETE CASCADE,
    FOREIGN KEY(cf_cliente) REFERENCES anagrafica_cliente(CF) ON DELETE CASCADE);

DROP TABLE IF EXISTS rendeVisibile;
CREATE TABLE IF NOT EXISTS rendeVisibile(
	IP_sito varchar(100),
    codVestiario int unsigned,
    codAccessorio int unsigned,
	FOREIGN KEY(IP_sito) REFERENCES sitoWeb(indirizzo_IP) ON UPDATE CASCADE,
    FOREIGN KEY(codVestiario) REFERENCES vestiario(codCapo) ON DELETE CASCADE,
    FOREIGN KEY(codAccessorio) REFERENCES accessorio(codCapo) ON DELETE CASCADE
    );
 
INSERT INTO anagrafica_cliente(CF,IP_sito) VALUES ("FFFFFF00F00F000F",(SELECT indirizzo_IP FROM sitoWeb));
INSERT INTO carrello(cf_cliente) VALUES ("FFFFFF00F00F000F");