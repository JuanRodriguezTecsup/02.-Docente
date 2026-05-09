Attribute VB_Name = "modConexion"
Option Explicit

Sub ConectarSQL()
'------------------
'CADENA DE CONEXION
'------------------
gCnx = "Provider=MSOLEDBSQL;Server=(localdb)\MSSQLLocalDB;" & _
       "Database=Restaurante;Trusted_Connection=Yes;"
'------------------
Set gRs = New ADODB.Recordset
Exit Sub
error_handler:
     MsgBox Err.Description, vbCritical
End Sub

Sub NuevoSQL()
If gRs.State = adStateOpen Then gRs.Close 'Cerrar RecordSet
End Sub

Sub CerrarSQL()
If Not gRs Is Nothing Then
   If gRs.State = adStateOpen Then gRs.Close ' -- close
   Set gRs = Nothing
End If
End Sub


