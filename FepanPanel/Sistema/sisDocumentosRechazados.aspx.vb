Imports DevExpress.Web

Public Class sisDocumentosRechazados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Actualizar()
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub Actualizar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Empresa2.ConnectionString = ConnectionString
            sql_Empresa2.DataBind()
            sql_Observacion.ConnectionString = ConnectionString
            sql_Observacion.DataBind()
            cmb_Observacion.DataBind()
            cmb_Observacion.SelectedIndex = cmb_Observacion.Items.Count - 1
            cmb_Empresa.DataBind()
            cmb_Empresa.SelectedIndex = 0
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub Actualizar2()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Detalle.ConnectionString = ConnectionString
            sql_Detalle.SelectParameters("Observacion").DefaultValue = cmb_Observacion.Value
            sql_Detalle.DataBind()
            grid_Detalle.DataSource = sql_Detalle
            grid_Detalle.DataBind()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub


    Private Sub grid_Detalle_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid_Detalle.AfterPerformCallback
        Actualizar2()
    End Sub

    Private Sub grid_Detalle_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles grid_Detalle.CustomCallback
        Actualizar2()
    End Sub

    Private Sub ASPxCallbackPanel1_Callback(sender As Object, e As CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback
        If e.Parameter = "Actualizar" Then
            Actualizar()
        End If
    End Sub

End Class