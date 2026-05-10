Attribute VB_Name = "modConsultasSQL"
Sub ConsultarFilas()

'1. Consulta en SQL
gSQL = "SELECT * FROM Platos"

'2. Preparar cadena de conexión a SQL Server
Call modConexion.ConectarSQL

'3. Ejecutar mi consulta SQL y abrir conexión por primera vez
Call gRs.Open(gSQL, gCnx, adOpenForwardOnly, adLockReadOnly)

''4. Mostrar el id y el nombre del primer plato
If Not (gRs.EOF) Then
    MsgBox "El plato es: " & gRs.Fields(1) & "/ precio: " & gRs.Fields(3)
End If

'5. Cerramos conexion
Call modConexion.CerrarSQL
End Sub

Sub EliminarFilas()

'1. Consulta en SQL
gSQL = "DELETE FROM Platos WHERE idPlato=2"

'2. Preparar cadena de conexión a SQL Server
Call modConexion.ConectarSQL

'3. Ejecutar mi consulta SQL y abrir conexión por primera vez
Call gRs.Open(gSQL, gCnx, adOpenForwardOnly, adLockOptimistic)

'5. Cerramos conexion
Call modConexion.CerrarSQL
End Sub

Sub ListarPlatos()
'1. Consulta SQL
gSQL = "SELECT Nombre,Precio FROM Platos"

'2. Preparar cadena conexion
Call modConexion.ConectarSQL

'3. Ejecutar consulta SQL
Call gRs.Open(gSQL, gCnx, adOpenForwardOnly, adLockReadOnly)
End Sub

Sub TruncarTabla()

'1. Consulta en SQL
gSQL = "TRUNCATE TABLE Platos"

'2. Preparar cadena de conexión a SQL Server
Call modConexion.ConectarSQL

'3. Ejecutar mi consulta SQL y abrir conexión por primera vez
Call gRs.Open(gSQL, gCnx, adOpenForwardOnly, adLockOptimistic)

MsgBox "La tabla ha sido truncada!", vbInformation

'4. Cerramos conexion
Call modConexion.CerrarSQL
End Sub
