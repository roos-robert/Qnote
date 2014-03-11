<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="DeleteNote.aspx.cs" Inherits="Qnote.Pages.DeleteNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Ber medlemmen bekräfta om en anteckning skall raderas.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1><asp:Literal ID="HeaderLitteral" runat="server"></asp:Literal></h1>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <p>Är du helt säker på att du vill radera denna anteckning?</p>
    <p>
        <asp:Button ID="DeleteButton" runat="server" Text="Ja, jag är säker!" OnClick="DeleteButton_Click" />
    </p>
</asp:Content>
