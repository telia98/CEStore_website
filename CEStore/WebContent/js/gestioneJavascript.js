/**
 * script per la validazione dei campi della mail
 */
function validaMail(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.type == "email") {
      console.log("this is an email element");
      
      var email_valid = /[A-z0-9\.\+_-]+@[A-z0-9\._-]+\.[A-z]{2,6}/;
      	if (email_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi dell'username
 */
function validaUsername(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "username") {
      console.log("this is an username element");
      
      	if (input.value.length<30) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi della password
 */
function validaPassword(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.type == "password") {
      console.log("this is an password element");
      
      var password_valid = /((?=.*[0-9])(?=.*[a-zA-Z]).{6,})$/;
      	if (password_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi del nome
 */
function validaNome(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "nome") {
      console.log("this is an nome element");
      
    //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var nome_valid = /^[a-z A-Z àéèìòù]{2,15}$/;
      	if (nome_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi del cognome
 */
function validaCognome(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "cognome") {
      console.log("this is an cognome element");
      
      //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var cognome_valid = /^[a-z A-Z àéèìòù]{2,20}$/;
      	if (cognome_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi del codice fiscale
 */
function validaCodiceFiscale(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "codiceFiscale") {
      console.log("this is an codiceFiscale element");
      
      //espressione regolare di verifica
  		var codiceFiscale_valid=/[a-z,A-Z]{6}[0-9]{2}[a-z,A-Z][0-9]{2}[a-z,A-Z][0-9]{3}[a-z,A-Z]/;
      	if (codiceFiscale_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi della citta
 */
function validaCitta(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "citta") {
      console.log("this is an citta element");
      
      //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var citta_valid = /^[a-z A-Z àéèìòù]{2,30}$/;
      	if (citta_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi della provincia
 */
function validaProvincia(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "provincia") {
      console.log("this is an provincia element");
      
      //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var provincia_valid = /^[a-z A-Z àéèìòù]{2,20}$/;
      	if (provincia_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi della via
 */
function validaVia(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "via") {
      console.log("this is an via element");
      
      //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var via_valid = /^[a-z A-Z àéèìòù]{2,50}$/;
      	if (via_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi del numero civico
 */
function validaNumeroCivico(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "numeroCivico") {
      console.log("this is an numeroCivico element");
      
      //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var numeroCivico_valid = /^[a-z A-Z 0-9]{2,4}$/;
      	if (numeroCivico_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi del CAP
 */
function validaCAP(input) {
    if (input.value.length < 1) {
      //red border
        input.style.borderColor = "#e74c3c";
      
    } else if (input.name == "CAP") {
      console.log("this is an CAP element");
      
      //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
      var cap_valid = /^[0-9]{2,7}$/;
      	if (cap_valid.test(input.value)) {
          //green border
          input.style.borderColor = "#2ecc71";
        } else {
          //red border
          input.style.borderColor = "#e74c3c";
        }
      
    } 
    else {
      //green border
        input.style.borderColor = "#2ecc71";
    }
}

/**
 * script per la validazione dei campi del numero di carta
 */
function validanCarta(input) {
    if (input.value.length < 1) {
        //red border
          input.style.borderColor = "#e74c3c";
        
      } else if (input.name == "nCarta") {
        console.log("this is an nCarta element");
        
        //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
        var numeroCarta_valid = /([0-9]{4}( |\\-)){3}[0-9]{4}$/;
        	if (numeroCarta_valid.test(input.value)) {
            //green border
            input.style.borderColor = "#2ecc71";
          } else {
            //red border
            input.style.borderColor = "#e74c3c";
          }
        
      } 
      else {
        //green border
          input.style.borderColor = "#2ecc71";
      }
}

/**
 * script per la validazione dei campi del cvv
 */
function validaCvv(input) {
    if (input.value.length < 1) {
        //red border
          input.style.borderColor = "#e74c3c";
        
      } else if (input.name == "cvv") {
        console.log("this is an cvv element");
        
        //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
        var cvv_valid = /^[0-9]{3,4}$/;
        	if (cvv_valid.test(input.value)) {
            //green border
            input.style.borderColor = "#2ecc71";
          } else {
            //red border
            input.style.borderColor = "#e74c3c";
          }
        
      } 
      else {
        //green border
          input.style.borderColor = "#2ecc71";
      }
}

/**
 * script per la validazione dei campi della data di scadenza della carta
 */
function validaData(input) {
    if (input.value.length < 1) {
        //red border
          input.style.borderColor = "#e74c3c";
        
      } else if (input.name == "data") {
        console.log("this is an data element");
        
        //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
        var data_valid = /^(0[1-9]|1[0-2]|[1-9])\/(1[4-9]|[2-9][0-9]|20[1-9][1-9])$/;
        	if (data_valid.test(input.value)) {
            //green border
            input.style.borderColor = "#2ecc71";
          } else {
            //red border
            input.style.borderColor = "#e74c3c";
          }
        
      } 
      else {
        //green border
          input.style.borderColor = "#2ecc71";
      }
}

/**
 * script per la validazione dei campi dell'IBAN
 */
function validaIban(input) {
    if (input.value.length < 1) {
        //red border
          input.style.borderColor = "#e74c3c";
        
      } else if (input.name == "iban") {
        console.log("this is an iban element");
        
        //il numero massimo di caratteri è pari alla dimensione massima del campo nel DB
        var data_valid = /IT\d{2}[ ][a-zA-Z]\d{3}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{4}[ ]\d{3}|IT\d{2}[a-zA-Z]\d{22}/;
        	if (data_valid.test(input.value)) {
            //green border
            input.style.borderColor = "#2ecc71";
          } else {
            //red border
            input.style.borderColor = "#e74c3c";
          }
        
      } 
      else {
        //green border
          input.style.borderColor = "#2ecc71";
      }
}