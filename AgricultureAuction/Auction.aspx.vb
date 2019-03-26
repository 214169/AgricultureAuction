Imports System.Data.SqlClient

Public Class Auction
    Inherits System.Web.UI.Page

    Dim cmd As New SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGetNem_Click(sender As Object, e As EventArgs) Handles btnGetNem.Click
        cmd.CommandText = "Select max(convert(int,Auc_no))+1 from Auction_mst"
        cmd.Connection = CommonProperty.cn
        cmd.Connection.Open()
        Dim obj As Object = cmd.ExecuteScalar()
        cmd.Connection.Close()
        If obj Is DBNull.Value Then
            txtAucNo.Text = "6001"
        Else
            txtAucNo.Text = obj.ToString()
        End If
    End Sub

    Protected Sub btnIns_Click(sender As Object, e As EventArgs) Handles btnIns.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "insert into Auction_Mst values(@auc_no,@pro_on_sale_no,@pro_name, @price
                                ,@st_date,@ed_date,@condition, @Description)"

        cmd.Parameters.AddWithValue("@auc_no", txtAucNo.Text)
        cmd.Parameters.AddWithValue("@pro_on_sale_no", txtProOnSaleNo.Text)
        cmd.Parameters.AddWithValue("@pro_name", txtProName.Text)
        cmd.Parameters.AddWithValue("@price", txtPrice.Text)
        cmd.Parameters.AddWithValue("@st_date", txtStDate.Text)
        cmd.Parameters.AddWithValue("@ed_date", txtEdDate.Text)
        cmd.Parameters.AddWithValue("@condition", txtCond.Text)
        cmd.Parameters.AddWithValue("@Description", txtDesc.Text)

        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = True
                updateSuccess.Visible = False
                deleteSuccess.Visible = False
                searchMessage.Visible = False
            Else
                errorMessage.Visible = True
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                deleteSuccess.Visible = False
                searchMessage.Visible = False
            End If
        Catch ex As Exception
            errorMessage.Visible = True
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            deleteSuccess.Visible = False
            searchMessage.Visible = False
        End Try
        cmd = Nothing
        CommonProperty.cn.Close()
    End Sub

    Protected Sub btnUPD_Click(sender As Object, e As EventArgs) Handles btnUPD.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "Update Auction_Mst set pro_on_sale_no= @pro_on_sale_no, pro_name= @pro_name,
                           price= @price,st_date= @st_date,ed_date= @ed_date,
                           condition= @condition,Description=@Description
                           where auc_no= @auc_no"
        cmd.Parameters.AddWithValue("@pro_on_sale_no", txtProOnSaleNo.Text)
        cmd.Parameters.AddWithValue("@pro_name", txtProName.Text)
        cmd.Parameters.AddWithValue("@price", txtPrice.Text)
        cmd.Parameters.AddWithValue("@st_date", txtStDate.Text)
        cmd.Parameters.AddWithValue("@ed_date", txtEdDate.Text)
        cmd.Parameters.AddWithValue("@condition", txtCond.Text)
        cmd.Parameters.AddWithValue("@Description", txtDesc.Text)
        cmd.Parameters.AddWithValue("@auc_no", txtAucNo.Text)

        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = False
                updateSuccess.Visible = True
                deleteSuccess.Visible = False
                searchMessage.Visible = False
            Else
                errorMessage.Visible = True
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                deleteSuccess.Visible = False
                searchMessage.Visible = False
            End If
        Catch ex As Exception
            errorMessage.Visible = True
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            deleteSuccess.Visible = False
            searchMessage.Visible = False
        End Try
        CommonProperty.cn.Close()
    End Sub

    Protected Sub btnDel_Click(sender As Object, e As EventArgs) Handles btnDel.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "delete from Auction_Mst where Auc_no=@Auc_no"
        cmd.Parameters.AddWithValue("@Auc_no", txtAucNo.Text)
        Try
            If cmd.ExecuteNonQuery() Then
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                deleteSuccess.Visible = True
                searchMessage.Visible = False
            Else
                errorMessage.Visible = True
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                deleteSuccess.Visible = False
                searchMessage.Visible = False
            End If
        Catch ex As Exception
            errorMessage.Visible = True
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            deleteSuccess.Visible = False
            searchMessage.Visible = False
        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "Select * from Auction_Mst where Auc_No=@Auc_no"
        cmd.Parameters.AddWithValue("@Auc_no", txtSearch.Text)
        Dim da As SqlDataReader
        Try
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                txtAucNo.Text = da(0)
                txtProOnSaleNo.Text = da(1)
                txtProName.Text = da(2)
                txtPrice.Text = da(3)
                txtStDate.Text = da(4)
                txtEdDate.Text = da(5)
                txtCond.Text = da(6)
                txtDesc.Text = da(7)
            Else
                searchMessage.Visible = True
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                deleteSuccess.Visible = False
            End If
        Catch ex1 As Exception
            searchMessage.Visible = False
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            deleteSuccess.Visible = False
            errorMessage.Visible = True
        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        txtProOnSaleNo.Text = GridView1.SelectedRow.Cells(1).Text
        txtProName.Text = GridView1.SelectedRow.Cells(2).Text
    End Sub
End Class