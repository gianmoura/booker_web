<%@page import="booker.bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usu = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Excluir Perfil</h4>
                    </div>
                    <div class="modal-body">
                        Deseja realmente excluir permanentemente seu perfil?
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-danger btn-ok">Excluir</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <header>
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
                        <% }%></ul>
                </div>
            </nav>
        </header>
        <br>
        
        <div class="container col-md-8">
            <h1>Editar</h1>
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
                <button type="submit" class="btn btn-primary">Salvar</button>
                <a class="btn btn-danger" href="#" data-href="${pageContext.request.contextPath}/usuario/excluir.jsp" data-toggle="modal" data-target="#delete-modal" >Excluir Perfil</a>
                
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
        
        <script>
            $('#delete-modal').on('show.bs.modal', function(e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));

                $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
            });
        </script>
    </body>
</html>
