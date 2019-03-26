<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProOnSaleView.aspx.vb" Inherits="AgricultreAuction.ProOnSaleView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row well">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                CellPadding="4" CellSpacing="2" DataKeyNames="pro_on_sale_No" DataSourceID="SqlDataSource1"
                ForeColor="Black" Style="position: relative" CssClass="table table-bordered table-condensed">
                <FooterStyle BackColor="#CCCCCC" />
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
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [pro_on_sale_MST]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
