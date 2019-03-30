Imports System.Data.SqlClient

Public Class MerchantLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnMerchantLogin_Click(sender As Object, e As EventArgs) Handles btnMerchantLogin.Click
        Dim cmd As New SqlCommand("Select password, merchantname from merchantmst where merchantid=@merchantid", CommonProperty.cn)

        cmd.Parameters.AddWithValue("@merchantid", txtMID.Text)
        Try
            CommonProperty.cn.Open()
            Dim da As SqlDataReader
            da = cmd.ExecuteReader()

            If da.HasRows Then
                da.Read()
                If da(0) = txtPWD.Text Then
                    Session("mid") = txtMID.Text
                    Session("username") = da(1)
                    Response.Redirect("AuctionDetail.aspx", False)
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

    Protected Sub btnMerchantSignup_Click(sender As Object, e As EventArgs) Handles btnMerchantSignup.Click
        Response.Redirect("MerchantSignUp.aspx")
    End Sub
End Class