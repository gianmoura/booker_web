<%-- 
    Document   : registrar
    Created on : 01/09/2017, 12:02:51
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">Booker</a>
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
        </header>
        <br>
        <div class="container col-md-8">
            <h1>Registrar:</h1>
            <form action="entrar.jsp" method="POST">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input required type="email" class="form-control" id="email" name="email" aria-describedby="email" placeholder="Seu email">
                </div>
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input required type="password" class="form-control" name="senha" id="senha" placeholder="Senha">
                </div>
                <button type="submit" class="btn btn-primary">Entrar</button>
            </form>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js">
        </script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js">
        </script>
    </body>
</html>
