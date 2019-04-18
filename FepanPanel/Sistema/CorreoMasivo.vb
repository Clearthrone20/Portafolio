Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Windows.Forms
Imports System.Net
Imports System.Net.Mail

Public Class CorreoMasivo

    Public cnZ1, cnZ2, cnZ3 As SqlConnection
    Public cmdZ1, cmdZ2, cmdZ3 As SqlCommand
    Public drZ1, drZ2, drZ3 As SqlDataReader
    Private correos As New MailMessage
    Private envios As New SmtpClient
    Sub New()
        Try
            cnZ1 = New SqlConnection("Data Source=fepan.dyndns.org;Initial Catalog=Z1_FEPAN;User ID=fepan;Password=fepan")
            cnZ2 = New SqlConnection("Data Source=200.6.122.54;Initial Catalog=z2_Fepan;User ID=fepan;Password=fepan")
            cnZ3 = New SqlConnection("Data Source=fepan.dyndns.org;Initial Catalog=Z3_FEPAN;User ID=fepan;Password=fepan")

            cnZ1.Open()
            cnZ2.Open()
            cnZ3.Open()

        Catch ex As Exception
            MessageBox.Show("Error en la conexion debido a: " + ex.ToString)
        End Try
    End Sub

    Sub EnviarCorreoMasivo(ByVal emisor As String, ByVal password As String, ByVal mensaje As String, ByVal asunto As String, ByVal ruta As String)
        Try
            cmdZ1 = New SqlCommand
        Catch ex As Exception

        End Try
    End Sub

    Sub enviarCorreo(ByVal emisor As String, ByVal password As String, ByVal mensaje As String, ByVal asunto As String, ByVal destinatario As String, ByVal ruta As String)
        Try
            correos.To.Clear()
            correos.Body = ""
            correos.Subject = ""
            correos.Body = mensaje
            correos.Subject = asunto
            correos.IsBodyHtml = True
            correos.To.Add(Trim(destinatario))

            If ruta <> "" Then
                Dim archivo As Net.Mail.Attachment = New Net.Mail.Attachment(ruta)
                correos.Attachments.Add(archivo)
            End If

            correos.From = New MailAddress(emisor)
            envios.Credentials = New NetworkCredential(emisor, password)

            'Datos importantes no modificables para tener acceso a las cuentas

            envios.Host = "smtp.gmail.com"
            envios.Port = 587
            envios.EnableSsl = True

            envios.Send(correos)
            MsgBox("El mensaje fue enviado correctamente. ", MsgBoxStyle.Information, "Mensaje")

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Mensajeria 1.0 vb.net ®", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

End Class
