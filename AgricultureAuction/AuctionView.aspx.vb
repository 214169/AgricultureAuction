Public Class AuctionView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        SqlDataSource2.SelectParameters.Remove(SqlDataSource2.SelectParameters("pro_on_sale_no"))
        SqlDataSource2.SelectParameters.Add("pro_on_sale_no", GridView1.SelectedRow.Cells(2).Text)
    End Sub

    Protected Sub DetailsView1_DataBound(sender As Object, e As EventArgs) Handles DetailsView1.DataBound
        For Each row As DetailsViewRow In DetailsView1.Rows
            If Session("admin") Is Nothing Or Session("admin") <> True Then
                DetailsView1.Rows(3).Visible = False
                DetailsView1.Rows(4).Visible = False
                DetailsView1.Rows(6).Visible = False
            End If
        Next

    End Sub
End Class