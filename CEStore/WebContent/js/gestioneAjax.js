/**
 * funzione ajax per l'autocompletamento della barra di ricerca
 */
function ricerca(str, name) {

	var dataList = document.getElementById('ricerca-datalist');
	
	if (str.length == 0) {
		// rimuove elementi <option> (suggerimenti) esistenti
		dataList.innerHTML = '';
		return;
	}

	var xmlHttpReq = new XMLHttpRequest();
	xmlHttpReq.responseType = 'json';
	xmlHttpReq.onreadystatechange = function() {
		//readyState = 4 --> risposta ricevuta caricata completamente
		if (this.readyState == 4 && this.status == 200) {
			// rimuove elementi <option> (suggerimenti) esistenti
			dataList.innerHTML = '';
			
			for ( var i in this.response) {
				// crea un elemento option
				var option = document.createElement('option');
				// setta il valore
				option.value = this.response[i];
			
				// aggiunge elemento <option> a datalist
				dataList.appendChild(option);
			}

		}
	}
	
	xmlHttpReq.open("GET", "RicercaCapi?" + name + "=" + encodeURIComponent(str), true);
	xmlHttpReq.send();
}
