--CREATE Database GestioneVoli;

CREATE TABLE Aeroporto(
IdAeroporto int IDENTITY(1,1) NOT NULL,
Nome nvarchar(50) NOT NULL,
Citta nvarchar(50) NOT NULL,
Nazione nvarchar(50) NOT NULL,
NumeroPiste int NOT NULL,
CONSTRAINT [Pk_aeroporto] PRIMARY KEY(IdAeroporto) 
);

CREATE TABLE Aereo(
IdAereo int IDENTITY(1,1) NOT NULL,
Tipo int NOT NULL,
NPassegeri int NULL,
QuantitaMerci int NULL,
CONSTRAINT [Pk_aereo] PRIMARY KEY(IdAereo) 
);

CREATE TABLE Volo(
IdVolo int IDENTITY(1,1) NOT NULL,
CodiceVolo nvarchar(50) UNIQUE NOT NULL,
Data Datetime NOT NULL,
OraPartenza time NOT NULL,
OraArrivo time NOT NULL,
IdAeroportoPartenza int FOREIGN KEY REFERENCES Aeroporto(IdAeroporto),
IdAeroportoArrivo int FOREIGN KEY REFERENCES Aeroporto(IdAeroporto),
IdAereo int FOREIGN KEY REFERENCES Aereo(IdAereo),
CONSTRAINT [Pk_volo] PRIMARY KEY(IdVolo) 
);


