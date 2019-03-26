<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MerchantLogin.aspx.vb" Inherits="AgricultreAuction.MerchantLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row">
        <div class="col-md-8">
            Image
        </div>
        <div class="col-md-4">
            <div class="form-group row">
                <div class="col-md-8">
                    <label class="control-label" for="txtMID">Marchant ID</label>
                    <asp:TextBox ID="txtMID" class="form-control" runat="server" required></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-8">
                    <label class="control-label" for="password">Password</label>
                    <asp:TextBox ID="txtPWD" class="form-control" runat="server" TextMode="Password" required></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-8">
                    <asp:Label ID="LblErrMsg" runat="server" Text="Label" Visible="false" CssClass="alert alert-warning"></asp:Label>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-8">
                    <asp:Button ID="btnMerchantLogin" class="btn btn-primary btn-block info" runat="server" Text="Sign In" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
