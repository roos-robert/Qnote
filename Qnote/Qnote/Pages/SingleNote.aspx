<%@ Page Title="SingleNote" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="SingleNote.aspx.cs" Inherits="Qnote.Pages.SingleNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems specifika anteckning.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1><asp:Literal ID="HeaderLitteral" runat="server"></asp:Literal></h1>
    
    <p></p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ListView ID="QnoteListView" runat="server" ItemType="Qnote.Models.Qnote" SelectMethod="QnoteListView_GetData" DataKeyNames="NoteID">
        <LayoutTemplate>     
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <%-- Template for each row in the database. --%>
            <h4><%#: Item.Header %></h4>
            <p class="small"><%#: Item.Date %></p>
            <p><%#: Item.Note %></p>
            <p>&nbsp;</p>    
        </ItemTemplate>
        <EmptyDataTemplate>
            <%-- If there are no notes saved --%>
            <p>Du har inte en enda anteckning sparad, skriv en nu!</p>
        </EmptyDataTemplate>                       
    </asp:ListView>
</asp:Content>
