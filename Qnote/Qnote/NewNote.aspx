<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewNote.aspx.cs" Inherits="Qnote.NewNote" ViewStateMode="Disabled" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Skriv och spara en ny anteckning vid Qnote.">
    <meta name="author" content="Robert Roos">
    <link rel="shortcut icon" href="favicon.ico">
    <title>Ny Anteckning</title>
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
            <li><a href="Default.aspx">Hem</a></li>
            <li class="active"><a href="NewNote.aspx">Ny anteckning</a></li>        
          </ul>
        </div>
      </div>
    </div>

    <div class="jumbotron">
      <div class="container">
        <h1>Ny anteckning</h1>
        <p>Skriv din anteckning nedan.</p>
      </div>
    </div>

        <div id="errorNotif" class="errorNotif" runat="server" visible="false">
            <div class="alert alert-danger fade in">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4>Attans! Något gick snett!</h4>
              <p>Har du verkligen loggat in?</p>
            </div>
        </div>

    <div id="NewNoteArea" class="container" runat="server">

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
            <p>&nbsp;</p>
          <p><asp:Button ID="SaveButton" runat="server" class="btn btn-default" Text="Spara anteckning" /></p>

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