Public Class sis_FoliosVencidosAnular
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            dvMensajeS.Visible = False
            dvMensajeE.Visible = False
            Documentos()
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Protected Sub btn_Anular_Click(sender As Object, e As EventArgs)
        Try
            Dim empresa = Request("Id_Empresa")
            Dim tde = Request("Tipo_Dte")

            Dim sql As String = String.Format("select * into #tmp from fae_Folio_Electronico
                                                            where Fecha_Carga < dateadd(MONTH, -6, GETDATE()) 
                                                            and id_empresa = {0}
                                                            and Tipo_Dte = {1}

                                                            alter table #tmp add Id_Tipo_Documento int

                                                            update #tmp set Id_Tipo_Documento = b.Id_Tipo_Documento
                                                            from #tmp a inner join sis_Tipo_Documento b
	                                                            on a.Id_Empresa = b.Id_Empresa 
	                                                            and a.Tipo_Dte = b.Codigo_Electronico

                                                            select id_secuencia_numerica
	                                                            from sis_Secuencia_Numerica a 
	                                                            inner join #tmp b on a.Id_Empresa = b.Id_Empresa 
	                                                            and a.Id_Tipo_Documento = b.id_tipo_documento
	                                                            and a.Secuencia between b.Folio_Inicial and b.Folio_Final 
	                                                            and a.Estado = 1", empresa, tde)

            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)

            Dim dtFolios As DataTable = GetTable(sql)
            Dim idSecuencia As Int32
            For i As Integer = 0 To dtFolios.Rows.Count - 1
                idSecuencia = dtFolios.Rows(i).Item("id_secuencia_numerica")
                sql_FoliosVencidos.UpdateParameters("Id_Secuencia_numerica").DefaultValue = idSecuencia.ToString
                sql_FoliosVencidos.Update()
                sql_FoliosVencidos.DataBind()
            Next

            dvMensajeS.Visible = True
            lbl_Mensaje.Value = "Observación: Folios vencidos anulados correctamente"
            Documentos()
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub
    Private Sub Documentos()
        Try
            Dim empresa = Request("Id_Empresa")
            Dim tde = Request("Tipo_Dte")

            Dim sql As String = String.Format("select * into #tmp
                                            from fae_Folio_Electronico
                                            where Fecha_Carga < dateadd(MONTH, -6, GETDATE()) 
                                            and id_empresa = {0}
                                            and Tipo_Dte = {1}

                                            alter table #tmp add Id_Tipo_Documento int

                                            update #tmp set Id_Tipo_Documento = b.Id_Tipo_Documento
                                            from #tmp a inner join sis_Tipo_Documento b
	                                            on a.Id_Empresa = b.Id_Empresa 
	                                            and a.Tipo_Dte = b.Codigo_Electronico

                                            select b.Id_Empresa, b.Tipo_Dte , b.Folio_Inicial , b.Folio_Final, Secuencia , id_secuencia_numerica
	                                            from sis_Secuencia_Numerica a 
	                                            inner join #tmp b on a.Id_Empresa = b.Id_Empresa 
	                                            and a.Id_Tipo_Documento = b.id_tipo_documento
	                                            and a.Secuencia between b.Folio_Inicial and b.Folio_Final 
	                                            and a.Estado = 1", empresa, tde)

            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)
            Dim dtFolios As DataTable = GetTable(sql)
            grd_FoliosVencidos.DataSource = dtFolios
            grd_FoliosVencidos.DataBind()
        Catch ex As Exception
            dvMensajeE.Visible = True
            lbl_MensajeE.Value = ex.Message
        End Try
    End Sub

End Class