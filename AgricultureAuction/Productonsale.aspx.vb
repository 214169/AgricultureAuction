Imports System.Data.SqlClient

Public Class Productonsale
    Inherits System.Web.UI.Page
    Dim cmd As New SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            txtReqID.Text = CommonProperty.reqid
            txtProName.Text = CommonProperty.proName
            txtProQuality.Text = CommonProperty.proQua
        End If

        insertSuccess.Visible = False
        updateSuccess.Visible = False
        errorMessage.Visible = False
        searchMessage.Visible = False
        deleteMessage.Visible = False
    End Sub

    Protected Sub btnGetNo_Click(sender As Object, e As EventArgs) Handles btnGetNo.Click
        cmd.CommandText = "Select max(convert(int,pro_on_sale_no))+1 from pro_on_sale_mst"
        cmd.Connection = CommonProperty.cn
        cmd.Connection.Open()
        Dim obj As Object = cmd.ExecuteScalar()
        cmd.Connection.Close()
        If obj Is DBNull.Value Then
            txtProOnSaleNo.Text = "2001"
        Else
            txtProOnSaleNo.Text = obj.ToString()
        End If
        txtReqID.Text = CommonProperty.reqid
        txtProName.Text = CommonProperty.proName
        txtProQuality.Text = CommonProperty.proQua
        txtProDate.Text = Date.Now.Date
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "insert into pro_on_sale_Mst values('" + txtProOnSaleNo.Text + "','" + txtProName.Text + "','" + txtProQuality.Text + "','" + txtProDate.Text + "','" + txtReqID.Text + "','" + txtRating.Text + "')"
        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = True
                updateSuccess.Visible = False
                errorMessage.Visible = False
                searchMessage.Visible = False
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = True
                searchMessage.Visible = False
            End If
        Catch ex As Exception
            CommonProperty.cn.Close()
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
        Try
            cmd.CommandText = "Update pro_on_sale_Mst set pro_name= '" + txtProName.Text + "',pro_quality='" + txtProQuality.Text + "',Pro_date='" + txtProDate.Text + "',req_ID='" + txtReqID.Text + "',rating='" + txtRating.Text + "' where pro_on_sale_no='" + txtProOnSaleNo.Text + "'"
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = False
                updateSuccess.Visible = True
                errorMessage.Visible = False
                searchMessage.Visible = False
                deleteMessage.Visible = False
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = True
                searchMessage.Visible = False
                deleteMessage.Visible = False
            End If
        Catch ex As Exception
            CommonProperty.cn.Close()
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            errorMessage.Visible = True
            searchMessage.Visible = False
            deleteMessage.Visible = False
        End Try
        CommonProperty.cn.Close()
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "delete from pro_on_sale_Mst where pro_on_sale_no=" + txtProOnSaleNo.Text + ""
        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = False
                searchMessage.Visible = False
                deleteMessage.Visible = True
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = True
                searchMessage.Visible = False
                deleteMessage.Visible = False
            End If
        Catch ex As Exception
            CommonProperty.cn.Close()
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            errorMessage.Visible = True
            searchMessage.Visible = False
            deleteMessage.Visible = False
        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "Select * from pro_on_sale_Mst where pro_on_sale_no=" + txtSearch.Text + ""
        Dim da As SqlDataReader
        Try
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                txtProOnSaleNo.Text = da(0)
                txtProName.Text = da(1)
                txtProQuality.Text = da(2)
                txtProDate.Text = da(3)
                txtReqID.Text = da(4)
                txtRating.Text = da(5)
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = False
                searchMessage.Visible = True
                deleteMessage.Visible = False
            End If
        Catch ex As Exception
            CommonProperty.cn.Close()
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            errorMessage.Visible = True
            searchMessage.Visible = False
            deleteMessage.Visible = False
        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub
End Class