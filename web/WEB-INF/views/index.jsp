<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Accueil</title>
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
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

  <!-- Scripts !-->
  <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
  <script src="<spring:url value='/resources/JS/Bootstrap/bootstrap.min.js'/>"></script>
  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
  <!-- Google Fonts -->
  <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

</head>
<body>

<!-- Navigation -->
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
        <a href="#" id="logo">Sup NotePad</a>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="<c:url value="/login/logOff"/>" style="color:red">Deconnexion</a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

  <!-- Heading Row -->
  <div class="panel-title text-center">
    <h1 class="title">Sup NotePad</h1>
    <hr />
  </div>
  <div class="row well text-center">
      <h2>Bienvenue sur votre dashboard </h2>
      <p>Sup Note pad vous permet de créer et visualiser des notes et notepad </p>
      <p>Ci-dessous la liste de vos notePad ! <a class="glyphicon glyphicon-plus" href="/notepad/add" alt="ajouter"></a></p>
  </div>
  <!-- /.row -->

  <hr>

  <!-- Call to Action Well -->
  <div class="row">
    <div class="col-lg-12">
      <div class="text-center">

        <br/>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  <div class="row">
    <c:forEach items="${notePads}" var="notepad">
      <div class="col-md-3 portfolio-item" style="text-align: center">
        <button type="button" value="${notepad.id}" class="glyphicon glyphicon-remove delete_note"></button>
        <!--<a class="glyphicon glyphicon-remove" href="/notepad/delete/" alt="remove"></a> !-->
        <a href="<c:url value='/note/${notepad.id}"'/>">
          <img class="img-responsive" src="<c:url value='/resources/img/notepad.png'/>" alt="">
        </a>
        <h3 class="notepad_title">
          <a href="<c:url value='/note/${notepad.id}"'/>">${notepad.name}</a>
        </h3>
        <p class="notepad_description"><c:out value="${notepad.description}"/></p>
      </div>
    </c:forEach>
  </div>
  <div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Suppression notebook</h4>
        </div>
        <div class="modal-body">
          <p>Déplacer les notes vers un autre notebook</p>
          <p>
            <select class="selectpicker form-control" id="move_note" data-actions-box="true" data-title="Non" data-size="10"
                    name="notepad.id" data-live-search="true">
              <c:forEach items="${notePads}" var="notepad">
                <option value="${notepad.id}"><c:out value="${notepad.name}"/></option>
              </c:forEach>
            </select>

          </p>
        </div>
        <div class="modal-footer">
          <button id="copy" class="btn btn-info">Supprimer</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
        </div>
      </div>

    </div>
  </div>

</div>
<script>
  $(document).ready(function () {
    $('.selectpicker').selectpicker({
      includeSelectAllOption: true,
      noneSelectedText: '--',
      selectAllText: 'Tout ',
      deselectAllText: 'Aucun'
    });
  });
  var movenote, idnote;
  // Get the notepad to delete
  $('.delete_note').on('click', function() {
    console.log($(this).attr("value"));
    idnote = $(this).attr("value");
    $('#myModal').modal("show");
  });
  // Get the new notepad to copy notes
  $('#move_note').on('change', function() {
    movenote = this.value; // or $(this).val()
  });

  $('#copy').on('click', function() {
    window.location.replace("/notepad/delete?notepadId="+idnote+"&copyto="+movenote);
  });

</script>
</body>
</html>