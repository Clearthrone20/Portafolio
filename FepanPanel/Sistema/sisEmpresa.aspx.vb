Imports DevExpress.Web
Imports DevExpress.Web.Data
Public Class sisEmpresa
    Inherits System.Web.UI.Page
    Dim CooEmpresaMod As New HttpCookie("EmpresaMod")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim item1 = ASPxRibbon1.Tabs(0).Groups.FindByName("rbng_Nuevo")
            Dim servidor As String = Request.Cookies("servidores").Value
            If (servidor).Equals("FepanConnectionString2") Or (servidor).Equals("FepanConnectionString1") Then
                item1.Visible = True
            Else
                item1.Visible = False
            End If
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub Actualizar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Empresa.ConnectionString = ConnectionString
            sql_Empresa.DataBind()
            grd_Empresa.DataBind()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub grid_Detalle_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grd_Empresa.AfterPerformCallback
        Actualizar()
    End Sub

    Private Sub grid_Detalle_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles grd_Empresa.CustomCallback
        Actualizar()
    End Sub

    Private Sub ASPxCallbackPanel1_Callback(sender As Object, e As CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback
        Actualizar()
    End Sub

    Private Sub grd_Detalle_RowUpdating(sender As Object, e As ASPxDataUpdatingEventArgs) Handles grd_Empresa.RowUpdating
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Empresa.ConnectionString = ConnectionString
            sql_Empresa.DataBind()
            sql_Empresa.UpdateParameters("Descripcion").DefaultValue = e.NewValues.Item("Descripcion").ToString()
            sql_Empresa.UpdateParameters("Codigo").DefaultValue = e.NewValues.Item("Codigo").ToString()
            sql_Empresa.UpdateParameters("Direccion").DefaultValue = e.NewValues.Item("Direccion").ToString()
            sql_Empresa.UpdateParameters("Id_Empresa").DefaultValue = e.NewValues.Item("Id_Empresa").ToString()
            sql_Empresa.Update()
            e.Cancel = True
            Actualizar()

        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub grd_Detalle_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles grd_Empresa.RowInserting
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Empresa.ConnectionString = ConnectionString
            sql_Empresa.DataBind()
            sql_Empresa.InsertParameters("Usuario").DefaultValue = e.NewValues.Item("Usuario").ToString()
            sql_Empresa.Insert()
            e.Cancel = True
            Actualizar()


        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Protected Sub btn_Grabar_Empresa_Click(sender As Object, e As EventArgs)
        Try
            Dim Empresa = grd_Empresa.GetSelectedFieldValues("Id_Empresa")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btn_Grabar_Direccion_Click(sender As Object, e As EventArgs)
        Try
            Dim Empresa = grd_Empresa.GetSelectedFieldValues("Id_Empresa")
            MsgBox(Empresa(0).ToString)
        Catch ex As Exception
            'dvMensajeE_Direccion.Visible = True
            'lbl_MensajeE_Direccion.Value = ex.Message
        End Try
    End Sub

    Protected Sub btn_Grabar_Resolucion_Click(sender As Object, e As EventArgs)
        Try
            Dim Empresa = grd_Empresa.GetSelectedFieldValues("Id_Empresa")

        Catch ex As Exception
            'dvMensajeE_Resolucion.Visible = True
            'lbl_MensajeE_Resolucion.Value = ex.Message
        End Try
    End Sub

    Protected Sub btn_GrabarI_Click(sender As Object, e As EventArgs)
        Try

        Catch ex As Exception

        End Try
    End Sub
    Private Sub Empresa()

    End Sub


End Class