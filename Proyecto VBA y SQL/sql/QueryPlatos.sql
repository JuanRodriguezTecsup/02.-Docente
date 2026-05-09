CREATE DATABASE Restaurante

USE Restaurante

CREATE TABLE Platos(
	idPlato INT PRIMARY KEY,
	Nombre VARCHAR(50),
	Descrip VARCHAR(255),
	Precio DECIMAL(10,2)
)

--Agregar 4 platos
INSERT INTO Platos
SELECT 1,'Lomo Saltado','Pequeños trozos de lomo acompañados con papas fritas, cebolla y arroz',30
UNION
SELECT 2,'Aji de gallina','Pollo deshilachado con papas y salsa de ají amarillo',28

INSERT INTO Platos
SELECT 3,'Ceviche', 'Pescado fresco marinado en limón acompañado con cebolla, camote y choclo',25.5
UNION
SELECT 4,'Tallarines Verdes', 'Tallarines bañados en salsa de albahaca y espinaca acompañados con bistec',39.9

--Consultar tabla
SELECT * FROM Platos