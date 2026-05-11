USE Restaurante


DELETE FROM Platos WHERE idPlato=3

TRUNCATE TABLE Platos

--Agregar 4 platos
INSERT INTO Platos
SELECT 1,'Lomo Saltado','Pequeños trozos de lomo acompañados con papas fritas, cebolla y arroz',30
UNION
SELECT 2,'Aji de gallina','Pollo deshilachado con papas y salsa de ají amarillo',28

INSERT INTO Platos
SELECT 3,'Ceviche', 'Pescado fresco marinado en limón acompañado con cebolla, camote y choclo',25.5
UNION
SELECT 4,'Tallarines Verdes', 'Tallarines bañados en salsa de albahaca y espinaca acompañados con bistec',39.9

SELECT * FROM Platos

--Hacer Backup (full)
BACKUP DATABASE Restaurante 
TO DISK = 'C:\Backup\Restaurante_FULL.bak'

INSERT INTO Platos
SELECT 5,'Causa rellena', 
'La típica causa rellena de palta y atún',15.8

--Hacer Backup (diferencial)
BACKUP DATABASE Restaurante 
TO DISK = 'C:\Backup\Restaurante_Dif1105.bak'
WITH DIFFERENTIAL

SELECT * FROM Platos


-- FULL 
RESTORE DATABASE Restaurante
FROM DISK='C:\Backup\Restaurante_FULL.bak'
WITH NORECOVERY, 
REPLACE;

--DIFERENCIAL
RESTORE DATABASE Restaurante
FROM DISK='C:\Backup\Restaurante_Dif1105.bak'
WITH RECOVERY;

SELECT * FROM Platos
---------------------------------------------

DECLARE @Nombre VARCHAR(50)='Juan';
DECLARE @Edad INT=35;
DECLARE @Opc INT=1;
IF @Opc=1 
	BEGIN
		PRINT 'Nombre: ' + @Nombre;
		PRINT 'Esto lo aprendí en la S09';
	END
ELSE
	PRINT CONCAT('Edad: ',@Edad);
--------------------------------------------
SELECT * FROM Platos;
--Ej2 --> 1:INSERT, 2:UPDATE, 3:DELETE
BEGIN
	DECLARE @opc INT;
	DECLARE @id INT;
	DECLARE @plato VARCHAR(80);
	SET @opc=3;
	SET @id=5; --Causa rellena
	SET @plato='Causa';
	IF @opc=1
		BEGIN 
			INSERT INTO Platos
			VALUES(6,'Pollo a la brasa','Pollito con papas',80);
			PRINT 'Plato registrado correctamente';
		END
	ELSE IF @opc=2
		BEGIN
			UPDATE Platos SET Nombre=@plato WHERE idPlato=@id;
			PRINT 'Nombre de plato actualizado';
		END
	ELSE 
		BEGIN
			DELETE FROM Platos WHERE idPlato=@id;
			PRINT 'Plato eliminado';
		END 
END







