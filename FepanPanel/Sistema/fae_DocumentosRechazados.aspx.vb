Imports DevExpress.Web
Public Class fae_DocumentosRechazados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Actualizar_Empresa()
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub Actualizar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_DocumentosRechazados.ConnectionString = ConnectionString
            sql_DocumentosRechazados.SelectParameters("Id_Empresa").DefaultValue = cmb_Empresa.Value
            sql_DocumentosRechazados.SelectParameters("Observacion").DefaultValue = "TODOS"
            sql_DocumentosRechazados.DataBind()
            grd_DocumentosRechazados.DataBind()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub grd_DocumentosRechazados_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grd_DocumentosRechazados.AfterPerformCallback
        Actualizar()
    End Sub

    Private Sub grd_DocumentosRechazados_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles grd_DocumentosRechazados.CustomCallback
        Actualizar()
    End Sub

    Private Sub Actualizar_Empresa()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Empresas.ConnectionString = ConnectionString
            sql_Empresas.DataBind()
            cmb_Empresa.DataBind()
            cmb_Empresa.SelectedIndex = 0
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Protected Sub btn_Consultar_Click1(sender As Object, e As EventArgs)
        Actualizar()
    End Sub
End Class