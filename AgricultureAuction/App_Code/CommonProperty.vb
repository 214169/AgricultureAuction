Imports System.Data.SqlClient

Public Class CommonProperty
    Public Shared cn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Auction.mdf;Integrated Security=True;User Instance=True")
    Public Shared reqid As String
    Public Shared proName As String
    Public Shared proQua As String
    Public Shared aucno As String
End Class
