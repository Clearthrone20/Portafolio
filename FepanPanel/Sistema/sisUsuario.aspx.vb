﻿Imports DevExpress.Web
Imports DevExpress.Web.Data
Public Class sisUsuario

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        paneles()
        If Not IsPostBack Then
            ASPxHiddenField1.Add("cpId", "0")
            Actualizar()

        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    'Metodo para actualizar la conexion de servidor del gridview 
    Private Sub Actualizar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            sql_Usuario.ConnectionString = ConnectionString
            sql_Usuario.DataBind()

            grd_Detalle.DataBind()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub grd_Detalle_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grd_Detalle.AfterPerformCallback
        Actualizar()
    End Sub

    Private Sub grd_Detalle_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles grd_Detalle.CustomCallback
        Actualizar()
    End Sub

    ''Metodo de editar 1 registro del gridview
    Private Sub grd_Detalle_RowUpdating(sender As Object, e As ASPxDataUpdatingEventArgs) Handles grd_Detalle.RowUpdating
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Usuario.ConnectionString = ConnectionString
            sql_Usuario.DataBind()
            grd_Detalle.DataSource = sql_Usuario
            sql_Usuario.UpdateParameters("Usuario").DefaultValue = e.NewValues.Item("Usuario").ToString()
            sql_Usuario.UpdateParameters("Descripcion").DefaultValue = e.NewValues.Item("Descripcion").ToString()
            sql_Usuario.UpdateParameters("Tipo").DefaultValue = e.NewValues.Item("Tipo").ToString()
            sql_Usuario.UpdateParameters("Id_Empresa_Default").DefaultValue = e.NewValues.Item("Id_Empresa_Default").ToString()
            sql_Usuario.UpdateParameters("Pagina").DefaultValue = e.NewValues.Item("Pagina").ToString()
            sql_Usuario.UpdateParameters("Id_Usuario").DefaultValue = e.Keys.Item("Id_Usuario").ToString()
            sql_Usuario.Update()
            e.Cancel = True
            Actualizar()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    ''Metodo de insertar 1 registro en el gridview
    Private Sub grd_Detalle_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles grd_Detalle.RowInserting
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Usuario.ConnectionString = ConnectionString
            sql_Usuario.DataBind()
            grd_Detalle.DataSource = sql_Usuario
            sql_Usuario.InsertParameters("Usuario").DefaultValue = e.NewValues.Item("Usuario").ToString()
            sql_Usuario.InsertParameters("Descripcion").DefaultValue = e.NewValues.Item("Descripcion").ToString()
            sql_Usuario.InsertParameters("Tipo").DefaultValue = e.NewValues.Item("Tipo").ToString()
            sql_Usuario.InsertParameters("Id_Empresa_Default").DefaultValue = e.NewValues.Item("Id_Empresa_Default").ToString()
            sql_Usuario.InsertParameters("Pagina").DefaultValue = e.NewValues.Item("Pagina").ToString()
            sql_Usuario.Insert()
            e.Cancel = True
            Actualizar()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    ''Metodo de elimiar 1 registro del gridview
    Private Sub grd_Detalle_RowDeleting(sender As Object, e As ASPxDataDeletingEventArgs) Handles grd_Detalle.RowDeleting
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_Usuario.ConnectionString = ConnectionString
            sql_Usuario.DataBind()
            grd_Detalle.DataSource = sql_Usuario
            sql_Usuario.DeleteParameters("Id_Usuario").DefaultValue = e.Keys.Item("Id_Usuario").ToString()
            sql_Usuario.Delete()
            e.Cancel = True
            Actualizar()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    'Metodo de Callback Cambio de Password
    Private Sub ASPxCallbackPanelCambioPassword_Callback(sender As Object, e As CallbackEventArgsBase) Handles ASPxCallbackPanelCambioPassword.Callback
        'Dim Parametros() As String = e.Parameter.Split(";")
        'Select Case Parametros(0)
        '    Case "CambioPass"
        '        ASPxHiddenField1("cpId") = Parametros(1)
        '        AsignarSoporte()
        '    Case "Limpiar"
        '        Limpiar()
        'End Select
    End Sub

    'Private Sub grid_Detalle_CustomButtonCallback(sender As Object, e As ASPxGridViewCustomButtonCallbackEventArgs) Handles grd_Detalle.CustomButtonCallback
    '    Dim Servidor As String = cmb_Servidor.Value
    '    Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
    '    sql_Usuario.ConnectionString = ConnectionString
    '    sql_Usuario.DataBind()
    '    grd_Detalle.DataSource = sql_Usuario
    '    sql_Password.UpdateParameters("Id_Usuario").DefaultValue =
    '    sql_Password.UpdateParameters("Password").DefaultValue =
    '    sql_Usuario.Update()
    '    Actualizar()
    'End Sub

    'Metodo para cambiar Password a un usuario
    Private Sub CamioPassword()
        Try
            Dim Password As String = txt_Password.Value
            sql_Password.UpdateParameters("Id_Usuario").DefaultValue = ASPxHiddenField1("cpId")
            'sql_Password.UpdateParameters("Responsable").DefaultValue = Responsable
            sql_Password.Update()
            'lbl_MensajeAsignar.Visible = True
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Protected Sub btn_CambioPass_Click(sender As Object, e As EventArgs)
        Try

            Dim user = grd_Detalle.GetSelectedFieldValues("Id_Usuario")

            If user.Count > 0 Then
                lbl_ErrorCambioContraseña.Visible = False
                panelUsuario.Style.Add("display", "none")
                panelCambiarContraseña.Style.Add("display", "block")
                Datos(user(0).ToString)
            Else
                Actualizar()
                lbl_ErrorCambioContraseña.Visible = True
            End If

        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub
    Private Sub Datos(ByVal idUsuario As Int16)
        Try
            Dim sql As String = String.Format("SELECT * FROM sis_Usuario Where Id_Usuario={0}", idUsuario)

            Dim Servidor As String = Request.Cookies("servidores").Value
            SqlConexion.connect(Servidor)

            Dim dtUsuario As DataTable = GetTable(sql)
            Dim user = dtUsuario.Rows(0).Item("Usuario")
            Dim descripcion = dtUsuario.Rows(0).Item("Descripcion")

            txt_Mail.Value = descripcion.ToString

            txt_Usuario.Value = user.ToString
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try

    End Sub

    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        paneles()
        Limpiar()
        lbl_Mensaje.Visible = False
    End Sub

    Protected Sub paneles()
        panelUsuario.Style.Add("display", "block")
        panelCambiarContraseña.Style.Add("display", "none")
    End Sub

    Private Sub Limpiar()
        txt_Password.Value = ""
        txt_Mail.Value = ""
        txt_Usuario.Value = ""
    End Sub
End Class