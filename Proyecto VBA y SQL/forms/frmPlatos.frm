VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmPlatos 
   Caption         =   "GESTION DE PLATOS"
   ClientHeight    =   4500
   ClientLeft      =   108
   ClientTop       =   456
   ClientWidth     =   13128
   OleObjectBlob   =   "frmPlatos.frx":0000
   StartUpPosition =   1  'Centrar en propietario
End
Attribute VB_Name = "frmPlatos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ActualizarLista()
Dim f As Integer

Call modConsultasSQL.ListarPlatos 'Se conecta a SQL y ejecuta SELECT

'2. Insertar los items en ListBox
f = 0
While Not (gRs.EOF)
    lstPlatos.AddItem
    lstPlatos.List(f, 0) = gRs.Fields(0) 'Nombre
    lstPlatos.List(f, 1) = gRs.Fields(1) 'Precio
    f = f + 1
    gRs.MoveNext
Wend

'3. Cierro la conexion
Call modConexion.CerrarSQL
End Sub

Private Sub cmdVolver_Click()
Unload Me
frmMenu.Show
End Sub

Private Sub UserForm_Activate()
'Este evento se dispara cuando aparece el form en pantalla

With lstPlatos 'Configurar el ListBox con 2 columnas
    .ColumnCount = 2
    .ColumnWidths = "185;80" ' Ajusta el ancho de cada columna
End With
    
Call ActualizarLista
End Sub

