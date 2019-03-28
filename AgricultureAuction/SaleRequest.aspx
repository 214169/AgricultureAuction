<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SaleRequest.aspx.vb" Inherits="AgricultreAuction.SaleRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row" id="pagetitle">
        <h1>Welcome To Farmer SignUp Page</h1>
    </div>
    <div class="row">       
        <div class="col-md-12">
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtFID">Request ID</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtRequestId" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnGetRequestNo" runat="server" Text="Genrate Request No#" formnovalidate class="btn btn-primary btn-block info" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtRdate">Request Date</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtRdate" runat="server" class="form-control datepicker" required></asp:TextBox>
                </div>
            </div>
           <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtFid">Farmer ID</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtFid" runat="server" class="form-control" ReadOnly="true" required></asp:TextBox>
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
                    <label class="control-label" for="txtDesc">Description</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>
             <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="fu1">Certificate 1</label>
                </div>
                <div class="col-md-4">
                    <asp:FileUpload ID="uploadCertificate1" runat="server" />
                    <asp:Image ID="Image1" runat="server" width="100px" Height="100px"/>
                </div>               
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtIssuedBy1">Issued By 1</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtIssuedBy1" runat="server" class="form-control" required></asp:TextBox>                   
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="fu2">Certificate 2</label>
                </div>
                <div class="col-md-4">
                    <asp:FileUpload ID="uploadCertificate2" runat="server" />
                    <asp:Image ID="Image2" runat="server" width="100px" Height="100px"/>
                </div>               
            </div>
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtIssuedBy2">Issued By 2</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtIssuedBy2" runat="server" class="form-control" required></asp:TextBox>                   
                </div>
            </div>
            <div class="form-group row">
                 <div class="col-md-4 col-md-offset-4">                   
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary btn-sm"/>  
                   <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary btn-sm"/>
                   <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-primary btn-sm"/>
                </div>
            </div>         
            <div class="row well well-sm">
                <div class="form-group ">
                    <div class="col-md-2 col-md-offset-8">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-sm" formnovalidate />
                        <asp:Button ID="btnShowSale" runat="server" Text="View Sale" class="btn btn-primary btn-sm" formnovalidate/>
                    </div>
                </div>
            </div>
              <div class="alert alert-success" role="alert" id="alert">
                <label id="insertSuccess" visible="false" runat="server">Data Successfully Inserted.</label>
                <label id="updateSuccess" visible="false" runat="server">Data Successfully Updated.</label>              
                <label id="searchMessage" visible="false" runat="server">Data not found!</label>
                <label id="errorMessage" visible="false" runat="server">Operation Failed.</label>
                <label id="deleteMessage" visible="false" runat="server">Data  Successfully Deleted.</label>
            </div>
        </div>
    </div>
</asp:Content>
