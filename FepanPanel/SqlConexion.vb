Imports System.Data.SqlClient

Module SqlConexion
    Public Ok As String
    Public ConnectionString As String

    Public Function connect(ByVal servidor As String)
        ConnectionString = ConfigurationManager.ConnectionStrings(servidor).ConnectionString
    End Function


    Public Function GetTable(ByVal Sql As String) As DataTable
        Using connection As New SqlConnection(ConnectionString)
            connection.Open()
            Try
                Dim cmdSql As New SqlCommand
                cmdSql.CommandType = CommandType.Text
                cmdSql.Connection = connection
                cmdSql.CommandText = Sql

                Dim sqlAdapter As SqlDataAdapter = New SqlDataAdapter(cmdSql)
                Dim sqlDataSet As New DataSet

                sqlAdapter.Fill(sqlDataSet, "datos")
                GetTable = sqlDataSet.Tables(0)

                sqlDataSet.Dispose()
                sqlAdapter.Dispose()
                cmdSql.Dispose()

                Ok = ""
            Catch ex As Exception
                GetTable = Nothing
                Ok = ex.Message
            End Try
        End Using
    End Function

    Public Sub ExecuteSql(ByVal Sql As String)
        Using connection As New SqlConnection(ConnectionString)
            connection.Open()
            Try
                Dim cmdSql As New SqlCommand
                cmdSql.CommandType = CommandType.Text
                cmdSql.Connection = connection
                cmdSql.CommandText = Sql
                cmdSql.ExecuteNonQuery()
                cmdSql.Dispose()

                Ok = ""
            Catch ex As Exception
                Ok = ex.Message
            End Try
        End Using
    End Sub
End Module
