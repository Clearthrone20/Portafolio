Imports DevExpress.Web

Public Class sis_CorrigeTotales
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
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

    Private Sub Consultar()

    End Sub

    Private Sub Limpiar()

        cmb_Empresa.Enabled = True
        txt_Factura.Enabled = True
        txt_Cliente.ReadOnly = True
        txt_Afecto.Enabled = False
        txt_Iva.Enabled = False
        txt_Total.Enabled = False
        btn_Cancelar.Enabled = False
        btn_Grabar.Enabled = False
        txt_Cliente.Value = ""
        txt_Afecto.Value = ""
        txt_Iva.Value = ""
        txt_Total.Value = ""
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False

    End Sub

    Protected Sub btn_Grabar_Click(sender As Object, e As EventArgs)
        Dim Servidor As String = Request.Cookies("servidores").Value
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
        SqlConexion.connect(Servidor)

        Dim afecto As Int32 = txt_Afecto.Value
        Dim iva As Int32 = txt_Iva.Value
        Dim total As Int32 = txt_Total.Value
        Dim factura As Int32 = txt_Factura.Value
        Dim empresa As Int32 = cmb_Empresa.Value

        Dim sql As String = String.Format("select Id_Tipo_Documento,Descripcion from sis_Tipo_Documento
                                            where Id_Empresa = {0} and Codigo_Electronico = '{1}'", empresa, 33)
        Dim dtTipoDocumento As DataTable = GetTable(sql)

        sql_Transaccion.ConnectionString = ConnectionString

        sql_Transaccion.UpdateParameters("Afecto").DefaultValue = afecto
        sql_Transaccion.UpdateParameters("Impuesto").DefaultValue = iva
        sql_Transaccion.UpdateParameters("Total").DefaultValue = total
        sql_Transaccion.UpdateParameters("Id_Empresa").DefaultValue = empresa
        sql_Transaccion.UpdateParameters("Id_Tipo_Documento").DefaultValue = dtTipoDocumento.Rows(0).Item("Id_Tipo_Documento")
        sql_Transaccion.UpdateParameters("Numero").DefaultValue = factura
        sql_Transaccion.Update()

        sql_Documento.ConnectionString = ConnectionString

        sql_Documento.UpdateParameters("Monto_Afecto").DefaultValue = afecto
        sql_Documento.UpdateParameters("Monto_Iva").DefaultValue = iva
        sql_Documento.UpdateParameters("Monto_Total").DefaultValue = total
        sql_Documento.UpdateParameters("Id_Empresa").DefaultValue = empresa
        sql_Documento.UpdateParameters("Folio").DefaultValue = factura
        sql_Documento.Update()

        Dim usuario = Request.Cookies("Usuario").Value
        Dim fechaE = DateTime.Now
        Dim motivo = "Corrige Montos"

        sql = String.Format("select Id_Documento, Id_Empresa, Fecha_Emision, Rut_Receptor, Razon_Social_Receptor, Monto_Total  from fae_Documento where Folio={0} and Tipo_Dte={1}", factura, 33)
        Dim dtDocumento As DataTable = GetTable(sql)

        sql_audDocumento.ConnectionString = ConnectionString

        sql_audDocumento.InsertParameters("Id_Empresa").DefaultValue = dtDocumento.Rows(0).Item("Id_Empresa")
        sql_audDocumento.InsertParameters("Usuario").DefaultValue = usuario
        sql_audDocumento.InsertParameters("Tipo_dte").DefaultValue = 33
        sql_audDocumento.InsertParameters("Folio").DefaultValue = factura
        sql_audDocumento.InsertParameters("Fecha_Emision").DefaultValue = dtDocumento.Rows(0).Item("Fecha_Emision")
        sql_audDocumento.InsertParameters("Rut_Receptor").DefaultValue = dtDocumento.Rows(0).Item("Rut_Receptor")
        sql_audDocumento.InsertParameters("Razon_Social_Receptor").DefaultValue = dtDocumento.Rows(0).Item("Razon_Social_Receptor")
        sql_audDocumento.InsertParameters("Monto_Total").DefaultValue = dtDocumento.Rows(0).Item("Monto_Total")
        sql_audDocumento.InsertParameters("Fecha_Eliminacion").DefaultValue = fechaE
        sql_audDocumento.InsertParameters("Motivo").DefaultValue = motivo
        sql_audDocumento.Insert()

        Limpiar()
        txt_Factura.Value = ""
        cmb_Empresa.SelectedIndex = 0
        dvMensajeS.Visible = True
        lbl_Mensaje.Value = "Observación: Factura modificada correctamente"


    End Sub

    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        Limpiar()
    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)

            Dim factura As Int32 = txt_Factura.Text
            Dim IdEmpresa As Int32 = cmb_Empresa.Value

            Dim sql As String = String.Format("select Id_Tipo_Documento,Descripcion from sis_Tipo_Documento
                                            where Id_Empresa = {0} and Codigo_Electronico = '{1}'", IdEmpresa, 33)
            Dim dtTipoDocumento As DataTable = GetTable(sql)
            Dim IdTipoDocumento As Int32 = dtTipoDocumento.Rows(0).Item("Id_Tipo_Documento")

            sql = String.Format("select Id_Cliente, Afecto, Impuesto ,Total from vta_Transaccion where Id_Empresa = {0} and Id_Tipo_Documento = {1} and Numero = {2}", IdEmpresa, IdTipoDocumento, factura)
            Dim dtTransaccion As DataTable = GetTable(sql)

            If (dtTransaccion.Rows.Count > 0) Then
                Limpiar()

                Dim idCli = dtTransaccion.Rows(0).Item("Id_Cliente")

                txt_Afecto.Value = dtTransaccion.Rows(0).Item("Afecto")
                txt_Afecto.Enabled = True
                txt_Iva.Value = dtTransaccion.Rows(0).Item("Impuesto")
                txt_Iva.Enabled = True
                txt_Total.Value = dtTransaccion.Rows(0).Item("Total")
                txt_Total.Enabled = True

                sql = String.Format("select Descripcion from vta_Cliente where Id_Cliente = {0}", idCli)
                Dim dtCliente As DataTable = GetTable(sql)
                txt_Cliente.Value = dtCliente.Rows(0).Item("Descripcion")

                btn_Cancelar.Enabled = True
                btn_Grabar.Enabled = True
                cmb_Empresa.Enabled = False
                txt_Factura.Enabled = False

            Else
                Limpiar()
                lbl_MensajeE.Text = "Observación: Error documento de factura no existe!"
                dvMensajeE.Visible = True
            End If

        Catch ex As Exception
            lbl_MensajeE.Value = ex.Message
            dvMensajeE.Visible = True
        End Try
    End Sub
End Class