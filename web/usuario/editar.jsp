<%@page import="io.github.eldemonstro.bodetracker.bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usu = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar - Bode Tracker</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">Bode Tracker</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav">
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/">Inicio</a></li>
                            <% if (usu == null) { %>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/login.jsp">Login</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/registrar.jsp">Registrar</a></li>
                            <% } else { %>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/editar.jsp">Editar</a></li>
                        <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/sair.jsp">Sair</a></li>
                        <% }%></ul>
                </div>
            </nav>
        </header>
        <br>
        <div class="container">
            <h1>Registrar:</h1>
            <form action="alterar.jsp" method="POST">
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input required type="input" class="form-control" id="nome" name="nome" value="${usu.getNome()}">
                </div>
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input required type="password" class="form-control" name="senha" id="senha" placeholder="Senha">
                </div>
                <div class="form-group">
                    <label for="confirmarSenha">Confirme a sua senha:</label>
                    <input required type="password" class="form-control" id="confirmarSenha" name="confirmarSenha" placeholder="Confirme senha">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <a class="btn btn-danger" href="excluir.jsp">Excluir</a>
            </form>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js">
        </script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js">
        </script>
    </body>
</html>
