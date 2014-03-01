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

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Qnote</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Hem</a></li>
            <li><a href="#about">Om</a></li>          
          </ul>
        </div>
      </div>
    </div>

    <div class="jumbotron">
      <div class="container">
        <h1>Välkommen!</h1>
        <p>Qnote hjälper dig genom att spara alla dina anteckningar direkt i molnet.</p>
        <p><a class="btn btn-primary btn-lg" role="button">Kom igång &raquo;</a></p>
      </div>
    </div>

    <div class="container">

        <h2>Nyheter</h2>
        <p>Lorem Ipsum.</p>
        <p><a class="btn btn-default" href="#" role="button">Läs vidare &raquo;</a></p>

        <hr>

      <footer>
        <p>&copy; Copyright 2014 - Producerad av: <a href="http://www.robertroos.eu" target="_blank">RobertRoos.eu</a></p>
      </footer>
    </div>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>