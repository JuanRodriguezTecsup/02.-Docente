Attribute VB_Name = "modConsultasSQL"
Sub ConsultaBasica()

'1. Consulta en SQL
gSQL = "SELECT * FROM Platos"

'2. Preparar cadena de conexión a SQL Server
Call modConexion.ConectarSQL

'3. Ejecutar mi consulta SQL y abrir conexión por primera vez
Call gRs.Open(gSQL, gCnx, adOpenForwardOnly, adLockReadOnly)

'4. Mostrar el id y el nombre del primer plato

If Not (gRs.EOF) Then
    MsgBox "El plato es: " & gRs.Fields(1) & "/ precio: " & gRs.Fields(3)
End If

'5. Cerramos conexion
Call modConexion.CerrarSQL
End Sub
