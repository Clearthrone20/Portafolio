Imports DevExpress.Web
Public Class fae_FolioEmpresas

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub Actualizar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_fae_FolioEmpresas.ConnectionString = ConnectionString
            sql_fae_FolioEmpresas.SelectParameters("Cantidad").DefaultValue = txt_Cantidad.Value
            sql_fae_FolioEmpresas.DataBind()
            grd_fae_FolioEmpresas.DataBind()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub grd_fae_FolioEmpresas_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles grd_fae_FolioEmpresas.CustomCallback
        Actualizar()
    End Sub

    Private Sub grd_fae_FolioEmpresas_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grd_fae_FolioEmpresas.AfterPerformCallback
        Actualizar()
    End Sub
End Class