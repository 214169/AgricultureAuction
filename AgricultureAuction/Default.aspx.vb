Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSignUp_Click(sender As Object, e As EventArgs) Handles btnSignUp.Click
        Dim cmd As New SqlCommand("Select password from usermst where userid='" + txtUID.Text + "'", CommonProperty.cn)
        Try
            CommonProperty.cn.Open()
            Dim da As SqlDataReader
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                If da(0) = txtPWD.Text Then
                    Session("username") = txtUID.Text
                    Session("admin") = True
                    Response.Redirect("AddAuction", False)
                Else
                    LblErrMsg.Visible = True
                    LblErrMsg.Text = "Invalid Credentials!"
                End If
            Else
                LblErrMsg.Visible = True
                LblErrMsg.Text = "Invalid Credentials!"
            End If

            CommonProperty.cn.Close()
        Catch ex As Exception
            CommonProperty.cn.Close()
        End Try
    End Sub
End Class