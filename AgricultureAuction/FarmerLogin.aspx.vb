Imports System.Data.SqlClient

Public Class FarmerLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnFarmerLogin_Click(sender As Object, e As EventArgs) Handles btnFarmerLogin.Click
        Dim cmd As New SqlCommand("Select password from farmermst where farmerid=@farmerid", CommonProperty.cn)
        cmd.Parameters.AddWithValue("@farmerid", txtFID.Text)
        Try
            CommonProperty.cn.Open()
            Dim obj As Object = cmd.ExecuteScalar()
            If obj Is Nothing Then
                LblErrMsg.Visible = True
                LblErrMsg.Text = "Farmername is wrong "
            Else
                If obj.ToString() = txtPWD.Text Then
                    Session("fid") = txtFID.Text
                    Response.Redirect("salerqu.aspx")
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