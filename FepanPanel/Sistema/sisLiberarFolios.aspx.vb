Imports DevExpress.Web
Public Class sisLiberarFolios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            dvMensajeS.Visible = False
            dvMensajeE.Visible = False
            Actualizar_Empresas()
            txt_Fecha.Date = DateTime.Today
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Private Sub Actualizar_Empresas()
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            sql_Empresa.ConnectionString = ConnectionString
            cmb_Empresa.DataBind()
            cmb_Empresa.SelectedIndex = 0
        Catch ex As Exception

            lbl_MensajeE.Value = ex.Message
            dvMensajeE.Visible = True

        End Try
    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs)
        Try

            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            sql_LiberarFolios.ConnectionString = ConnectionString

            Dim dt As DateTime = Convert.ToDateTime(txt_Fecha.Value)

            sql_LiberarFolios.SelectParameters("Tipo_Dte").DefaultValue = cmb_tipoDte.Value
            sql_LiberarFolios.SelectParameters("Actualizar").DefaultValue = 1
            sql_LiberarFolios.SelectParameters("Fecha").DefaultValue = dt.ToString("dd-MM-yyyy")
            sql_LiberarFolios.SelectParameters("Id_Empresa2").DefaultValue = cmb_Empresa.Value
            grd_FoliosLiberados.DataSource = sql_LiberarFolios
            sql_LiberarFolios.DataBind()
            grd_FoliosLiberados.DataBind()
            If grd_FoliosLiberados.VisibleRowCount > 0 Then
                lbl_Mensaje.Text = "Observación: Folios liberados correctamente"
                dvMensajeS.Visible = True
            Else
                lbl_MensajeE.Text = "Observación: No se han encontrado Folios para liberar"
                dvMensajeE.Visible = True
            End If


        Catch ex As Exception
            lbl_MensajeE.Value = ex.Message
            dvMensajeE.Visible = True
        End Try

    End Sub

    Private Sub Limpiar()
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False
        cmb_Empresa.SelectedIndex = 0
        cmb_tipoDte.SelectedIndex = 0
        txt_Fecha.Date = DateTime.Today
    End Sub

End Class