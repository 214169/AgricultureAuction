<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MerchantSignUp.aspx.vb"
    Inherits="AgricultreAuction.MerchantSignUp" MaintainScrollPositionOnPostBack = "true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row" id="pagetitle">
        <h1>Welcome To Merchant SignUp Page</h1>
    </div>
    <div class="row">       
        <div class="col-md-12">
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtMID">Merchant ID</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtMID" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnGetNem" runat="server" Text="Genrate Merchant ID#" formnovalidate class="btn btn-primary btn-block info" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtMName">Merchant Name</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtMName" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>
           <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtPass">Password</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password" required></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtAdd">Address</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtAdd" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtCity">City</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtCNo">Contact No</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCNo" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>
             <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtEmailID">Email</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtEmailID" runat="server" class="form-control" required></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID"
                    ErrorMessage="Enter valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtRating">Rating</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtRating" runat="server" class="form-control" required></asp:TextBox>
                      <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtRating"
                    ErrorMessage="Enter between 1 to 10" Type="Integer" MaximumValue="10" MinimumValue="1"></asp:RangeValidator>
                </div>
            </div>
            <div class="form-group row">
                 <div class="col-md-4 col-md-offset-4">                   
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary btn-sm"/>  
                   <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary btn-sm"/>                    
                </div>
            </div>         
            <div class="row well well-sm">
                <div class="form-group ">
                    <div class="col-md-2 col-md-offset-8">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-sm" formnovalidate />
                    </div>
                </div>
            </div>
              <div class="alert alert-success" role="alert" id="alert">
                <label id="insertSuccess" visible="false" runat="server">Data Successfully Inserted.</label>
                <label id="updateSuccess" visible="false" runat="server">Data Successfully Updated.</label>              
                <label id="searchMessage" visible="false" runat="server">Data not found!</label>
                <label id="errorMessage" visible="false" runat="server">Operation Failed.</label>
            </div>
        </div>
    </div>
</asp:Content>
