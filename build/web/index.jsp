<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BODE TRACKER -- WOOHOO</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Bode Tracker</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="nav navbar-nav">
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/">Inicio</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/login.jsp">Login</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/registrar.jsp">Registrar</a></li>
                </ul>
            </div>
        </nav>
        <br>
        <div class="container">
            <div class="jumbotron">
                <h1>Bode Tracker</h1>
                <p class="lead">BEM VINDO AO BODE TRACKER, TODO MUNDO VAI MORRER</p>
                <p>Essa desgraça aqui faz a conexão com o banco de dados via jsp
                    pra fazer um CRUD do caralho (mas que merda hein) e demora muito 
                    pra resolver as parada, se tu quer interagir nesse projeto boa 
                    sorte :v</p>
                <div class="center-block">
                    <button class="btn btn-info">Login</button>
                    <button class="btn btn-default">Registrar</button>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js">
        </script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js">
        </script>
    </body>

</html>
