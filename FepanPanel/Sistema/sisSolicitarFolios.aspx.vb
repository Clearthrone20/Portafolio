Imports DevExpress.Web
Imports DevExpress.Web.Data

Public Class sisSolicitarFolios

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub grid_Detalle_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid_Detalle.AfterPerformCallback
        Actualizar()
    End Sub

    Private Sub Actualizar()
        Dim Servidor As String = Request.Cookies("servidores").Value
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
        sql_Solicitar_Folios.ConnectionString = ConnectionString
        sql_Solicitar_Folios.SelectParameters("Tipo_Dte").DefaultValue = cmb_TipoDocumento.Value

        grid_Detalle.DataBind()
    End Sub

End Class