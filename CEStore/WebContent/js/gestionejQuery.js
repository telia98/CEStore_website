/**
 * impostazione drop-down menu di visualizzazioneCapi.jsp per la visualizzazione dei filtri
*/
$(document).ready(function() {
	$("#nav > ul > li#taglia").click(function() {
		$("#nav > ul > li > div#taglia").toggle();
	});
});

$(document).ready(function() {
	$("#nav > ul > li#colore").click(function() {
		$("#nav > ul > li > div#colore").toggle();
	});
});

$(document).ready(function() {
	$("#nav > ul > li#materiale").click(function() {
		$("#nav > ul > li > div#materiale").toggle();
	});
});

$(document).ready(function() {
	$("#nav > ul > li#brand").click(function() {
		$("#nav > ul > li > div#brand").toggle();
	});
});

$(document).ready(function() {
	$("#nav > ul > li#fantasia").click(function() {
		$("#nav > ul > li > div#fantasia").toggle();
	});
});

$(document).ready(function() {
	$("#nav > ul > li#stagione").click(function() {
		$("#nav > ul > li > div#stagione").toggle();
	});
});

/**
 * impostazione drop-down menu per login al sistema
 */
$(document).ready(function() {
	$("li#login").click(function() {
		$("#loginForm").toggle();
	});
});