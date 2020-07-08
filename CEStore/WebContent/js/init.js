/* utilizzo il framework skel come linea guida per il responsive */
skel.init({
	prefix: 'css/style', //comunico che voglio curare lo style in css
	resetCSS: true, //resetto il css ogni qualvolta cambia la dimensione dello schermo
	boxModel: 'border',
	scalable: true, //rendo responsive la finestra quando con il cursore si modifica la dimensione
	grid: {
		gutters: 50 //setto gli spazi tra i div interni del div class="grid"
	},
	/* resetto i breakpoints previsiti dal framework e per ognuno chiamo un file css appositamente definito */
	breakpoints: {
		'mobile': {
			range: '-500', //da 500 a minori
			containers: 'fluid',
			grid: {
				collapse: true, //dico che i div devono ricomprimersi per adattarsi alla nuova dimensione dello schermo
				gutters: 10
			}
		},
		'tablet': {
			range: '501-768', //tra 501 a 768
			containers: 700 /* cambio la misura del div class="container" comune a tutte le pagine */
		},
		'1000px': {
			range: '769-1024', //tra 769 a 1024
			containers: 1000
		},
		'desktop': {
			range: '1025-', //da 1025 a maggiori
			containers: 1350
		}
	}
}, {
	panels: {
		panels: {
			navPanel: {
				breakpoints: 'mobile',
				position: 'left',
				style: 'reveal',
				size: '80%',
				html: '<div data-action="navList" data-args="nav"></div>'
			}
		},
		overlays: {
			titleBar: {
				breakpoints: 'mobile',
				position: 'top-left',
				height: 44,
				width: '100%',
				html: '<span class="toggle" data-action="togglePanel" data-args="navPanel"></span>' +
 '<span class="title" data-action="copyHTML" data-args="logo"></span>'
			}
		}
	}
});