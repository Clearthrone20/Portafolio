﻿Imports DevExpress.Web
Public Class sisLiberarGuias

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            dvMensajeS.Visible = False
            dvMensajeE.Visible = False
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

    Private Sub ASPxCallbackPanel1_Callback(sender As Object, e As CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback
        If e.Parameter = "Liberar" Then
            Liberar()
        Else
            Actualizar_Empresas()
        End If
    End Sub

    Private Sub Liberar()
        Try

            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
            SqlConexion.connect(Servidor)

            Dim IdEmpresa = cmb_Empresa.Value

            Dim sql As String = String.Format("select Id_Tipo_Documento,Descripcion from sis_Tipo_Documento
                                            where Id_Empresa = {0} and Codigo_Electronico = '{1}'", IdEmpresa, 33)

            Dim dtTipoDocumento As DataTable = GetTable(sql)
            Dim IdTipoDocumento As Int32 = dtTipoDocumento.Rows(0).Item("Id_Tipo_Documento")

            sql = String.Format("select Id_Transaccion,Id_Cliente, Total, Id_Cliente_Direccion, Fecha  from vta_Transaccion where Id_Empresa = {0} and Id_Tipo_Documento = {1} and Numero = {2}", IdEmpresa, IdTipoDocumento, txt_Guia.Value)
            Dim dtTransaccion As DataTable = GetTable(sql)

            If (dtTransaccion.Rows.Count > 0) Then

                Limpiar()

                Dim trans = dtTransaccion.Rows(0).Item("Id_Transaccion")
                Dim idCli = dtTransaccion.Rows(0).Item("Id_Cliente")
                Dim IdCliDir = dtTransaccion.Rows(0).Item("Id_Cliente_Direccion")

                If IdCliDir = 0 Then
                    txt_Direccion.Value = "PRINCIPAL"
                Else
                    sql = String.Format("Select Codigo from vta_Cliente_Direccion where Id_Cliente_Direccion = {0}", IdCliDir)
                    Dim dtDireccion As DataTable = GetTable(sql)
                    txt_Direccion.Value = dtDireccion.Rows(0).Item("Codigo")
                End If

                Dim dt As DateTime = Convert.ToDateTime(dtTransaccion.Rows(0).Item("Fecha"))
                Dim str As String = dt.ToString("dd-MM-yyyy")
                txt_Fecha.Value = str
                txt_Total.Value = dtTransaccion.Rows(0).Item("Total")

                sql = String.Format("select Descripcion from vta_Cliente where Id_Cliente = {0}", idCli)

                Dim dtCliente As DataTable = GetTable(sql)
                Dim cli = dtCliente.Rows(0).Item("Descripcion")
                txt_Cliente.Value = cli.ToString


                sql = String.Format("select Estado_Documento from fae_Documento where Id_Empresa = {0} and Tipo_Operacion = 'VENTA' and Tipo_Dte = {1} and Folio = {2}", IdEmpresa, 33, txt_Guia.Value)
                Dim dtEstadoDocumento As DataTable = GetTable(sql)
                Dim estDoc = dtEstadoDocumento.Rows(0).Item("Estado_Documento")

                Select Case estDoc.ToString
                    Case 1
                        txt_EstadoFactura.Value = "Pendiente"
                    Case 2
                        txt_EstadoFactura.Value = "Firmado"
                    Case 3
                        txt_EstadoFactura.Value = "Enviado"
                    Case 4
                        txt_EstadoFactura.Value = "Aceptado"
                    Case 5
                        txt_EstadoFactura.Value = "Aceptado con Reparo"
                    Case 6
                        txt_EstadoFactura.Value = "Rechazado"
                    Case 7
                        txt_EstadoFactura.Value = "Anulado"
                End Select

                sql_LiberarGuias.ConnectionString = ConnectionString

                grd_LiberarGuias.DataSourceID = "sql_LiberarGuias"
                sql_LiberarGuias.SelectParameters("Id_Factura").DefaultValue = trans.ToString

                sql_LiberarGuias.DataBind()
                grd_LiberarGuias.DataBind()
                Dim filas As Int16 = grd_LiberarGuias.VisibleRowCount

                If estDoc <> 4 And estDoc <> 5 Then
                    lbl_MensajeE.Text = "Observación: Documento no aceptado en el SII"
                    If estDoc = 7 Then
                        lbl_MensajeE.Text = "Observación: Factura ya anulada"
                    End If
                    dvMensajeE.Visible = True

                Else
                    If filas = 0 Then
                        lbl_MensajeE.Text = "Factura sin guias asociadas"
                        dvMensajeE.Visible = True

                    Else
                        lbl_Mensaje.Text = "Observación: Documento puede ser liberado"
                        dvMensajeE.Visible = False
                        txt_Guia.Enabled = False
                        cmb_Empresa.Enabled = False
                        btn_Cancelar.Enabled = True
                        dvMensajeS.Visible = True
                        btn_Liberar.Enabled = True

                    End If

                End If
            Else
                Limpiar()
                lbl_MensajeE.Text = "Observación: Error factura no existe en venta!"
                dvMensajeE.Visible = True
            End If


        Catch ex As Exception
            lbl_MensajeE.Text = ex.Message
            dvMensajeE.Visible = True
        End Try
    End Sub

    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        Limpiar()
    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs)
        Liberar()
    End Sub

    Protected Sub btn_Liberar_Click(sender As Object, e As EventArgs)

        Dim Servidor As String = Request.Cookies("servidores").Value
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
        SqlConexion.connect(Servidor)

        Dim IdEmpresa As Int32 = cmb_Empresa.Value
        Dim guia = txt_Guia.Value
        Dim sql As String = String.Format("select Id_Tipo_Documento,Descripcion from sis_Tipo_Documento
                                            where Id_Empresa = {0} and Codigo_Electronico = '{1}'", IdEmpresa, 33)
        Dim dtTipoDocumento As DataTable = GetTable(sql)

        sql = String.Format("select Id_Transaccion,Id_Cliente, Total, Id_Cliente_Direccion, Fecha  from vta_Transaccion where Id_Empresa = {0} and Id_Tipo_Documento = {1} and Numero = {2}", IdEmpresa, dtTipoDocumento.Rows(0).Item("Id_Tipo_Documento"), guia)
        Dim dtDocumentoVentas As DataTable = GetTable(sql)

        sql_LiberarGuias.ConnectionString = ConnectionString

        grd_LiberarGuias.DataSourceID = "sql_LiberarGuias"
        sql_LiberarGuias.UpdateParameters("Id_Factura").DefaultValue = dtDocumentoVentas.Rows(0).Item("Id_Transaccion")
        sql_LiberarGuias.Update()
        sql_LiberarGuias.DataBind()

        Dim usuario = Request.Cookies("Usuario").Value
        Dim fechaE = DateTime.Now
        Dim motivo = "Libera Guia SII"

        sql = String.Format("select Id_Documento, Id_Empresa, Fecha_Emision, Rut_Receptor, Razon_Social_Receptor, Monto_Total  from fae_Documento where Folio={0} and Tipo_Dte={1}", guia, 33)
        Dim dtDocumento As DataTable = GetTable(sql)

        sql_audDocumento.ConnectionString = ConnectionString

        sql_audDocumento.InsertParameters("Id_Empresa").DefaultValue = dtDocumento.Rows(0).Item("Id_Empresa")
        sql_audDocumento.InsertParameters("Usuario").DefaultValue = usuario
        sql_audDocumento.InsertParameters("Tipo_dte").DefaultValue = 33
        sql_audDocumento.InsertParameters("Folio").DefaultValue = guia
        sql_audDocumento.InsertParameters("Fecha_Emision").DefaultValue = dtDocumento.Rows(0).Item("Fecha_Emision")
        sql_audDocumento.InsertParameters("Rut_Receptor").DefaultValue = dtDocumento.Rows(0).Item("Rut_Receptor")
        sql_audDocumento.InsertParameters("Razon_Social_Receptor").DefaultValue = dtDocumento.Rows(0).Item("Razon_Social_Receptor")
        sql_audDocumento.InsertParameters("Monto_Total").DefaultValue = dtDocumento.Rows(0).Item("Monto_Total")
        sql_audDocumento.InsertParameters("Fecha_Eliminacion").DefaultValue = fechaE
        sql_audDocumento.InsertParameters("Motivo").DefaultValue = motivo
        sql_audDocumento.Insert()

        Limpiar()
        dvMensajeS.Visible = True
        lbl_Mensaje.Value = "Observación: Documento liberado correctamente"
        txt_Guia.Value = ""
        cmb_Empresa.SelectedIndex = 0

    End Sub

    Private Sub Limpiar()
        grd_LiberarGuias.DataSourceID = String.Empty
        grd_LiberarGuias.DataBind()
        txt_Cliente.Value = ""
        txt_Fecha.Value = ""
        txt_Total.Value = ""
        txt_EstadoFactura.Value = ""
        txt_Direccion.Value = ""
        dvMensajeE.Visible = False
        dvMensajeS.Visible = False
        btn_Cancelar.Enabled = False
        btn_Liberar.Enabled = False
        txt_Guia.Enabled = True
        cmb_Empresa.Enabled = True
    End Sub
End Class