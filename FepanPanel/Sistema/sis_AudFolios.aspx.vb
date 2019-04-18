Imports DevExpress.Web
Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.Linq
Imports Microsoft.Reporting.WebForms
Public Class sis_AudFolios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ASPxFormLayout1.FindItemOrGroupByName("txtTotal").Visible = False
            ASPxFormLayout1.FindItemOrGroupByName("txtCliente").Visible = False
            Actualizar_Empresas()
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

            MsgBox(ex.Message)

        End Try
    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs)
        Try

            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)
            Dim empresa = cmb_Empresa.Value
            Dim folio = txt_Folio.Value
            Dim sql As String = String.Format("Select Razon_Social_Receptor,Monto_Total from fae_Documento where Id_Empresa={0} and Folio={1}", empresa, folio)
            Dim dtDocumento As DataTable = GetTable(sql)

            ASPxFormLayout1.FindItemOrGroupByName("txtTotal").Visible = True
            ASPxFormLayout1.FindItemOrGroupByName("txtCliente").Visible = True
            txt_Receptor.Value = dtDocumento.Rows(0).Item("Razon_Social_Receptor")
            txt_Total.Value = dtDocumento.Rows(0).Item("Monto_Total")

            sql_AudFolios.ConnectionString = ConnectionString
            sql_AudFolios.SelectParameters("Id_Empresa").DefaultValue = empresa
            sql_AudFolios.SelectParameters("Tipo_dte").DefaultValue = cmb_tipoDte.Value
            sql_AudFolios.SelectParameters("Folio").DefaultValue = folio
            sql_AudFolios.DataBind()
            grd_AudFolios.DataSourceID = "sql_AudFolios"
            grd_AudFolios.DataBind()

        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Protected Sub btn_Excel_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)
            Dim empresa = cmb_Empresa.Value
            Dim folio = txt_Folio.Value
            Dim sql As String = String.Format("select b.*,a.Monto_Total, a.Razon_Social_Receptor from fae_Documento a
                                                inner join aud_Documento b on a.Id_Documento=b.Id_Documento
                                                Where b.Id_Empresa={0} and b.Folio={1} and a.Tipo_dte={2}", empresa, folio, cmb_tipoDte.Value)
            Dim dtDocumento As DataTable = GetTable(sql)
            Dim doc = dtDocumento.Rows.Count
            Dim ArchivoPdf As String = "reporte.xls"

            Dim viewer As New Microsoft.Reporting.WebForms.LocalReport
            viewer.ReportPath = MapPath("~/Sistema/Aud_Folios.rdlc")
            viewer.DataSources.Clear()

            Dim rptDataDocumento As New ReportDataSource("Documentos", dtDocumento)
            rptDataDocumento.Name = "Documentos"
            rptDataDocumento.Value = dtDocumento
            viewer.DataSources.Add(rptDataDocumento)

            Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
            Dim pdfContent As Byte() = viewer.Render("Excel", Nothing, Nothing, Nothing, Nothing, Nothing, Nothing)

            Response.Buffer = True
            Response.ContentType = "application/xls"
            Response.AddHeader("content-disposition", "inline;filename=AudFolios.xls")

            Response.BinaryWrite(pdfContent)
            Response.Flush()
            Response.Clear()

        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub
End Class