<%@ Page Title="Alla anteckningar" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="AllNotes.aspx.cs" Inherits="Qnote.Pages.AllNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems alla anteckningar sedan tidernas begynnelse, eller Qnotes.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Dina anteckningar</h1>
    <p>Alla dina sparade anteckningar vid Qnote</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary-error" />

    <asp:ListView ID="QnoteListView" runat="server" ItemType="Qnote.Models.QnoteCollection" SelectMethod="QnoteListView_GetData" DataKeyNames="NoteID">
        <LayoutTemplate>     
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <%-- Template for each row in the database. --%>
            <h4><%#: Item.Header %></h4>
            <p class="small"><%#: Item.Date %> - <%#: Item.CollectionNameText %></p>
            <p><%#: Item.Note %></p>
            <p>
                <asp:HyperLink runat="server" NavigateUrl='<%# GetRouteUrl("SingleNote", new { id = Item.NoteID, header = Item.Header })  %>' Text="Visa anteckning" /> - 
                <asp:HyperLink runat="server" NavigateUrl='<%# GetRouteUrl("DeleteNote", new { id = Item.NoteID, header = Item.Header })  %>' Text="Radera" />
            </p>    
            <p>&nbsp;</p>    
        </ItemTemplate>
        <EmptyDataTemplate>
            <%-- If there are no notes saved --%>
            <p>Du har inte en enda anteckning sparad, <a href='<%$ RouteUrl:routename=NewNote %>' id="NewNoteLink" runat="server">skriv en nu!</a></p>
        </EmptyDataTemplate>                       
    </asp:ListView>
</asp:Content>