<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AuctionDetail.aspx.vb" 
    Inherits="AgricultreAuction.AuctionDetail"  MaintainScrollPositionOnPostBack = "true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">   
     <div class="row well well-sm">
             <div class="form-group ">                
                <div class="col-md-2 col-md-offset-8">
                    <asp:TextBox ID="txtBidsearch" runat="server" class="form-control"></asp:TextBox>
                 </div>
                 <div class="col-md-2">
                    <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-primary btn-sm"/>
                </div>               
            </div>
     </div>
    <div class="row well">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                CellPadding="3" DataKeyNames="Auc_no" DataSourceID="dsProductOnAuction" ForeColor="Black"
                GridLines="Vertical" CssClass="table table-bordered table-condensed">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Auc_no" HeaderText="Auc_no" ReadOnly="True" SortExpression="Auc_no" />
                    <asp:BoundField DataField="pro_on_sale_no" HeaderText="pro_on_sale_no" SortExpression="pro_on_sale_no" />
                    <asp:BoundField DataField="Pro_name" HeaderText="Pro_name" SortExpression="Pro_name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="St_date" HeaderText="St_date" SortExpression="St_date" />
                    <asp:BoundField DataField="Ed_Date" HeaderText="Ed_Date" SortExpression="Ed_Date" />
                    <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsProductOnAuction" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Auction_MST]"></asp:SqlDataSource>
        </div>
    </div>

    <div class="row well">
        <div class="col-md-12">
            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtAucNo">Auction No</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtAucNo" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtBidNo">Bid Number</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtBidNo" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtDate">Date</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDate" runat="server" class="form-control datepicker" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtBidRate">Bid Rate</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtBidRate" runat="server" class="form-control" required></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="Merchant_ID">Merchant ID</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtMID" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-4">
                    <label class="control-label" for="txtPlace">Place</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPlace" runat="server" class="form-control"></asp:TextBox>
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
                    <asp:Button ID="btnIns" runat="server" Text="Insert" class="btn btn-primary btn-sm" />
                    <asp:Button ID="btnUPD" runat="server" Text="Update" class="btn btn-primary btn-sm" />                   
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
