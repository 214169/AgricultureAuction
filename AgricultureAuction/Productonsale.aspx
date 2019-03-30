<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Productonsale.aspx.vb"
    Inherits="AgricultreAuction.Productonsale"  MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row" id="pagetitle">
        <h5><strong>Product On Sale</strong></h5>
    </div>
    <div class="row well">       
        <div class="col-md-12">
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtProOnSaleNo">Product No</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtProOnSaleNo" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnGetNo" runat="server" Text="Genrate Product No#" formnovalidate class="btn btn-primary btn-block info" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtProName">Product Name</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtProName" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>
           <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtProQuality">Product Quality</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtProQuality" runat="server" class="form-control" required></asp:TextBox>                
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtProDate">Sale Date</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtProDate" runat="server" class="form-control picker" required></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtReqID">Request ID</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtReqID" runat="server" class="form-control" required></asp:TextBox>
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
                   <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-primary btn-sm"/>  
                </div>
            </div>         
            <div class="row">
                <div class="form-group ">
                    <div class="col-md-2 col-md-offset-8">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Enter roduct no"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-sm" formnovalidate />
                    </div>
                </div>
            </div>
              <div class="row" role="alert" id="alert">
                <label id="insertSuccess" visible="false" class="alert alert-success col-md-12" runat="server">Data Successfully Inserted.</label>
                <label id="updateSuccess" visible="false" class="alert alert-success col-md-12" runat="server">Data Successfully Updated.</label>              
                <label id="searchMessage" visible="false" class="alert alert-warning col-md-12" runat="server">Data not found!</label>
                <label id="errorMessage" visible="false" class="alert alert-danger col-md-12" runat="server">Operation Failed!</label>
                <label id="deleteMessage" visible="false" class="alert alert-warning col-md-12" runat="server">Data Successfully Deleted.</label>
            </div>
        </div>
    </div>
</asp:Content>
