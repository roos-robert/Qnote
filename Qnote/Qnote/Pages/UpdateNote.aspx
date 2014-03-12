<%@ Page Title="Redigera anteckning" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UpdateNote.aspx.cs" Inherits="Qnote.Pages.UpdateNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Vy för att uppdatera en befintlig anteckning.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Uppdatera anteckning</h1>
    <p>Stavfel? Missat något? Ingen fara, uppdatera anteckningen nedan!</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <asp:FormView ID="QnoteUpdateFormView" runat="server" DefaultMode="Edit" ItemType="Qnote.Models.QnoteCollectionID" 
        SelectMethod="QnoteListView_GetData" UpdateMethod="QnoteListView_UpdateItem" DataKeyNames="NoteID" RenderOuterTable="false">
        <EditItemTemplate>
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
                    DataTextField="CollectionNameText" DataValueField="CollectionNameID">
                </asp:DropDownList>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator3" runat="server" ErrorMessage="En samling måste väljas!" ControlToValidate="DropDownListCollection" Text="*"></asp:RequiredFieldValidator>         
            </div>          
            <p>&nbsp;</p>
            <p>
                <asp:LinkButton CssClass="btn btn-success" runat="server" Text="Uppdatera" CommandName="Update" />
            </p>
        </EditItemTemplate>
    </asp:FormView>

    
</asp:Content>
