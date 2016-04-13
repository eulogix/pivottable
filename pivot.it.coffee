$ = jQuery

nf = $.pivotUtilities.numberFormat
tpl = $.pivotUtilities.aggregatorTemplates

itFmt =    nf(thousandsSep: " ", decimalSep: ",")
itFmtInt = nf(digitsAfterDecimal: 0, thousandsSep: " ", decimalSep: ",")
itFmtPct = nf(digitsAfterDecimal: 1, scaler: 100, suffix: "%", thousandsSep: " ", decimalSep: ",")

$.pivotUtilities.locales.it =

	localeStrings:
		renderError: "Errore durante il rendering dei risultati."
		computeError: "Errore durante il calcolo dei risultati."
		uiRenderError: "Errore durante il rendering dell&quot;interfaccia utente."
		selectAll: "Seleziona tutti"
		selectNone: "Svuota selezione"
		tooMany: "(troppi elementi)"
		filterResults: "Filtra risultati"
		totals: "Totali" #for table renderer
		vs: "su" #for gchart renderer
		by: "per" #for gchart renderer

	aggregators:
		"Conta":                tpl.count(itFmtInt)
		"Conta valori unici":   tpl.countUnique(itFmtInt)
		"Elenca valori unici":  tpl.listUnique(", ")
		"Somma":                tpl.sum(itFmt)
		"Somma Intera":         tpl.sum(itFmtInt)
		"Media":              tpl.average(itFmt)
		"Somma su Somma":         tpl.sumOverSum(itFmt)
		"Limite 80% superiore":      tpl.sumOverSumBound80(true, itFmt)
		"Limite 80% inferiore":      tpl.sumOverSumBound80(false, itFmt)
		"Somma come Frazione del Totale":     tpl.fractionOf(tpl.sum(),   "total", itFmtPct)
		"Somma come Frazione delle Righe":      tpl.fractionOf(tpl.sum(),   "row",   itFmtPct)
		"Somma come Frazione delle Colonne":   tpl.fractionOf(tpl.sum(),   "col",   itFmtPct)
		"Conto come Frazione del Totale":   tpl.fractionOf(tpl.count(), "total", itFmtPct)
		"Conto come Frazione delle Righe":    tpl.fractionOf(tpl.count(), "row",   itFmtPct)
		"Conto come Frazione delle Colonne": tpl.fractionOf(tpl.count(), "col",   itFmtPct)

    renderers:
        "Tabella":                           $.pivotUtilities.renderers["Table"]
        "Tabella con Barre":               $.pivotUtilities.renderers["Table Barchart"]
        "Heatmap":                $.pivotUtilities.renderers["Heatmap"]
        "Heatmap per Riga":      $.pivotUtilities.renderers["Row Heatmap"]
        "Heatmap per Colonna":    $.pivotUtilities.renderers["Col Heatmap"]


