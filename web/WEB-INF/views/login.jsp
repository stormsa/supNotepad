<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" rel="stylesheet">
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



    <title>Connexion</title>
</head>
<body>

<div class="container">

    <script id="metamorph-1-start" type="text/x-placeholder"></script>
    <script id="metamorph-21-start" type="text/x-placeholder"></script>

    <div class="container text-center">
        <div class="form-signin" data-ember-action="2">
            <div class="panel-heading">
                <div class="panel-title text-center">
                    <h1 class="title">Sup NotePad</h1>
                    <hr />
                </div>
            </div>

            <small class="text-muted">Connexion par les reseaux sociaux</small>
            <br><br>


            <p>
                <button class="btn btn-primary social-login-btn social-facebook" type="subtmit" onclick="" value="Facebook login" id="fbLogin" class="login"><i class="fa fa-facebook"></i></button>
            </p>
            <p>
                <button class="btn btn-primary social-login-btn social-google" type="subtmit" onclick="" value="Google login" id="googlelogin" class="login"><i class="fa fa-google-plus"></i></button>
            </p>
            <br><br>


            <small class="text-muted">Connexion sur le site</small>
            <br><br>
            <form:form action="/login" method="post" modelAttribute="loginForm">

                <form:input id="ember360" class="ember-view ember-text-field form-control login-input" placeholder="Email" path="username" type="text"/>
                <form:input id="ember361" class="ember-view ember-text-field form-control login-input-pass" placeholder="Mot de passe" path="password" type="password"/>

                <script id="metamorph-22-start" type="text/x-placeholder"></script><script id="metamorph-22-end" type="text/x-placeholder"></script>

                <button class="btn btn-lg btn-primary btn-block" type="submit" value="login" data-bindattr-3="3">Se connecter</button>
            </form:form>
            <br>
            <small class="create-account text-muted">Vous n'avez pas de compte chez nous ni de fb / google
                <a href="<spring:url value='/user/add'/>"> Inscrivez-vous ! </a> </small>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="<spring:url value='/resources/JS/Bootstrap/bootstrap.js'/>"></script>
<!-- Social network connection !-->
<!--Register Google Api-->
<script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
<script src="<spring:url value='/resources/JS/loginAPI/facebookLogin.js'/>"></script>
<script src="<spring:url value='/resources/JS/loginAPI/googleLogin.js'/>"></script>
</body>
</html>
