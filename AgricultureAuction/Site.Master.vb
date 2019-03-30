Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Not Session("username") Is Nothing Then
                lnkSignOut.Visible = True
                lblUserName.InnerText = Session("username")
            End If

            If Not Session("fid") Is Nothing Then
                aSaleRequest.Visible = True
                aRequestView.Visible = True
            End If
            If Not Session("admin") Is Nothing Then
                aAddAuction.Visible = True
            End If

            If Not Session("mid") Is Nothing Then
                aPlaceBid.Visible = True
            End If
        End If
    End Sub

    Protected Sub lnkSignOut_Click(sender As Object, e As EventArgs) Handles lnkSignOut.Click
        Session.RemoveAll()
        lblUserName.InnerText = "Guest"
        lnkSignOut.Visible = False
        Response.Redirect("Default")
    End Sub
End Class