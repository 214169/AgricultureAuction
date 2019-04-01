<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MerchantLogin.aspx.vb" Inherits="AgricultreAuction.MerchantLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
    <div class="row">
        <div class="col-md-8"  style="padding-left:0px">
            <img src="Content\images\merchant.jpg" alt="Farmer" height="400" width="600">
        </div>
        <div class="col-md-4  well well-sm">
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
                <div class="col-md-4">
                    <asp:Button ID="btnMerchantLogin" class="btn btn-primary btn-block info" runat="server" Text="Sign In" />
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnMerchantSignup" class="btn btn-primary btn-block info" formnovalidate runat="server" Text="Sign Up" />
                </div>
            </div>
             <div class="form-group row">
                <div class="col-md-8">
                    <a href="Default.aspx">Admin Login</a>  ::  <a href="FarmerLogin.aspx">Farmer Login</a> 
                </div>
        </div>
        </div>
    </div>
</asp:Content>
