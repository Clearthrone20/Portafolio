Public Class sisLiberarImpresion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Limpiar()
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub ASPxCallbackPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback

        Dim Parametros() As String = e.Parameter.Split(";")

        Select Case Parametros(0)
            Case "consultar"
                ImprimirPdf()
            Case "eliminar"
                Eliminar()
        End Select
    End Sub

    Private Sub ImprimirPdf()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)

            Dim sql As String = String.Format("Select * from fae_Imprimir_PDF where Id_Empresa={0}", cmb_Empresa.Value)
            Dim dtImprimir As DataTable = GetTable(sql)

            If (dtImprimir.Rows.Count > 0) Then
                btn_Eliminar.Enabled = True
            Else
                btn_Eliminar.Enabled = False
            End If
            grd_Imprimir.DataSource = dtImprimir
            grd_Imprimir.DataBind()
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

    Private Sub Eliminar()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            sql_EliminarImpresion.ConnectionString = ConnectionString
            sql_EliminarImpresion.DataBind()
            sql_EliminarImpresion.DeleteParameters("Id_Empresa").DefaultValue = cmb_Empresa.Value
            sql_EliminarImpresion.Delete()

            dvMensajeS.Visible = True
            lbl_Mensaje.Value = "Observación: Impresiones borradas correctamente"
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

    Private Sub Limpiar()
        grd_Imprimir.DataSource = ""
        grd_Imprimir.DataBind()
        cmb_Empresa.SelectedIndex = 0
        btn_Eliminar.Enabled = False
    End Sub

End Class