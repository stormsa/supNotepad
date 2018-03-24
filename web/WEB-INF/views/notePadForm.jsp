<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Formulaire d'ajout d'un notepad</title>
    <!-- css -->
    <link rel="stylesheet" href="<spring:url value='/resources/css/Bootstrap/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<spring:url value='/resources/css/font-awesome.min.css'/>" />
    <link rel="stylesheet" media="screen" href="<spring:url value='/resources/css/style.css'/>" />
    <!-- css -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
    <link href='https://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet' type='text/css'>

    <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
    <script src="<spring:url value='/resources/JS/Bootstrap/bootstrap.min.js'/>"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

</head>
<body>
<nav class="navbar navbar-inverse navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/index"/>">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="<c:url value="/notepad/add"/>">Ajouter un notepad</a>
                </li>
                <li>
                    <a href="<c:url value="/note/add"/>">Ajouter une note</a>
                </li>
                <a href="#" id="logo"> Sup NotePad</a>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<header>
    <a href="<c:url value="/index"/>" role="button" style="position:absolute;top:70px;left:10px;"> <span class="glyphicon glyphicon-chevron-left"></span> </a>
    <h3 align="center"> Fiche d'ajout d'un notepad</h3>
</header>
<div id="content">
    <br/>
    <div class="col-md-9 col-md-offset-3">
        <c:url var="post_url"  value="/notepad/add" />
        <form:form method="POST" action="${post_url}" id="addProject" modelAttribute="notepad">

            <div class="form-group row">
                <label for="nomClient" class="col-sm-2 form-control-label">Nom : </label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="name" id="nomClient" >
                </div>
            </div>

            <div class="form-group row">
                <label for="descriptionClient" class="col-sm-2 form-control-label">Description : </label>
                <div class="col-sm-5">
                    <textarea class="form-control" id="descriptionClient" name="description" rows="6" maxlength="250"></textarea>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="reset" class="btn btn-warning"> Effacer</button>
                    <button type="submit" class="btn btn-info">Valider</button>
                </div>
            </div>
        </form:form>
    </div>

</div>

</body>
</html>