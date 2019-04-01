Imports System.Data.SqlClient

Public Class FarmerLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnFarmerLogin_Click(sender As Object, e As EventArgs) Handles btnFarmerLogin.Click
        Dim cmd As New SqlCommand("Select password, farmername from farmermst where farmerid=@farmerid", CommonProperty.cn)
        cmd.Parameters.AddWithValue("@farmerid", txtFID.Text)
        Try
            CommonProperty.cn.Open()
            Dim da As SqlDataReader
            da = cmd.ExecuteReader()

            If da.HasRows Then
                da.Read()
                If da(0) = txtPWD.Text Then
                    Session("fid") = txtFID.Text
                    Session("username") = da(1)
                    Response.Redirect("SaleRequest", False)
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

    Protected Sub btnFarmerSignup_Click(sender As Object, e As EventArgs) Handles btnFarmerSignup.Click
        Response.Redirect("FarmerSignUp")
    End Sub
End Class