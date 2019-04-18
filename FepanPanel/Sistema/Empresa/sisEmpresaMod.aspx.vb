Public Class sisEmpresaMod
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

    Protected Sub btn_Grabar_Empresa_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            sql_ModEmpresa.ConnectionString = ConnectionString

            sql_ModEmpresa.UpdateParameters("Codigo").DefaultValue = txt_Codigo.Value
            sql_ModEmpresa.UpdateParameters("Descripcion").DefaultValue = txt_Descripcion.Value
            sql_ModEmpresa.UpdateParameters("Codigo_Actividad").DefaultValue = txt_Actividad.Value
            sql_ModEmpresa.UpdateParameters("Giro").DefaultValue = txt_Giro.Value
            sql_ModEmpresa.UpdateParameters("Id_Empresa").DefaultValue = Request("Id_Empresa")
            sql_ModEmpresa.Update()
            sql_ModEmpresa.DataBind()

            dvMensajeS.Visible = True
            lbl_Mensaje.Value = "Observación: Empresa modificada correctamente"

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

            txt_Descripcion.Value = dtEmpresa.Rows(0).Item("Descripcion")
            txt_Actividad.Value = dtEmpresa.Rows(0).Item("Codigo_Actividad")
            txt_Codigo.Value = dtEmpresa.Rows(0).Item("Codigo")
            txt_Giro.Value = dtEmpresa.Rows(0).Item("Giro")
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

    Private Sub Limpiar()
        txt_Actividad.Value = ""
        txt_Codigo.Value = ""
        txt_Descripcion.Value = ""
        txt_Giro.Value = ""
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False
    End Sub
End Class