Public Class Login
    Inherits System.Web.UI.Page
    Const Pagina As String = "~/Sistema/sisMenuPanel.aspx"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cookies.Remove("servidores")
        Response.Cookies.Remove("Usuario")
        Response.Cookies.Remove("IdEmpresa")
        Response.Cookies.Remove("Modulo")
        Response.Cookies.Remove("Login")
        Response.Cookies.Remove("Login")
        Response.Cookies.Remove("Contrato")
        Response.Cookies.Remove("Tema")
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Tema1"
    End Sub

    Protected Sub btn_Aceptar_Click(sender As Object, e As EventArgs) Handles btn_Aceptar.Click
        Try

            SqlConexion.connect("FepanConnectionString")
            Dim sql As String = String.Format("select *,pwdcompare('{1}',Password) as PwdOk from sis_Usuario where Usuario = '{0}'", txt_Usuario.Value, txt_Password.Value)
            Dim dtUsuario As DataTable = GetTable(sql)

            If dtUsuario.Rows(0).Item("PwdOk") Then
                Dim CooServidores As New HttpCookie("servidores")
                Dim CooUsuario As New HttpCookie("Usuario")
                Dim CooIdEmpresa As New HttpCookie("IdEmpresa")
                Dim CooModulo As New HttpCookie("Modulo")
                Dim CooLogin As New HttpCookie("Login")
                Dim CooTitulo As New HttpCookie("Titulo")
                Dim CooContrato As New HttpCookie("Contrato")
                Dim CooTema As New HttpCookie("Tema")

                CooServidores.Value = "FepanConnectionString1"
                CooUsuario.Value = txt_Usuario.Value
                CooIdEmpresa.Value = dtUsuario.Rows(0).Item("Id_Empresa_Default")
                CooModulo.Value = Pagina.ToString()
                CooLogin.Value = 0
                CooTitulo.Value = ""
                CooContrato.Value = dtUsuario.Rows(0).Item("Contrato_Empresa")
                CooTema.Value = "Moderno"

                Response.Cookies.Add(CooServidores)
                Response.Cookies.Add(CooUsuario)
                Response.Cookies.Add(CooIdEmpresa)
                Response.Cookies.Add(CooModulo)
                Response.Cookies.Add(CooLogin)
                Response.Cookies.Add(CooTitulo)
                Response.Cookies.Add(CooContrato)
                Response.Cookies.Add(CooTema)

                Response.Redirect(Pagina)

            Else
                lbl_Mensaje.Value = "Usuario y/o password no son correctos"
            End If
        Catch ex As Exception
            lbl_Mensaje.Value = "Usuario y/o password no son correctos"
        End Try
    End Sub

End Class