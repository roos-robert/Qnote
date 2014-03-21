<%@ Page Title="Redigera anteckning" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UpdateNote.aspx.cs" Inherits="Qnote.Pages.UpdateNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Vy för att uppdatera en befintlig anteckning.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Uppdatera anteckning</h1>
    <p>Stavfel? Missat något? Ingen fara, uppdatera anteckningen nedan!</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ValidationSummary runat="server" CssClass="validation-summary-error" />

    <asp:FormView ID="QnoteUpdateFormView" runat="server" DefaultMode="Edit" ItemType="Qnote.Models.QnoteCollection" 
        SelectMethod="QnoteListView_GetData" UpdateMethod="QnoteListView_UpdateItem" DataKeyNames="NoteID" RenderOuterTable="false">
        <EditItemTemplate>
            <div class="form-group">
                <label for="noteHeader">Rubrik</label>
                <%-- TextBox for the note header, also has a validator that makes sure it's not left empty --%>
                <asp:TextBox ID="HeaderTextBox" runat="server" class="form-control" placeholder="Skriv en rubrik för anteckningen" Text='<%# BindItem.Header %>'></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator1" runat="server" ErrorMessage="En titel på minst 1 tecken, max 60 måste anges!" ControlToValidate="HeaderTextBox" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="note">Anteckning</label>
                <%-- TextBox for the note, also has a validator that makes sure it's not left empty --%>
                <%-- Oh, and also a hidden field containing the logged in users id. --%>
                <asp:TextBox ID="NoteTextBox" runat="server" class="form-control" Rows="6" TextMode="MultiLine" Text='<%# BindItem.Note %>'></asp:TextBox>
                <asp:TextBox ID="UserIDTextBox" runat="server" CssClass="hidden" Rows="6" Text='<%# BindItem.UserID %>'>1</asp:TextBox>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator2" runat="server" ErrorMessage="En anteckning måste innehålla minst 1 tecken, max 2000!" ControlToValidate="NoteTextBox" Text="*"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="note">Välj samling</label>
                <%-- DataBound DropDownList that retreives the available collections, so that the user can choose which one he wants his note to belong to. --%>
                <asp:DropDownList ID="DropDownListCollection" runat="server" CssClass="form-control" 
                    SelectMethod="DropDownListCollection_GetData" ItemType="Qnote.Models.CollectionName" 
                    DataTextField="CollectionNameText" DataValueField="CollectionNameID">
                </asp:DropDownList>
                <asp:RequiredFieldValidator CssClass="hidden" ID="RequiredFieldValidator3" runat="server" ErrorMessage="En samling måste väljas!" ControlToValidate="DropDownListCollection" Text="*"></asp:RequiredFieldValidator>         
            </div>          
            <p>&nbsp;</p>
            <p>
                <%-- Really? Do i need to explain what a button does? --%>
                <asp:LinkButton CssClass="btn btn-success" runat="server" Text="Uppdatera" CommandName="Update" />
            </p>
        </EditItemTemplate>
    </asp:FormView>

    
</asp:Content>
