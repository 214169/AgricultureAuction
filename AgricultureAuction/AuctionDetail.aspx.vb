Imports System.Data.SqlClient

Public Class AuctionDetail
    Inherits System.Web.UI.Page
    Dim cmd As New SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtMID.Text = Session("mid").ToString()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        CommonProperty.aucno = GridView1.SelectedRow.Cells(1).Text
        txtAucNo.Text = CommonProperty.aucno
        cmd.CommandText = "Select max(convert(int,Bid_no))+1 from Auction_Detail where auc_no=@Auc_no"
        cmd.Parameters.AddWithValue("@Auc_no", txtAucNo.Text)
        cmd.Connection = CommonProperty.cn
        cmd.Connection.Open()
        Dim obj As Object = cmd.ExecuteScalar()
        cmd.Connection.Close()
        If obj Is DBNull.Value Then
            txtBidNo.Text = "101"
        Else
            txtBidNo.Text = obj.ToString()
        End If
    End Sub



    Protected Sub btnsearch_Click(sender As Object, e As EventArgs) Handles btnsearch.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "Select * from Auction_Detail where Auc_No=@Auc_no and Bide_No=@Bide_No"
        cmd.Parameters.AddWithValue("@Auc_no", txtAucNo.Text)
        cmd.Parameters.AddWithValue("@Bide_No", txtBidsearch.Text)
        Dim da As SqlDataReader
        Try
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                txtAucNo.Text = da(0)
                txtBidNo.Text = da(1)
                txtDate.Text = da(2)
                txtBidRate.Text = da(3)
                txtMID.Text = da(4)
                txtPlace.Text = da(5)
            Else
                searchMessage.Visible = True
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                deleteSuccess.Visible = False
            End If
        Catch ex As Exception
            errorMessage.Visible = True
        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub

    Protected Sub btnIns_Click(sender As Object, e As EventArgs) Handles btnIns.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        cmd.CommandText = "insert into Auction_Detail values(@auc_no, @bid_no, @date, @bid_rate, @merchant_id, @place)"

        cmd.Parameters.AddWithValue("@auc_no", txtAucNo.Text)
        cmd.Parameters.AddWithValue("@bid_no", txtBidNo.Text)
        cmd.Parameters.AddWithValue("@date", txtDate.Text)
        cmd.Parameters.AddWithValue("@bid_rate", txtBidRate.Text)
        cmd.Parameters.AddWithValue("@merchant_id", txtMID.Text)
        cmd.Parameters.AddWithValue("@place", txtPlace.Text)


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
        cmd.CommandText = "Update Auction_Detail set date=@date, bid_rate=@bid_rate, Merchant_Id=@merchant_id,
                                     Place=@place where auc_no=@auc_no and Bid_No=@bid_no"

        cmd.Parameters.AddWithValue("@auc_no", txtAucNo.Text)
        cmd.Parameters.AddWithValue("@bid_no", txtBidNo.Text)
        cmd.Parameters.AddWithValue("@date", txtDate.Text)
        cmd.Parameters.AddWithValue("@bid_rate", txtBidRate.Text)
        cmd.Parameters.AddWithValue("@merchant_id", txtMID.Text)
        cmd.Parameters.AddWithValue("@place", txtPlace.Text)
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
End Class