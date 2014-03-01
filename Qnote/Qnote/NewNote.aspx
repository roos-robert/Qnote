<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewNote.aspx.cs" Inherits="Qnote.NewNote" %>

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

    <div class="container">

        <form role="form">
        <div class="form-group">
            <label for="noteHeader">Rubrik</label>
            <input type="email" class="form-control" id="noteHeader" placeholder="Skriv en rubrik för anteckningen">
          </div>
        <div class="form-group">
            <label for="note">Anteckning</label>
            <textarea class="form-control" rows="4"></textarea>
        </div>
        <div class="form-group">
            <label for="note">Välj samling</label>
            <select class="form-control">
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
          <p><button type="submit" class="btn btn-default">Spara</button></p>
        </form>

        <hr>

      <footer>
        <p>&copy; Copyright 2014 - Producerad av: <a href="http://www.robertroos.eu" target="_blank">RobertRoos.eu</a></p>
      </footer>
    </div>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
