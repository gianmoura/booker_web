<%@page import="booker.bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usu = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booker</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">Booker</a>
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
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/editar.jsp">Perfil</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/livros/livros.jsp">Livros</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/usuario/sair.jsp">Sair</a></li>
                    <% }%>
                </ul>
            </div>
        </nav>
        <br>
        <div class="container">
            <div class="jumbotron">
                <h1>Booker</h1>
                <% if (usu != null) { %>
                <p>BEM VINDO AO BOOKER <%=usu.getNome()%></p>
                <% }%>
                <div class="center-block">
                    <% if (usu == null) { %>
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/usuario/login.jsp">Login</a>
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/usuario/registrar.jsp">Registrar</a>
                    <% } else { %>
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/usuario/editar.jsp">Editar</a>
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/usuario/sair.jsp">Sair</a>

                    <% } %>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js">
        </script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js">
        </script>
    </body>

</html>
