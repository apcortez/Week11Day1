--SELECT Artista.Nome, Opera.Titolo
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Opera.CodiceMuseo = Museo.Codice
--WHERE Museo.Nome IN ('Galleria degli Uffizi', 'National Gallery');

-----------------------------------------------------------------------------------
--SELECT Artista.Nome, Opera.Titolo
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Opera.CodiceMuseo = Museo.Codice
--WHERE Artista.Nazionalita = 'spagnola' and Museo.Citt� = 'Firenze';

--SELECT Artista.Nome, Opera.Titolo
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Opera.CodiceMuseo = Museo.Codice
--WHERE Artista.Nazionalita = 'italiana' and Museo.Citt� = 'Parigi';
-----------------------------------------------------------------------------------
--SELECT Opera.Codice, Opera.Titolo
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Opera.CodiceMuseo = Museo.Codice
--			 join OperaPersonaggio on Opera.Codice = OperaPersonaggio.Codice
--			 join Personaggio on OperaPersonaggio.IdPersonaggio = Personaggio.IdPersonaggio
--WHERE Museo.Citt� = 'Londra' and Artista.Nazionalita = 'italiana' and Personaggio.Nome ='Madonna';

--SELECT Opera.Codice, Opera.Titolo
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Opera.CodiceMuseo = Museo.Codice
--			 join OperaPersonaggio on Opera.Codice = OperaPersonaggio.Codice
--			 join Personaggio on OperaPersonaggio.IdPersonaggio = Personaggio.IdPersonaggio
--WHERE Museo.Citt� = 'Parigi' and Artista.Nazionalita = 'italiana' and Personaggio.Nome ='Monna Lisa';
-------------------------------------------------------------------------------------------------------
--SELECT Museo.Nome, COUNT(Opera.Codice) as NumeroOpere
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Museo.Codice = Opera.CodiceMuseo
--GROUP BY Museo.Citt�, Museo.Nome, Artista.Nazionalita
--HAVING Artista.Nazionalita = 'italiana' and  Museo.Citt� = 'Londra';

--SELECT Museo.Nome, COUNT(Opera.Codice) as NumeroOpere
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Museo.Codice = Opera.CodiceMuseo
--WHERE Artista.Nazionalita = 'italiana' and  Museo.Citt� = 'Parigi'
--GROUP BY Museo.Nome;

---------------------------------------------------------------------------------------------------
--SELECT Museo.Nome
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Museo.Codice = Opera.CodiceMuseo
--WHERE Museo.Citt� = 'Londra' AND Museo.Nome not in(SELECT Museo.Nome FROM Museo join Opera on Museo.Codice = Opera.CodiceMuseo
--																				join Artista on Artista.IdArtista = Opera.IdArtista
--												   where Artista.Nome = 'Tiziano');
---------------------------------------------------------------------------------------------------
--SELECT Museo.Nome
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Museo.Codice = Opera.CodiceMuseo
--WHERE Museo.Citt� = 'Londra' AND Museo.Nome not in(SELECT Museo.Nome FROM Museo join Opera on Museo.Codice = Opera.CodiceMuseo
--																				join Artista on Artista.IdArtista = Opera.IdArtista
--												   where Artista.Nome <> 'Tiziano');
--------------------------------------------------------------------------------------------------
--SELECT Museo.Nome
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Museo.Codice = Opera.CodiceMuseo
--WHERE Artista.Nazionalita = 'italiana'
--GROUP BY Museo.Nome
--HAVING COUNT(Opera.Codice)>20;
---------------------------------------------------------------------------------------------------
--SELECT Museo.Nome, Artista.Nazionalita, Count(Opera.Codice) as NumeroOpere
--FROM Artista join Opera on Artista.IdArtista = Opera.IdArtista
--             join Museo on Museo.Codice = Opera.CodiceMuseo
--GROUP BY Museo.Nome, Artista.Nazionalita;