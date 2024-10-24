-- 1 Trovare le informazioni dei viaggi di durata inferiore ai 15 giorni
SELECT *
FROM viaggio
WHERE durata < 360;

-- 2 Trovare le diverse località dei viaggi di durata tra i 7 e i 10 giorni e di costo inferiore a 500 €
SELECT *
FROM viaggio
WHERE durata BETWEEN 168 AND 240;

-- 3 Trovare le informazioni anagrafiche dei clienti il cui cognome inizia con “Ro” ordinate in ordine alfabetico
SELECT *
FROM turista
WHERE cognome LIKE 'Ro%'
ORDER BY cognome;

-- 4 Trovare le località dei viaggi prenotate dal cliente Mario Rossi
SELECT viaggio.localita
FROM turista
JOIN prenotazione ON (prenotazione.id_turista =  turista.id_turista)
JOIN viaggio ON (prenotazione.id_viaggio = viaggio.id_viaggio)
WHERE turista.nome = 'Mario'
	AND turista.cognome = 'Rossi';

-- 5 Trovare i tipi di pagamento effettuati dalla cliente Francesca Verdi
SELECT prenotazione.tipo_pagamento
FROM turista
JOIN prenotazione ON (prenotazione.id_turista =  turista.id_turista)
WHERE turista.nome = 'Francesca'
	AND turista.cognome = 'Verdi';
    
-- 6 Trovare le località e le durate dei viaggi prenotati nel dicembre del 2018
SELECT *
FROM prenotazione
JOIN viaggio ON (prenotazione.id_viaggio = viaggio.id_viaggio)
WHERE prenotazione.data_prenotazione LIKE '2018-12%';

-- 7 Trovare per Mario Rossi il costo totale dei viaggi prenotati
SELECT SUM(viaggio.costo) AS 'costo totale dei viaggi prenotati da Mario Rossi'
FROM turista
JOIN prenotazione ON (prenotazione.id_turista =  turista.id_turista)
JOIN viaggio ON (prenotazione.id_viaggio = viaggio.id_viaggio)
WHERE turista.nome = 'Mario'
	AND turista.cognome = 'Rossi';
     
-- 8 Trovare la media del costo dei viaggi prenotati
SELECT AVG(viaggio.costo) as 'media del costo dei viaggi prenotati'
FROM prenotazione
JOIN viaggio ON (prenotazione.id_viaggio = viaggio.id_viaggio)