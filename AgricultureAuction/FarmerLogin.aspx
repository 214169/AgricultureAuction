﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FarmerLogin.aspx.vb" 
    Inherits="AgricultreAuction.FarmerLogin" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" id="pagetitle">
        <h1>Welcome To Farmer Login Page</h1>
    </div>
    <div class="row">
        <div class="col-md-8">
            <img src="Content\images\farmer_img.jpg" alt="Farmer" height="400" width="600">
        </div>
        <div class="col-md-4">
            <div class="form-group row">
                <div class="col-md-8">
                    <label class="control-label" for="txtFID">Farmer ID:</label>
                    <asp:TextBox ID="txtFID" class="form-control" runat="server" required></asp:TextBox>
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
                    <asp:Button ID="btnFarmerLogin" class="btn btn-primary btn-block info" runat="server" Text="Sign In" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-8">
                    <a href="Default.aspx">Admin Login</a>  ::  <a href="MerchantLogin.aspx">Merchant Login</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
