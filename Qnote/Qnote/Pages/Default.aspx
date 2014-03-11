<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Qnote.Pages.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Qnote - snabba anteckningar för mobil och webb">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Välkommen!</h1>
    <p>Qnote hjälper dig genom att spara alla dina anteckningar direkt i molnet.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="LoginPanel" runat="server">
        <h2>Demo</h2>
        <p>Logga in nedan för ett demo av Qnote.</p>
        <div class="form-group">
            <%-- Har här skippat valideringen då detta bara är ett dummyformulär. --%>
            <label for="userEmail">Användarnamn</label>
            <input type="email" class="form-control" id="userEmail" placeholder="Din e-post" value="ellen@lnu.se" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="userPassword">Lösenord</label>
            <input type="password" class="form-control" id="userPassword" placeholder="Ditt lösenord" value="1234" readonly="readonly">
        </div>
        <p><asp:Button ID="LoginButton" runat="server" class="btn btn-default" Text="Logga in" OnClick="LoginButton_Click" /></p>
    </asp:Panel>
</asp:Content>