Imports System.Data.SqlClient

Public Class MerchantSignUp
    Inherits System.Web.UI.Page
    Dim cmd As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGetNem_Click(sender As Object, e As EventArgs) Handles btnGetNem.Click
        cmd.CommandText = "Select max(convert(int,merchantid))+1 from merchantmst"
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        Dim obj As Object = cmd.ExecuteScalar()
        If obj Is DBNull.Value Then
            txtMID.Text = "3001"
        Else
            txtMID.Text = obj.ToString()
        End If
        CommonProperty.cn.Close()
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "insert into MerchantMst values(" + txtMID.Text + ",'" + txtMName.Text + "','" _
                           + txtPass.Text + "','" + txtAdd.Text + "','" + txtCity.Text + "'," + txtCNo.Text + "," _
                           + txtCNo.Text + ",'" + txtEmailID.Text + "'," + txtRating.Text + ")"
        Try
            If cmd.ExecuteNonQuery() Then
                Response.Redirect("MerchantLogin", False)
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = True
                searchMessage.Visible = False
            End If
        Catch ex As Exception
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            errorMessage.Visible = True
            searchMessage.Visible = False
        End Try
        cmd = Nothing
        CommonProperty.cn.Close()
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "Update MerchantMst set MerchantName='" + txtMName.Text + "',Password='" + txtPass.Text + "',Address='" _
                           + txtAdd.Text + "',city='" + txtCity.Text + "',contactNo=" + txtCNo.Text + ",MobileNo=" + txtCNo.Text _
                           + ",EmailID='" + txtEmailID.Text + "',rating=" + txtRating.Text + " where MerchantID='" + txtMID.Text + "'"
        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = False
                updateSuccess.Visible = True
                errorMessage.Visible = False
                searchMessage.Visible = False
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = True
                errorMessage.Visible = False
                searchMessage.Visible = False
            End If
        Catch ex As Exception

        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "Select * from MerchantMst where MerchantID=" + txtSearch.Text + ""
        Dim da As SqlDataReader
        Try
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                txtMID.Text = da(0)
                txtMName.Text = da(1)
                txtPass.Text = da(2)
                txtAdd.Text = da(3)
                txtCity.Text = da(4)
                txtCNo.Text = da(5)
                txtEmailID.Text = da(7)
                txtRating.Text = da(8)
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = False
                searchMessage.Visible = True
            End If
        Catch ex1 As Exception

        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub
End Class