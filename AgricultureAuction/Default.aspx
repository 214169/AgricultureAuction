<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="AgricultreAuction._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="row">
       <h4><strong>Welcome To Agriculture Auction</strong></h4>
   </div>
    <div class="row">
        <div class="col-md-8" style="padding-left:0px">
            <img src="Content\images\home_equip.jpg" alt="agri" height="300" width="600">
        </div>
        <div class="col-md-4 well well-sm">
            <div class="form-group row">
                <div class="col-md-8">
                    <label class="control-label" for="UserID">UserID</label>
                    <asp:TextBox ID="txtUID" class="form-control" runat="server" required ></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-8">
                    <label class="control-label" for="password">Password</label>
                    <asp:TextBox ID="txtPWD" class="form-control" runat="server" TextMode="Password" required ></asp:TextBox>
                </div>
            </div>

              <div class="form-group row">
                <div class="col-md-8">
                
                    <asp:Label ID="LblErrMsg" runat="server" Text="Label"  Visible="false" CssClass="alert alert-warning"></asp:Label>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-8">
                    <asp:Button ID="btnSignUp" class="btn btn-primary btn-block info" runat="server" Text="Sign In" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-8">
                    <a href="FarmerLogin.aspx">Farmer Login</a> :: <a href="MerchantLogin.aspx">Merchant Login</a> 
                </div>
            </div>
        </div>
    </div>
</asp:Content>
