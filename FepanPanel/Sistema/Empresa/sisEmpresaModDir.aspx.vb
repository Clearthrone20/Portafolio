Public Class sisEmpresaModDir
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

    Protected Sub btn_Grabar_Direccion_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            sql_ModDireccionEmpresa.ConnectionString = ConnectionString

            sql_ModDireccionEmpresa.UpdateParameters("Direccion").DefaultValue = txt_Direccion.Value
            sql_ModDireccionEmpresa.UpdateParameters("Comuna").DefaultValue = txt_Comuna.Value
            sql_ModDireccionEmpresa.UpdateParameters("Ciudad").DefaultValue = txt_Ciudad.Value
            sql_ModDireccionEmpresa.UpdateParameters("Id_Empresa").DefaultValue = Request("Id_Empresa")
            sql_ModDireccionEmpresa.Update()
            sql_ModDireccionEmpresa.DataBind()

            dvMensajeS.Visible = True
            lbl_Mensaje.Value = "Observación: Dirección de empresa modificada correctamente"

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

            txt_Direccion.Value = dtEmpresa.Rows(0).Item("Direccion")
            txt_Comuna.Value = dtEmpresa.Rows(0).Item("Comuna")
            txt_Ciudad.Value = dtEmpresa.Rows(0).Item("Ciudad")

        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

    Private Sub Limpiar()
        txt_Ciudad.Value = ""
        txt_Comuna.Value = ""
        txt_Direccion.Value = ""
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False
    End Sub
End Class