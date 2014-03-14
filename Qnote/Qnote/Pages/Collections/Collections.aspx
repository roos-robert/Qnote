<%@ Page Title="Hantera samlingar" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Collections.aspx.cs" Inherits="Qnote.Pages.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Listar en medlems alla anteckningar sedan tidernas begynnelse, eller Qnotes.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Samlingar</h1>
    <p>Hantera tillgängliga samlingar för medlemmar</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary-error" ValidationGroup="Inserting" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="validation-summary-error" ValidationGroup="Updating" />
    
    <asp:ListView ID="QnoteListView" runat="server" ItemType="Qnote.Models.CollectionName" 
        SelectMethod="QnoteListView_GetData" InsertMethod="QnoteListView_InsertItem" UpdateMethod="QnoteListView_UpdateItem" 
        DataKeyNames="CollectionNameID" InsertItemPosition="FirstItem">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <%-- Template for each row in the database. --%>
            <p>&nbsp;</p>
            <h4><%#: Item.CollectionNameText %></h4>
            <asp:HyperLink runat="server" NavigateUrl='<%# GetRouteUrl("DeleteCollection", new { id = Item.CollectionNameID, header = Item.CollectionNameText })  %>' Text="Radera" /> - 
            <asp:LinkButton runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false" />            
        </ItemTemplate>
        <InsertItemTemplate>
            <%-- Template for creating a new collection. --%>
            <h2>Lägg till ny samling</h2>
            <p>               
                <asp:TextBox ID="TextBoxNewCollection" runat="server" CssClass="form-control" placeholder="Skriv den nya samlingens namn här!" Text='<%#: BindItem.CollectionNameText %>' MaxLength="60"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Minst 1 tecken och max 60 måste anges!" ControlToValidate="TextBoxNewCollection" Display="Dynamic" Text="*" ValidationGroup="Inserting"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:LinkButton ID="btnUpdateCollection" runat="server" CommandName="Insert" CssClass="btn btn-success" Text="Lägg till samling" ValidationGroup="Inserting" />
            </p>                                    
        </InsertItemTemplate>
        <EditItemTemplate>
            <%-- Template for updating a existing collection. --%>
            <h2>Uppdatera samling</h2>
            <p>               
                <asp:TextBox ID="TextBoxUpdateCollection" runat="server" CssClass="form-control" placeholder="Skriv den nya samlingens namn här!" Text='<%#: BindItem.CollectionNameText %>' MaxLength="60"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Minst 1 tecken och max 60 måste anges!" ControlToValidate="TextBoxUpdateCollection" Display="Dynamic" Text="*" ValidationGroup="Updating"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:LinkButton runat="server" CommandName="Update" CssClass="btn btn-success" Text="Uppdatera samling"  ValidationGroup="Updating" />
            </p>      
        </EditItemTemplate>
        <EmptyDataTemplate>
            <%-- If there are no collections in the database --%>
            <p>Du har inte en enda samling i databasen</p>
        </EmptyDataTemplate>                       
    </asp:ListView>

</asp:Content>