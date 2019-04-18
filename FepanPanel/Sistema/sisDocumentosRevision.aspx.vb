Imports DevExpress.Web
Public Class sisDocumentosRevision

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub Actualizar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim Estado As Integer = cmb_Estado.Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Detalle.ConnectionString = ConnectionString
            sql_Detalle.SelectParameters("Id_Empresa").DefaultValue = 0
            sql_Detalle.SelectParameters("Estado").DefaultValue = Estado
            sql_Detalle.DataBind()
            grid_Detalle.DataBind()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub


    Private Sub grid_Detalle_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid_Detalle.AfterPerformCallback
        Actualizar()
    End Sub

    Private Sub grid_Detalle_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles grid_Detalle.CustomCallback
        Actualizar()
    End Sub

    Protected Sub btn_Excel_Click(sender As Object, e As EventArgs) Handles btn_Excel.Click
        Actualizar()
        gridExport.WriteXlsToResponse("Pendientes.xls")
    End Sub
End Class