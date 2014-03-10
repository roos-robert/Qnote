<%@ Page Title="Ny anteckning" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="NewNote.aspx.cs" Inherits="Qnote.Pages.NewNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Skriv en ny anteckning på Qnote.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Ny anteckning</h1>
    <p>Skriv din anteckning nedan.</p>
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

    <div class="form-group">
            <label for="noteHeader">Rubrik</label>
            <asp:TextBox ID="Header" runat="server" class="form-control" placeholder="Skriv en rubrik för anteckningen"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="note">Anteckning</label>
            <asp:TextBox ID="Note" runat="server" class="form-control" Rows="6" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="note">Välj samling</label>
            <select class="form-control" runat="server">
                <option>Kom ihåg</option>
            </select>         
        </div>
        <p class="help-block">Taggar</p>
        <div class="checkbox">          
            <label>
                <input type="checkbox"> Todo
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox"> Skola
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox"> Programmering
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox"> Politik
            </label>
        </div>
            <p>&nbsp;</p>
          <p><asp:Button ID="SaveButton" runat="server" class="btn btn-default" Text="Spara anteckning" OnClick="SaveButton_Click" /></p>
</asp:Content>
