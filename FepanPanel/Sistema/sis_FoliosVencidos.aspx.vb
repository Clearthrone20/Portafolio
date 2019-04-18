Imports DevExpress.Web
Public Class sis_FoliosVencidos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            dvMensajeS.Visible = False
            dvMensajeE.Visible = False
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_FoliosVencidos.ConnectionString = ConnectionString
            grd_FoliosVencidos.DataSource = sql_FoliosVencidos
            grd_FoliosVencidos.DataBind()
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub
End Class