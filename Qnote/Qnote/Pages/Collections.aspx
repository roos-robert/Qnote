<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Collections.aspx.cs" Inherits="Qnote.Pages.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems alla anteckningar sedan tidernas begynnelse, eller Qnotes.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Kategorier</h1>
    <p>Hantera tillgängliga kategorier för medlemmar.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <p>Här kan kategorier hanteras som skall finnas tillgänliga för medlemmar att använda sig utav.</p>
</asp:Content>