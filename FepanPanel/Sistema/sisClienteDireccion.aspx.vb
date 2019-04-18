Imports DevExpress.Web
Public Class sisClienteDireccion
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

    Private Sub Modificar()
        Try

            Dim Servidor As String = Request.Cookies("servidores").Value
            SqlConexion.connect(Servidor)

            Dim IdEmpresa As Int32 = cmb_Empresa.Value
            Dim codElectronico As Int32 = 52
            Dim guia As Int32 = txt_Folio.Value

            Dim sql As String = String.Format("select Id_Tipo_Documento,Descripcion from sis_Tipo_Documento
                                            where Id_Empresa = {0} and Codigo_Electronico = '{1}'", IdEmpresa, codElectronico)
            Dim dtTipoDocumento As DataTable = GetTable(sql)
            Dim IdTipoDocumento As Int32 = dtTipoDocumento.Rows(0).Item("Id_Tipo_Documento")

            sql = String.Format("select Id_Cliente, Id_Cliente_Direccion from vta_Transaccion where Id_Empresa = {0}  and Id_Tipo_Documento = {1} and Numero = {2}", IdEmpresa, IdTipoDocumento, guia)
            Dim dtTransaccion As DataTable = GetTable(sql)

            If (dtTransaccion.Rows.Count > 0) Then

                Dim idCli = dtTransaccion.Rows(0).Item("Id_Cliente")
                sql = String.Format("select Id_Cliente,Descripcion from vta_Cliente where Id_Cliente = {0}", idCli)
                Dim dtCliente As DataTable = GetTable(sql)
                txt_Cliente.Value = dtCliente.Rows(0).Item("Descripcion")

                Dim IdCliDir = dtTransaccion.Rows(0).Item("Id_Cliente_Direccion")
                If IdCliDir = 0 Then
                    txt_Direccion.Value = "PRINCIPAL"
                Else
                    sql = String.Format("Select Codigo from vta_Cliente_Direccion where Id_Cliente_Direccion = {0}", IdCliDir)
                    Dim dtDireccion As DataTable = GetTable(sql)
                    txt_Direccion.Value = dtDireccion.Rows(0).Item("Codigo")
                End If

                sql = String.Format("select 0 as Id_cliente_DIreccion, 'PRINCIPAL' as Codigo union select Id_Cliente_Direccion, codigo from vta_Cliente_Direccion where Id_Cliente = {0}", idCli)
                Dim dtCliDireccion As DataTable = GetTable(sql)
                cmb_nuevaDireccion.DataSource = dtCliDireccion
                cmb_nuevaDireccion.DataBind()

                txt_Folio.Enabled = False
                cmb_Empresa.Enabled = False
                btn_CambiarDireccion.Enabled = True
                btn_Cancelar.Enabled = True
                cmb_nuevaDireccion.Enabled = True
            Else
                lbl_MensajeE.Text = "Observación: Error no se ha encontrado el documento"
                dvMensajeE.Visible = True
            End If
        Catch ex As Exception
            lbl_MensajeE.Text = "Observación: Error no se ha encontrado el documento"
            dvMensajeE.Visible = True
        End Try
    End Sub

    Private Sub Limpiar()
        txt_Cliente.Value = ""
        txt_Direccion.Value = ""
        dvMensajeS.Visible = False
        dvMensajeE.Visible = False
        btn_CambiarDireccion.Enabled = False
        btn_Cancelar.Enabled = False
        cmb_nuevaDireccion.Enabled = False
        cmb_Empresa.Enabled = True
        txt_Folio.Enabled = True
        cmb_nuevaDireccion.DataSource = ""
        cmb_nuevaDireccion.DataBind()
        cmb_nuevaDireccion.SelectedIndex = 0
    End Sub

    Protected Sub btn_CambiarDireccion_Click(sender As Object, e As EventArgs)

        Dim Servidor As String = Request.Cookies("servidores").Value
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
        SqlConexion.connect(Servidor)

        Dim IdEmpresa As Int32 = cmb_Empresa.Value
        Dim codElectronico As Int32 = 52
        Dim guia As Int32 = txt_Folio.Value

        Dim sql As String = String.Format("select Id_Tipo_Documento,Descripcion from sis_Tipo_Documento
                                            where Id_Empresa = {0} and Codigo_Electronico = '{1}'", IdEmpresa, codElectronico)
        Dim dtTipoDocumento As DataTable = GetTable(sql)
        Dim IdTipoDocumento As Int32 = dtTipoDocumento.Rows(0).Item("Id_Tipo_Documento")

        sql = String.Format("select Id_Cliente, Id_Cliente_Direccion from vta_Transaccion where Id_Empresa = {0}  and Id_Tipo_Documento = {1} and Numero = {2}", IdEmpresa, IdTipoDocumento, guia)
        Dim dtTransaccion As DataTable = GetTable(sql)

        sql_DireccionTransaccion.ConnectionString = ConnectionString

        sql_DireccionTransaccion.UpdateParameters("Id_Cliente_Direccion").DefaultValue = cmb_nuevaDireccion.Value
        sql_DireccionTransaccion.UpdateParameters("Id_Empresa").DefaultValue = IdEmpresa
        sql_DireccionTransaccion.UpdateParameters("Id_Tipo_Documento").DefaultValue = IdTipoDocumento
        sql_DireccionTransaccion.UpdateParameters("Numero").DefaultValue = guia
        sql_DireccionTransaccion.Update()

        lbl_Mensaje.Text = "Observación: Documento modificado correctamente"
        dvMensajeS.Visible = True
        cmb_Empresa.SelectedIndex = 0
        txt_Folio.Value = ""

    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs) Handles btn_Consultar.Click

        Modificar()

    End Sub

    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        cmb_Empresa.Enabled = True
        txt_Folio.Enabled = True
        dvMensajeS.Visible = False
        dvMensajeE.Visible = False
        btn_CambiarDireccion.Enabled = False
        btn_Cancelar.Enabled = False
        cmb_nuevaDireccion.Enabled = False
    End Sub
End Class