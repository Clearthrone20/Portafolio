Imports System.Data.SqlClient

Public Class sis_Morosos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Limpiar()
        End If
    End Sub

    Private Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Page.Theme = "Moderno"
    End Sub

    Protected Sub btn_Consultar_Click(sender As Object, e As EventArgs)
        Limpiar()
        Dim Servidor As String = Request.Cookies("servidores").Value
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString
        sql_Morosos.ConnectionString = ConnectionString
        grd_Morosos.DataSourceID = "sql_Morosos"
        grd_Morosos.DataBind()
    End Sub

    Protected Sub btn_Morosos_Click(sender As Object, e As EventArgs)
        Try
            Dim Servidor As String = Request.Cookies("servidores").Value
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings(Servidor).ConnectionString

            Dim conn As SqlConnection = New SqlConnection(ConnectionString)
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("cob_Actualiza_Morosos", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.ExecuteNonQuery()

            Limpiar()

            dvMensajeS.Style.Add("display", "block")
            lbl_Mensaje.Value = "Procedimiento de morosos, ejecutado correctamente"
        Catch ex As Exception
            dvMensajeE.Style.Add("display", "block")
            lbl_MensajeE.Value = ex.ToString
        End Try

    End Sub
    Private Sub Limpiar()
        dvMensajeS.Style.Add("display", "none")
        dvMensajeE.Style.Add("display", "none")
        lbl_Mensaje.Value = ""
        lbl_MensajeE.Value = ""
        grd_Morosos.DataSourceID = ""
        grd_Morosos.DataBind()
    End Sub
End Class