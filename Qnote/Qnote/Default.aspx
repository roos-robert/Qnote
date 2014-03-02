<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Qnote.Default1" ViewStateMode="Disabled" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Qnote - snabba anteckningar för mobil och webb">
    <meta name="author" content="Robert Roos">
    <link rel="shortcut icon" href="favicon.ico">
    <title>Qnote</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jumbotron.css" rel="stylesheet">
  </head>

  <body>
    <form id="form1" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="Default.aspx">Qnote</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="Default.aspx">Hem</a></li>
            <li><a href="NewNote.aspx">Ny anteckning</a></li>          
          </ul>
        </div>
      </div>
    </div>

    <div class="jumbotron">
      <div class="container">
        <h1>Välkommen!</h1>
        <p>Qnote hjälper dig genom att spara alla dina anteckningar direkt i molnet.</p>
      </div>
    </div>

    <div class="container">

        <div id="LoginConfirmation" class="alert alert-success" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <asp:Literal ID="SuccessLiteral" runat="server"></asp:Literal>
        </div>

        <asp:Panel ID="LoginPanel" runat="server">
            <h2>Demo</h2>
            <p>Logga in nedan för ett demo av Qnote.</p>
            <div class="form-group">
                <label for="userEmail">Användarnamn</label>
                <input type="email" class="form-control" id="userEmail" placeholder="Din e-post" value="ellen@lnu.se" readonly="readonly">
            </div>
            <div class="form-group">
                <label for="userPassword">Lösenord</label>
                <input type="password" class="form-control" id="userPassword" placeholder="Ditt lösenord" value="1234" readonly="readonly">
            </div>
                <p><asp:Button ID="LoginButton" runat="server" class="btn btn-default" Text="Logga in" OnClick="LoginButton_Click" /></p>
        </asp:Panel>
        <hr>

      <footer>
        <p>&copy; Copyright 2014 - Producerad av: <a href="http://www.robertroos.eu" target="_blank">RobertRoos.eu</a></p>
      </footer>
    </div>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </form>
  </body>
</html>