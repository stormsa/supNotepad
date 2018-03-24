<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 30/07/2016
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<spring:url value='/resources/css/Bootstrap/bootstrap.css'/>">

    <!-- Website css style -->
    <link rel="stylesheet" type="text/css" href="<spring:url value='/resources/css/main.css'/>">

    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    <title>Inscription</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h1 class="title">Sup NotePad</h1>
                <hr />
            </div>
        </div>
        <div class="main-login main-center">
<form:form method="POST" action="/user/add" id="subscribeForm" cssClass="form-horizontal"
           data-toggle="validator" modelAttribute="userAccount">
                <div class="form-group">
                    <form:label path="lastName" class="cols-sm-2 control-label">Votre nom</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <form:input path="lastName" id="name" type="text" name="name" placeholder="Nom" maxlength="50"
                                        class="form-control" required="true"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <form:label class="cols-sm-2 control-label" path="firstName">Votre prénom</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <form:input path="firstName" id="firstName" type="text" name="firstname" placeholder="Prenom" maxlength="50"
                                        class="form-control" required="true"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <form:label class="cols-sm-2 control-label" path="email">Votre Email</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <form:input path="email" id="signupEmail" type="email" maxlength="50" placeholder="Email" name="mail"
                                        class="form-control" required="true"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <form:label class="cols-sm-2 control-label" path="address">Adresse</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-home fa-lg" aria-hidden="true"></i></span>
                            <form:input id="adresse" name="adresse" path="address" type="text" placeholder="Adresse" class="form-control" required="true"/>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <form:label class="cols-sm-2 control-label" path="zipcode">Code Postal</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-home fa-lg" aria-hidden="true"></i></span>
                            <form:input id="codePostal" path="zipcode" type="text" placeholder="Code Postal" class="form-control" name="zipcode" required="true"/>

                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="Ville" class="cols-sm-2 control-label">Ville</label>
                    <form:label class="cols-sm-2 control-label" path="city">Ville</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-home fa-lg" aria-hidden="true"></i></span>
                            <form:input id="ville" path="city"  type="text" placeholder="Ville" class="form-control" name="city" required="true"/>

                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="password" class="cols-sm-2 control-label">Mot de Passe</form:label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <form:input id="password" type="password" name="password" path="password" maxlength="25" class="form-control"
                                   placeholder="Au moins 6 caractères" length="40" required="true"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="cols-sm-2 control-label" name="signupPasswordagain">Encore</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input id="signupPasswordagain" type="password" data-match="#password" maxlength="25"
                                   placeholder="Confirmez votre mot de passe" name="passwordConfirm" class="form-control" required="true"></div>
                    </div>
                </div>

                <div class="form-group">
                    <button type="submit" value="login" class="btn btn-lg btn-block login-button">Enregister</button>
                </div>
                <div class="login-register">
                    <a href="/login">Se connecter</a>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="<spring:url value='/resources/js/bootstrap/bootstrap.js'/>"></script>
</body>
</html>
