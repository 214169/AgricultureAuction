<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AuctionView.aspx.vb" Inherits="AgricultreAuction.AuctionView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row well">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                CellPadding="4" CellSpacing="2" DataKeyNames="Auc_no" DataSourceID="SqlDataSource1"
                ForeColor="Black" Style="position: relative" CssClass="table table-bordered table-condensed">
                <FooterStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Auc_no" HeaderText="Auc_no" ReadOnly="True" SortExpression="Auc_no" />
                    <asp:BoundField DataField="pro_on_sale_no" HeaderText="pro_on_sale_no" SortExpression="pro_on_sale_no" />
                    <asp:BoundField DataField="Pro_name" HeaderText="Pro_name" SortExpression="Pro_name" />
                    <asp:BoundField DataField="Prize" HeaderText="Prize" SortExpression="Prize" />
                    <asp:BoundField DataField="St_date" HeaderText="St_date" SortExpression="St_date" />
                    <asp:BoundField DataField="Ed_Date" HeaderText="Ed_Date" SortExpression="Ed_Date" />
                    <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Auction_MST]"></asp:SqlDataSource>

            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" Height="50px"
                Style="position: relative" CssClass="table table-bordered table-condensed">

                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center"  />
                <Fields>
                    <asp:BoundField DataField="Bide_No" HeaderText="Bide_No" SortExpression="Bide_No" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Bid_Rate" HeaderText="Bid_Rate" SortExpression="Bid_Rate" />
                    <asp:BoundField DataField="Merchant_ID" HeaderText="Merchant_ID" SortExpression="Merchant_ID" />
                    <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="Place" />
                </Fields>
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [Bide_No], [Date], [Bid_Rate], [Merchant_ID], [Place] FROM [Auction_Detail] WHERE ([Auc_No] = @Auc_No)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Auc_No" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
