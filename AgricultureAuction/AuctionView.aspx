<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AuctionView.aspx.vb" 
    Inherits="AgricultreAuction.AuctionView" MaintainScrollPositionOnPostback="true"%>

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
                    <asp:BoundField DataField="req_ID" HeaderText="Request ID" SortExpression="req_ID" />
                    <asp:BoundField DataField="Pro_name" HeaderText="Pro_name" SortExpression="Pro_name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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
                SelectCommand="select * from [Auction_MST],[pro_on_sale_MST] where [Auction_MST].[pro_on_sale_no] = [pro_on_sale_MST].[pro_on_sale_no]"></asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" Height="50px"
                Style="position: relative" CssClass="table table-bordered table-condensed">

                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center"  />
                <Fields>
                    <asp:BoundField DataField="Bid_No" HeaderText="Bid No" SortExpression="Bid_No" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Bid_Rate" HeaderText="Bid Rate" SortExpression="Bid_Rate" />                   
                    <asp:BoundField DataField="Merchant_ID" HeaderText="Merchant ID" SortExpression="Merchant_ID" />
                    <asp:BoundField DataField="FarmerId" HeaderText="Farmer ID" SortExpression="FarmerId"/>                    
                    <asp:BoundField DataField="Place" HeaderText="Place" SortExpression="Place" />
                    <asp:HyperLinkField Text="Manage Bid" DataNavigateUrlFields="FarmerId,Merchant_ID" 
                        DataNavigateUrlFormatString="ManageBid.aspx?fid={0}&mid={1}" ControlStyle-CssClass="btn btn-primary btn-sm" />
                </Fields>
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT Distinct [Auction_Detail].[Auc_No]
                                  ,[Auction_Detail].[Bid_No]
                                  ,[Auction_Detail].[Date]
                                  ,[Auction_Detail].[Bid_Rate]
                                  ,[Auction_Detail].[Merchant_ID]
                                  ,[Auction_Detail].[Place]
                                  ,[Auction_MST].[pro_on_sale_no]
                                  ,[pro_on_sale_MST].[req_ID]
                                  ,[Sale_rqu_MST].[FarmerId]
                              FROM [dbo].[Auction_Detail], [dbo].[Auction_MST],  [dbo].[pro_on_sale_MST], 
                              [dbo].[Sale_rqu_MST]
                              where [dbo].[Auction_Detail].Auc_No = [dbo].[Auction_MST].Auc_no
                              and [dbo].[Auction_MST].pro_on_sale_no = [dbo].[pro_on_sale_MST].pro_on_sale_No
                              and [dbo].[Sale_rqu_MST].ReqID = [dbo].[pro_on_sale_MST].req_ID
                              and [dbo].[Auction_MST].pro_on_sale_no = @pro_on_sale_no">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Auc_No" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
