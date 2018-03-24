<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Note</title>
    <!-- meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>

    <!-- css -->
    <link rel="stylesheet" href="<spring:url value='/resources/css/Bootstrap/bootstrap.min.css'/>" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" media="screen" href="<spring:url value='/resources/css/style.css'/>" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="<spring:url value='/resources/css/main.css'/>">

    <!-- Scripts !-->
    <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
    <script src="<spring:url value='/resources/JS/Bootstrap/bootstrap.min.js'/>"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>

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

<!-- Page Content -->
<div class="container">
    <!-- /.row -->

    <div class="panel-title text-center">
        <h1 class="title">Sup NotePad</h1>
    </div>
    <hr>

    <!-- Call to Action Well -->
    <div class="row">
        <div class="col-lg-12">
            <div class="well text-center">
                ${note.name} <a class="glyphicon glyphicon-remove" href="/note/delete/${note.id}" alt="remove"></a>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="col-md-9 col-md-offset-2">
        <c:url var="post_url"  value="/note/edit" />
        <form:form method="POST" action="${post_url}" id="addClient" modelAttribute="note">
            <div class="form-group row">
                <label class="col-sm-2">Notepad</label>
                <div class="col-sm-6">
                    <!--
                    <select class="form-control" name="notepad.id" value ="${note.notepad.id}">
                            <option selected="selected" value="${note.notepad.id}"><c:out value="${note.notepad.name}"/></option>
                    </select> -->
                    <select class="selectpicker form-control" data-actions-box="true" data-size="10"
                            name="notepad.id" data-live-search="true">
                        <c:forEach items="${notePads}" var="notepad">
                            <c:choose>
                                <c:when test="${note.notepad.id == notepad.id}">
                                    <option selected="selected" value="${notepad.id}"><c:out value="${notepad.name}"/></option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${notepad.id}"><c:out value="${notepad.name}"/></option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="nomNote" class="col-sm-2 form-control-label">Nom : </label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nomNote" name="name" value="${note.name}">
                </div>
            </div>

            <div class="form-group row">
                <label for="description" class="col-sm-2 form-control-label">Description : </label>
                <div class="col-sm-6">
                    <textarea class="form-control" id="description" rows="6" name="description" maxlength="250">${note.description}</textarea>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-6 col-sm-offset-2">
                    <button type="submit" class="btn btn-info">Mettre à jour</button>
                </div>

            </div>
        </form:form>
    </div>


</div>
</body>
</html>