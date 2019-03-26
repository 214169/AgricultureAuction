Imports System.Data.SqlClient

Public Class MerchantLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnMerchantLogin_Click(sender As Object, e As EventArgs) Handles btnMerchantLogin.Click
        Dim cmd As New SqlCommand("Select password from merchantmst where merchantid=@merchantid", CommonProperty.cn)

        cmd.Parameters.AddWithValue("@merchantid", txtMID.Text)
        Try
            CommonProperty.cn.Open()
            Dim obj As Object = cmd.ExecuteScalar()
            If obj Is Nothing Then
                LblErrMsg.Visible = True
                LblErrMsg.Text = "Merchantname is wrong "
            Else
                If obj.ToString() = txtPWD.Text Then
                    Session("mid") = txtMID.Text
                    Response.Redirect("AuctionDetail.aspx")
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