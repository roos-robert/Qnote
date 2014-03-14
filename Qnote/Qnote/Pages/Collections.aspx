<%@ Page Title="Hantera samlingar" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Collections.aspx.cs" Inherits="Qnote.Pages.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems alla anteckningar sedan tidernas begynnelse, eller Qnotes.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Samlingar</h1>
    <p>Hantera tillgängliga samlingar för medlemmar</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary-error" />
    <asp:ListView ID="QnoteListView" runat="server" ItemType="Qnote.Models.CollectionName" SelectMethod="QnoteListView_GetData" DataKeyNames="CollectionNameID">
        <LayoutTemplate>     
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <%-- Template for each row in the database. --%>
            <h4><%#: Item.CollectionNameText %></h4>
            <asp:HyperLink runat="server" NavigateUrl='<%# GetRouteUrl("DeleteCollection", new { id = Item.CollectionNameID, header = Item.CollectionNameText })  %>' Text="Radera" />
            <p>&nbsp;</p>    
        </ItemTemplate>
        <EmptyDataTemplate>
            <%-- If there are no collections in the database --%>
            <p>Du har inte en enda samling i databasen</p>
        </EmptyDataTemplate>                       
    </asp:ListView>

</asp:Content>