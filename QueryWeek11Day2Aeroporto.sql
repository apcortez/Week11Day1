--1. Le città con un aeroporto di cui non è noto il numero di piste;
SELECT distinct Citta
FROM Aeroporto
WHERE NumeroPiste IS NULL;

--2. Le nazioni da cui parte e arriva il volo con codice AZ274;
SELECT AP.Nome as [Aeroporto di Partenza], AA.Nome as [Aeroporto di Arrivo]
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
				  join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE Volo.CodiceVolo = 'AZ274'



--3. I tipi di aereo usati nei voli che partono da Torino;
SELECT Aereo.Tipo
FROM Aeroporto join Volo on Aeroporto.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
WHERE Aeroporto.Citta = 'Torino';

--4. I tipi di aereo e il corrispondente numero di passeggeri per i tipi di aereo usati nei voli che partono da Torino. Se la descrizione dell'aereo non è disponibile, visualizzare solamente il tipo;
SELECT Aereo.Tipo, Aereo.NPassegeri
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
WHERE AP.Citta = 'Torino';


--Le città da cui partono voli internazionali;
SELECT distinct AP.Citta
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
	 join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE AP.Nazione <> AA.Nazione

--Le città da cui partono voli diretti a Bologna, ordinate alfabeticamente;
SELECT AP.Citta
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
	 join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE AA.Citta = 'Bologna'
ORDER BY AP.Citta;


--Il numero di voli internazionali che partono il giovedì da Napoli;
SELECT count(*) as [Voli Internazionali da Napoli]
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
	 join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE AP.Citta ='Napoli' and AA.Nazione <> 'Italia' and DATENAME(WEEKDAY, Volo.Data) = 'Thursday';

--Il numero di voli che partono da città italiane
SELECT Count(*)
FROM Aeroporto join Volo on Aeroporto.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
WHERE Aeroporto.Nazione = 'Italia';

--Il numero di voli internazionali che partono da città italiane
SELECT COUNT(*) as [Voli Internazionali con partenza da Italia]
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE AP.Nazione <> AA.Nazione AND AP.Nazione = 'Italia';

--Le città francesi da cui partono più di venti voli alla settimana diretti in Italia;
SELECT distinct AP.Citta
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
	 join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE AP.Nazione <> AA.Nazione AND AA.Nazione = 'Italia' AND COUNT(Volo.IdAeroportoArrivo)>20;
--Gli aeroporti italiani che hanno solo voli interni.
SELECT distinct AP.Nome
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
	 join Aeroporto AA on AA.IdAeroporto = Volo.IdAeroportoArrivo
WHERE AP.Nazione = AA.Nazione AND AP.Nazione = 'Italia';

--Le città che sono servite dall'aereo caratterizzato dal massimo numero di passeggeri;
SELECT distinct AP.Citta
FROM Aeroporto AP join Volo on AP.IdAeroporto = Volo.IdAeroportoPartenza
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
WHERE Aereo.NPassegeri = (SELECT MAX(Aereo.NPassegeri) FROM Aereo)
UNION
SELECT distinct AA.Citta
FROM Aeroporto AA join Volo on AA.IdAeroporto = Volo.IdAeroportoArrivo
	 join Aereo on Aereo.IdAereo = Volo.IdAereo
WHERE Aereo.NPassegeri = (SELECT MAX(Aereo.NPassegeri) FROM Aereo);


--La lista di tutti i tipi di aerei “Boing”.
SELECT *
FROM Aereo
WHERE Tipo LIKE 'Boing%';