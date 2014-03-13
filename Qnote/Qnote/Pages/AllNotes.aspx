<%@ Page Title="Alla anteckningar" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="AllNotes.aspx.cs" Inherits="Qnote.Pages.AllNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems alla anteckningar sedan tidernas begynnelse, eller Qnotes.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Dina anteckningar</h1>
    <p>Alla dina sparade anteckningar vid Qnote</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="LoginConfirmation" class="alert alert-success" runat="server" visible="false">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <asp:Literal ID="SuccessLiteral" runat="server"></asp:Literal>
    </div>

    <div id="errorNotif" class="errorNotif" runat="server" visible="false">
        <div class="alert alert-danger fade in">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4>Attans! Något gick snett!</h4>
            <p><asp:Literal ID="ErrorLiteral" runat="server"></asp:Literal></p>               
        </div>
    </div>

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
            <p>Du har inte en enda anteckning sparad, skriv en nu!</p>
        </EmptyDataTemplate>                       
    </asp:ListView>
</asp:Content>