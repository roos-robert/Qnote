<%@ Page Title="Ny anteckning" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="NewNote.aspx.cs" Inherits="Qnote.Pages.NewNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Skriv en ny anteckning på Qnote.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Ny anteckning</h1>
    <p>Skriv din anteckning nedan.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ValidationSummary runat="server" CssClass="validation-summary-error" />
    
    <asp:FormView ID="FormViewNewNote" runat="server" ItemType="Qnote.Models.QnoteCollectionID" InsertMethod="FormViewNewNote_InsertItem" DefaultMode="Insert" RenderOuterTable="false">
        <InsertItemTemplate>
            <div class="form-group">
                <label for="noteHeader">Rubrik</label>
                <asp:TextBox ID="HeaderTextBox" runat="server" class="form-control" placeholder="Skriv en rubrik för anteckningen" Text='<%# BindItem.Header %>'></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator1" runat="server" ErrorMessage="En titel på minst 1 tecken, max 60 måste anges!" ControlToValidate="HeaderTextBox" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="note">Anteckning</label>
                <asp:TextBox ID="NoteTextBox" runat="server" class="form-control" Rows="6" TextMode="MultiLine" Text='<%# BindItem.Note %>'></asp:TextBox>
                <asp:TextBox ID="UserIDTextBox" runat="server" CssClass="hidden" Rows="6" Text='<%# BindItem.UserID %>'>1</asp:TextBox>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator2" runat="server" ErrorMessage="En anteckning måste innehålla minst 1 tecken, max 2000!" ControlToValidate="NoteTextBox" Text="*"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="note">Välj samling</label>
                <asp:DropDownList ID="DropDownListCollection" runat="server" CssClass="form-control" 
                    SelectMethod="DropDownListCollection_GetData" ItemType="Qnote.Models.CollectionName" 
                    DataTextField="CollectionNameText" DataValueField="CollectionNameID" SelectedValue='<%# BindItem.CollectionNameID %>'>
                </asp:DropDownList>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator3" runat="server" ErrorMessage="En samling måste väljas!" ControlToValidate="DropDownListCollection" Text="*"></asp:RequiredFieldValidator>        
            </div>          
            <p>&nbsp;</p>
            <p><asp:Button ID="SaveButton" runat="server" class="btn btn-default" Text="Spara anteckning" CommandName="Insert" /></p>
        </InsertItemTemplate>
    </asp:FormView>  
</asp:Content>