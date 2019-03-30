<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RequestView.aspx.vb" Inherits="AgricultreAuction.RequestView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row well">
        <div class="col-md-12">
            <h1>Sale Request Manager</h1>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                CellPadding="3" DataKeyNames="ReqID" DataSourceID="dsRequest" ForeColor="Black"
                GridLines="Vertical" CssClass="table table-bordered table-condensed">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ReqID" HeaderText="ReqID" ReadOnly="True" SortExpression="ReqID" />
                    <asp:BoundField DataField="RquDate" HeaderText="RquDate" SortExpression="RquDate" />
                    <asp:BoundField DataField="FarmerId" HeaderText="FarmerId" SortExpression="FarmerId" />
                    <asp:BoundField DataField="ProName" HeaderText="ProName" SortExpression="ProName" />
                    <asp:BoundField DataField="ProQuality" HeaderText="ProQuality" SortExpression="ProQuality" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>

            <asp:SqlDataSource ID="dsRequest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [ReqID], [RquDate], [FarmerId], [ProName], [ProQuality], [Description] FROM [Sale_rqu_MST]"></asp:SqlDataSource>
        </div>
        <div class="col-md-12 col-md-offset-4">

            <asp:Button ID="btnApprove" runat="server" Text="Forward Sale Request" class="btn btn-primary btn-block info" />
        </div>
    </div>


</asp:Content>
