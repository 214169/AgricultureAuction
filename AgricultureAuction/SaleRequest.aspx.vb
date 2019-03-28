Imports System.Data.SqlClient

Public Class SaleRequest
    Inherits System.Web.UI.Page
    Dim cmd As New SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            txtFid.Text = Session("fid").ToString()
        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        Dim sql As String = "insert into Sale_rqu_Mst values('" + txtRequestId.Text + "','" + txtRdate.Text + "','" _
                             + txtFid.Text + "','" + txtProName.Text + "','" + txtProQuality.Text + "','" _
                             + txtDesc.Text + "','~/Content/images/Certificate/" + txtRequestId.Text.Trim + "_1.jpg" + "','" _
                             + txtIssuedBy1.Text + "','~/Content/images/Certificate/" + txtRequestId.Text.Trim + "_2.jpg" + "','" + txtIssuedBy2.Text + "')"
        cmd.CommandText = sql
        MsgBox(sql)
        Try
            If cmd.ExecuteNonQuery() Then
                uploadCertificate1.SaveAs(Server.MapPath("Content/images/Certificate/" & txtRequestId.Text.Trim & "_1.jpg"))
                uploadCertificate2.SaveAs(Server.MapPath("Content/images/Certificate/" & txtRequestId.Text.Trim & "_2.jpg"))

                insertSuccess.Visible = True
                updateSuccess.Visible = False
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
            MsgBox(ex.ToString)
        End Try
        cmd = Nothing
        CommonProperty.cn.Close()
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        CommonProperty.cn.Open()
        cmd.Connection = CommonProperty.cn
        Try
            cmd.CommandText = "Update Sale_rqu_Mst set RquDate= '" + txtRdate.Text + "',FarmerID='" + txtFid.Text _
                               + "',ProName='" + txtProName.Text + "',ProQuality='" + txtProQuality.Text + "',Description='" _
                               + txtDesc.Text + "',Certy1='~/Content/images/Certificate/" + txtRequestId.Text.Trim + "_1.jpg" + "',IssuedBy1='" _
                               + txtIssuedBy1.Text + "',Certy2='~/Content/images/Certificate/" + txtRequestId.Text.Trim + "_2.jpg" + "',IssuedBy2='" _
                               + txtIssuedBy2.Text + "' where reqid='" + txtRequestId.Text + "'"

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
        cmd.CommandText = "delete from Sale_rqu_Mst where ReqID=" + txtRequestId.Text + ""
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
        cmd.CommandText = "Select * from sale_rqu_Mst where reqID=" + txtSearch.Text + ""
        Dim da As SqlDataReader
        Try
            da = cmd.ExecuteReader()
            If da.HasRows Then
                da.Read()
                txtRequestId.Text = da(0)
                txtRdate.Text = da(1)
                txtFid.Text = da(2)
                txtProName.Text = da(3)
                txtProQuality.Text = da(4)
                txtDesc.Text = da(5)
                Image1.ImageUrl = da(6)
                txtIssuedBy1.Text = da(7)
                Image2.ImageUrl = da(8)
                txtIssuedBy2.Text = da(9)
            Else
                insertSuccess.Visible = False
                updateSuccess.Visible = False
                errorMessage.Visible = False
                searchMessage.Visible = True
                deleteMessage.Visible = False
            End If
        Catch ex As Exception
            insertSuccess.Visible = False
            updateSuccess.Visible = False
            errorMessage.Visible = True
            searchMessage.Visible = False
            deleteMessage.Visible = False
        End Try
        CommonProperty.cn.Close()
        cmd = Nothing
    End Sub

    Protected Sub btnShowSale_Click(sender As Object, e As EventArgs) Handles btnShowSale.Click
        Response.Redirect("RequestView.aspx")
    End Sub

    Protected Sub btnGetRequestNo_Click(sender As Object, e As EventArgs) Handles btnGetRequestNo.Click
        cmd.CommandText = "Select max(convert(int,reqid))+1 from sale_rqu_mst"
        cmd.Connection = CommonProperty.cn
        cmd.Connection.Open()
        Dim obj As Object = cmd.ExecuteScalar()
        cmd.Connection.Close()
        If obj Is DBNull.Value Then
            txtRequestId.Text = "4001"
        Else
            txtRequestId.Text = obj.ToString()
        End If
    End Sub
End Class