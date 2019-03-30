<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ManageBid.aspx.vb" 
    Inherits="AgricultreAuction.ManageBid"  ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row well">
        <div class="col-md-12">
             <div class="">
                <h5 ><strong>Merchant Info</strong></h5>
            </div>
          <asp:DetailsView ID="MerchantDetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" DataSourceID="MerchantDataSource" GridLines="Vertical" Height="50px"
                Style="position: relative" CssClass="table table-bordered table-condensed">

                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <Fields>
                    <asp:BoundField DataField="MerchantID" HeaderText="Merchant ID"  />
                    <asp:BoundField DataField="MerchantName" HeaderText="Merchant Name"  />
                    <asp:BoundField DataField="Address" HeaderText="Address"  />                   
                    <asp:BoundField DataField="City" HeaderText="City"  />
                    <asp:BoundField DataField="MobileNo" HeaderText="Contact No" />                    
                    <asp:BoundField DataField="EmailId" HeaderText="EmailId"/>
                  </Fields>
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="MerchantDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="select * from [MerchantMST] where MerchantID=@MerchantID" >              
            </asp:SqlDataSource>                     
        </div>
    </div>    

     <div class="row well">
        <div class="col-md-12">
             <div class="">
                <h5 ><strong>Farmer Info</strong></h5>
            </div>
          <asp:DetailsView ID="FarmerDetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" DataSourceID="FarmerDataSource" GridLines="Vertical" Height="50px"
                Style="position: relative" CssClass="table table-bordered table-condensed">

                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <Fields>
                    <asp:BoundField DataField="FarmerID" HeaderText="Farmer ID"  />
                    <asp:BoundField DataField="FarmerName" HeaderText="Farmer Name"  />
                    <asp:BoundField DataField="Address" HeaderText="Address"  />                   
                    <asp:BoundField DataField="City" HeaderText="City"  />
                    <asp:BoundField DataField="MobileNo" HeaderText="Contact No" />                    
                    <asp:BoundField DataField="EmailId" HeaderText="EmailId"/>
                  </Fields>
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="FarmerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="select * from [FarmerMST] where FarmerID=@FarmerID" >              
            </asp:SqlDataSource>                     
        </div>
    </div>    
</asp:Content>
