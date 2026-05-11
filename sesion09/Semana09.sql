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

--1. Crear el login
CREATE LOGIN cajero1
WITH PASSWORD = 'Clave123';

--2. Crear usuario y asociar el login
CREATE USER jrodriguez
FOR LOGIN cajero1;

--3. Crear el rol
CREATE ROLE RolCajero

--4. Asociar el rol de cajero a mi empleado nuevo
ALTER ROLE RolCajero
ADD MEMBER jrodriguez;

--5. Asigna privilegios al rol
GRANT SELECT ON Platos TO RolCajero;

GRANT INSERT ON Platos TO RolCajero; --Otorgar privilegio
REVOKE INSERT ON Platos FROM RolCajero; --Quitar pivilegio


