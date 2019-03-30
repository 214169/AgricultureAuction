Public Class RequestView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            dsRequest.SelectParameters.Add("fid", Session("fid").ToString())
        End If
    End Sub



    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        btnApprove.Enabled = True
    End Sub

    Protected Sub btnApprove_Click(sender As Object, e As EventArgs) Handles btnApprove.Click
        CommonProperty.reqid = GridView1.SelectedRow.Cells(1).Text
        CommonProperty.proName = GridView1.SelectedRow.Cells(4).Text
        CommonProperty.proQua = GridView1.SelectedRow.Cells(5).Text
        Response.Redirect("Productonsale", False)
    End Sub
End Class