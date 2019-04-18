Imports System.Web.DynamicData

Partial Class Menu
    Inherits System.Web.DynamicData.FieldTemplateUserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        servidores()
    End Sub

    Private Sub servidores()
        Try

            Dim serv = Request.Cookies("servidores").Value

            Select Case serv
                Case "FepanConnectionString1"
                    cmb_Servidores.SelectedIndex = 0
                Case "FepanConnectionString1"
                    cmb_Servidores.SelectedIndex = 1
                Case "FepanConnectionString2"
                    cmb_Servidores.SelectedIndex = 2
                Case "FepanConnectionString3"
                    cmb_Servidores.SelectedIndex = 3
            End Select

        Catch ex As Exception

            MsgBox(ex.Message)

        End Try


    End Sub
End Class
