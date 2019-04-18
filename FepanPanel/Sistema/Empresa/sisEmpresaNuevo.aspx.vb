Public Class sisEmpresaNuevo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Limpiar()
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Protected Sub btn_GrabarI_Click(sender As Object, e As EventArgs)
        Try
            sql_Empresa.InsertParameters("Codigo").DefaultValue = txt_CodigoI.Value
            sql_Empresa.InsertParameters("Descripcion").DefaultValue = txt_DescripcionI.Value
            sql_Empresa.InsertParameters("Codigo_Actividad").DefaultValue = txt_ActividadI.Value
            sql_Empresa.InsertParameters("Giro").DefaultValue = txt_GiroI.Value
            sql_Empresa.InsertParameters("Numero_Resolucion").DefaultValue = txt_ResolucionI.Value
            sql_Empresa.InsertParameters("Fecha_Resolucion").DefaultValue = txt_FechaResolucionI.Value
            sql_Empresa.InsertParameters("Direccion").DefaultValue = txt_DireccionI.Value
            sql_Empresa.InsertParameters("Comuna").DefaultValue = txt_ComunaI.Value
            sql_Empresa.InsertParameters("Ciudad").DefaultValue = txtCiudadI.Value
            sql_Empresa.Insert()
            sql_Empresa.DataBind()

            dvMensajeS.Visible = True
            lbl_Mensaje.Value = "Observación: Empresa ingresada correctamente"
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub
    Private Sub Limpiar()
        txtCiudadI.Value = ""
        txt_ActividadI.Value = ""
        txt_CodigoI.Value = ""
        txt_ComunaI.Value = ""
        txt_DescripcionI.Value = ""
        txt_DireccionI.Value = ""
        txt_FechaResolucionI.Value = ""
        txt_GiroI.Value = ""
        txt_ResolucionI.Value = ""
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False
    End Sub
End Class