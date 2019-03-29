Imports System.Data.SqlClient

Public Class FarmerSignup
    Inherits System.Web.UI.Page
    Dim cmd As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "insert into FarmerMst values('" + txtFID.Text + "','" + txtFName.Text + "','" _
                           + txtPass.Text + "','" + txtAdd.Text + "','" + txtCity.Text + "'," + txtCNo.Text + "," + txtCNo.Text + ",'" _
                           + txtEmailID.Text + "'," + txtRating.Text + ")"
        Try
            If cmd.ExecuteNonQuery() Then
                Response.Redirect("FarmerLogin.aspx", False)
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
        cmd.CommandText = "Update farmerMst set FarmerName='" + txtFName.Text + "',Password='" _
                           + txtPass.Text + "',Address='" + txtAdd.Text + "',city='" + txtCity.Text + "',contactNo=" _
                           + txtCNo.Text + ",EmailID='" + txtEmailID.Text + "',rating=" _
                           + txtRating.Text + " where FarmerID='" + txtFID.Text + "'"
        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = False
                updateSuccess.Visible = True
                errorMessage.Visible = False
                searchMessage.Visible = False
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
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub

    Protected Sub btnGetNem_Click(sender As Object, e As EventArgs) Handles btnGetNem.Click
        cmd.CommandText = "Select max(convert(int,farmerid))+1 from farmermst"
        cmd.Connection = CommonProperty.cn
        cmd.Connection.Open()
        Dim obj As Object = cmd.ExecuteScalar()
        cmd.Connection.Close()
        If obj Is DBNull.Value Then
            txtFID.Text = "2001"
        Else
            txtFID.Text = obj.ToString()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        RegularExpressionValidator1.Enabled = False
        RangeValidator1.Enabled = False
        cmd.CommandText = "Select * from FarmerMst where FarmerID=" + txtSearch.Text + ""
        Dim da As SqlDataReader
        Try
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                txtFID.Text = da(0)
                txtFName.Text = da(1)
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