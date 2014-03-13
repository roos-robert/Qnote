<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/SiteOpen.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Qnote.Pages.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Qnote - snabba anteckningar för mobil och webb">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Välkommen!</h1>
    <p>Qnote hjälper dig genom att spara alla dina anteckningar direkt i molnet</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="LoginPanel" runat="server">
        <h2>Demo</h2>
        <p>Logga in nedan för ett demo av Qnote.</p>
        <div class="form-group">
            <%-- Here I have skipped validations, since this only is a dummy form. --%>
            <label for="userEmail">Användarnamn</label>
            <asp:DropDownList ID="DDLUser" runat="server" CssClass="form-control">
                <asp:ListItem Value="1">Testanvändare 1</asp:ListItem>
                <asp:ListItem Value="2">Testanvändare 2</asp:ListItem>
                <asp:ListItem Value="3">Testanvändare 3</asp:ListItem>
            </asp:DropDownList>
        </div>
        <p><asp:Button ID="LoginButton" runat="server" class="btn btn-default" Text="Logga in" OnClick="LoginButton_Click" /></p>
    </asp:Panel>

    <asp:Panel ID="LogoutPanel" runat="server" Visible="false">
        <p><asp:Button ID="LogoutButton" runat="server" class="btn btn-default" Text="Logga ut" OnClick="LogoutButton_Click"/></p>
    </asp:Panel>
</asp:Content>