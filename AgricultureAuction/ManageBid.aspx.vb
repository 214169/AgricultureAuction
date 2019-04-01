Public Class ManageBid
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Dim fid As String = Request.QueryString("fid")
            Dim mid As String = Request.QueryString("mid")

            MerchantDataSource.SelectParameters.Add("MerchantID", mid)
            FarmerDataSource.SelectParameters.Add("FarmerID", fid)
        End If
    End Sub
End Class