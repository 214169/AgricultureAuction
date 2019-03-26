Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSignUp_Click(sender As Object, e As EventArgs) Handles btnSignUp.Click
        Dim cmd As New SqlCommand("Select password from usermst where userid='" + txtUID.Text + "'", CommonProperty.cn)
        Try
            CommonProperty.cn.Open()
            Dim obj As Object = cmd.ExecuteScalar()
            If obj Is Nothing Then
                LblErrMsg.Visible = True
                LblErrMsg.Text = "Username is wrong "
            Else
                If obj.ToString() = txtPWD.Text Then
                    Response.Redirect("auction.aspx", True)
                Else
                    LblErrMsg.Visible = True
                    LblErrMsg.Text = "Password is wrong!!!"
                End If
            End If
            CommonProperty.cn.Close()
        Catch ex As Exception
            CommonProperty.cn.Close()
        End Try
    End Sub
End Class