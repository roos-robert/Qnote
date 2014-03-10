<%@ Page Title="Alla anteckningar" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="AllNotes.aspx.cs" Inherits="Qnote.Pages.AllNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems alla anteckningar sedan tidernas begynnelse, eller Qnotes.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Dina anteckningar</h1>
    <p>Alla dina sparade anteckningar vid Qnote.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
</asp:Content>
