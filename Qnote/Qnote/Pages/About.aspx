<%@ Page Title="Om Qnote" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Qnote.Pages.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Qnote är en webbapplikation för att snabbt spara anteckningar i molnet.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JumbotronContentPlaceHolder" runat="server">
    <h1>Om Qnote</h1>
    <p>Allt och lite mera om tjänsten</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2>Qnote samlar dina anteckningar i molnet</h2>
    <p>Men vad betyder detta egentligen? Det är enkelt, skriv en anteckning, välj en samling den skall tillhöra och klicka sedan på spara.
    Du kommer nu snabbt och enkelt åt denna anteckning vart du än befinner dig, genom dator eller mobil.</p>

    <h3>Samlingar</h3>
    <p>Samlingar kan du se som en form av kategorier där du samlar flera anteckningar som tillhör en och samma typ. Det kan vara saker du ska komma ihåg, nyttiga länkar, eller kanske en inköpslista.</p>

    <h3>Taggar</h3>
    <p>Funktionalitet för att tagga anteckningar kommer framöver. Du kommer alltså på samma sätt som du ser taggar i bloggar, kunna tagga dina anteckningar. För att snabbare hitta
    en specifik anteckning du letar efter.</p>
</asp:Content>
