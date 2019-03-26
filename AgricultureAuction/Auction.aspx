<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Auction.aspx.vb" 
    Inherits="AgricultreAuction.Auction" MaintainScrollPositionOnPostBack = "true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
     <div class="row well well-sm">
         <div class="form-group ">           
             <div class="col-md-2 col-md-offset-8">
                    <asp:TextBox ID="txtSearch" runat="server" class="form-control"></asp:TextBox>
                 </div>
                 <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary btn-sm" formnovalidate/>
                </div>               
            </div>
     </div>
    <div class="row well">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                CellPadding="3" DataKeyNames="pro_on_sale_No" DataSourceID="dsProOnSaleForPutOnAuction"
                ForeColor="Black" GridLines="Vertical" PageSize="5" CssClass="table table-bordered table-condensed">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="pro_on_sale_No" HeaderText="pro_on_sale_No" ReadOnly="True"
                        SortExpression="pro_on_sale_No" />
                    <asp:BoundField DataField="pro_name" HeaderText="pro_name" SortExpression="pro_name" />
                    <asp:BoundField DataField="pro_quality" HeaderText="pro_quality" SortExpression="pro_quality" />
                    <asp:BoundField DataField="pro_date" HeaderText="pro_date" SortExpression="pro_date" />
                    <asp:BoundField DataField="req_ID" HeaderText="req_ID" SortExpression="req_ID" />
                    <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsProOnSaleForPutOnAuction" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [pro_on_sale_MST]"></asp:SqlDataSource>
        </div>
    </div>

    <div class="row well">
        <div class="col-md-12">
            <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="Auc_No">Auction No</label>
                </div>
                <div class="col-md-4">
                     <asp:TextBox ID="txtAucNo" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                     <asp:Button ID="btnGetNem" runat="server" Text="Genrate Auction No#" formnovalidate class="btn btn-primary btn-block info"/>
                </div>
            </div>

             <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="Pro_On_Sale_No">Pro_On_Sale_No</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtProOnSaleNo" runat="server" class="form-control" required></asp:TextBox>
                </div>               
            </div>

            <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="Pro_Name">Pro_Name</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtProName" runat="server" class="form-control" required></asp:TextBox>
                </div>               
            </div>

             <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="Price">Price</label>
                </div>
                <div class="col-md-4">
                  <asp:TextBox ID="txtPrice" runat="server" class="form-control" required></asp:TextBox>
                </div>               
            </div>

            <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="txtStDate">Start Date</label>
                </div>
                <div class="col-md-4">
                  <asp:TextBox ID="txtStDate" runat="server" class="form-control datepicker"></asp:TextBox>                
                </div>               
            </div>
           

            <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="txtEdDate">End Date</label>
                </div>
                <div class="col-md-4">
                 <asp:TextBox ID="txtEdDate" runat="server" class="form-control datepicker"></asp:TextBox>
                </div>               
            </div>

            <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="Condition">Condition</label>
                </div>
                <div class="col-md-4">
                   <asp:TextBox ID="txtCond" runat="server" class="form-control" required></asp:TextBox>
                </div>               
            </div>

            <div class="form-group row">
                <div class="col-md-4">                   
                    <label class="control-label" for="Descripion">Descripion</label>
                </div>
                <div class="col-md-4">
                     <asp:TextBox ID="txtDesc" runat="server" class="form-control" required></asp:TextBox>
                </div>               
            </div>         
            <div class="form-group row">
                  <div class="col-md-4 col-md-offset-4">                   
                   <asp:Button ID="btnIns" runat="server" Text="Insert" class="btn btn-primary btn-sm"/> 
                   <asp:Button ID="btnUPD" runat="server" Text="Update" class="btn btn-primary btn-sm"/>
                    <asp:Button ID="btnDel" runat="server" Text="Delete" class="btn btn-primary btn-sm"/>
                </div>
            </div>

            <div class="alert alert-success" role="alert" id="alert">
                <label id="insertSuccess" visible="false" runat="server">Data Successully Inserted.</label>
                <label id="updateSuccess" visible="false" runat="server">Data Successully Updated.</label>
                <label id="deleteSuccess" visible="false" runat="server">Data Successully Updated.</label>
                <label id="searchMessage" visible="false" runat="server">Data not found!</label>
                <label id="errorMessage" visible="false" runat="server">Operation Failed.</label>
            </div>        
        </div>
    </div>
</asp:Content>
