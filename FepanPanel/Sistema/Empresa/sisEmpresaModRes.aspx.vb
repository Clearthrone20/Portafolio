Public Class sisEmpresaModRes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Limpiar()
            Empresa(Request("Id_Empresa"))
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Protected Sub btn_Grabar_Resolucion_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            sql_ModResolucionEmpresa.ConnectionString = ConnectionString

            sql_ModResolucionEmpresa.UpdateParameters("Numero_Resolucion").DefaultValue = txt_NResolucion.Value
            sql_ModResolucionEmpresa.UpdateParameters("Fecha_Resolucion").DefaultValue = txt_FechaResolucion.Value
            sql_ModResolucionEmpresa.UpdateParameters("Id_Empresa").DefaultValue = Request("Id_Empresa")
            sql_ModResolucionEmpresa.Update()
            sql_ModResolucionEmpresa.DataBind()

            dvMensajeS.Visible = True
            lbl_Mensaje.Value = "Observación: Resolución de empresa modificada correctamente"

        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

    Private Sub Empresa(ByVal idEmp As Int32)
        Try
            Dim sql As String = String.Format("SELECT * FROM sis_Empresa Where Id_Empresa={0}", idEmp)
            Dim Servidor As String = Request.Cookies("servidores").Value
            SqlConexion.connect(Servidor)
            Dim dtEmpresa As DataTable = GetTable(sql)

            txt_FechaResolucion.Value = dtEmpresa.Rows(0).Item("Fecha_Resolucion")
            txt_NResolucion.Value = dtEmpresa.Rows(0).Item("Numero_Resolucion")

        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

    Private Sub Limpiar()
        txt_FechaResolucion.Value = ""
        txt_NResolucion.Value = ""
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False
    End Sub
End Class