<%-- 
    Document   : livros
    Created on : 04/10/2017, 20:39:43
    Author     : Moura
--%>

<%@page import="java.util.List"%>
<%@page import="booker.bean.Usuario"%>
<%@page import="booker.bean.Livros"%>
<%@page import="booker.controller.LivrosController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usu = (Usuario) session.getAttribute("usuario");
    LivrosController livroControl = new LivrosController();
    List<Livros> livros = livroControl.getLista(usu);
    String debug;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <meta charset=UTF-8">
        <title>Livros</title>
        
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Excluir Livro</h4>
                    </div>
                    <div class="modal-body">
                        Deseja realmente excluir este Livro?
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-danger btn-ok">Excluir</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Add Livro -->
        <div class="modal fade" id="add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Adicionar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Adicionar Livro</h4>
                    </div>
                    <div class="modal-body">
                        <form action="incluir.jsp" method="POST">
                            <div class="form-group">
                                <label for="Titulo">Titulo:</label>
                                <input required type="input" class="form-control" id="titulo" name="titulo" aria-describedby="titulo" placeholder="Titulo do livro">

                            </div>
                            <div class="form-group">
                                <label for="autor">Autor:</label>
                                <input required type="input" class="form-control" id="autor"  name="autor" placeholder="Autor do livro">
                            </div>
                            <button type="submit" class="btn btn-primary">Adicionar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Edit Livro -->
        <div class="modal fade" id="edit-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Adicionar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalLabel">Editar Livro</h4>
                    </div>
                    <div class="modal-body">
                        <form action="editar.jsp" method="POST">
                            <div class="form-group">
                                <label for="Titulo">Titulo:</label>
                                <input required type="input" class="form-control" id="titulo" name="titulo" aria-describedby="titulo" placeholder="Titulo do livro">

                            </div>
                            <div class="form-group">
                                <label for="autor">Autor:</label>
                                <input required type="input" class="form-control" id="autor"  name="autor" placeholder="Autor do livro">
                        
                            </div>
                            <div class="form-group">
                                <input required type="hidden" class="form-control teste" id="id"  name="id" >
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-edit">Salvar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </form>
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
        <div class="container col-md-10">
            
            <div id="main" class="container-fluid">
                <div id="top" class="row">
                    <div class="col-md-3">
                        <h2>Meus Livros</h2>
                    </div>

                    <div class="col-md-6">
                        <div class="input-group h2">
                            <input name="data[search]" class="form-control" id="search" type="text" placeholder="Pesquisar livros">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="submit">
                                    Buscar
                                </button>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <a href="#" class="btn btn-primary pull-right h2" data-toggle="modal" data-target="#add-modal" >Adicionar</a>
                    </div>
                </div> <!-- /#top -->

                <hr />
                <div id="list" class="row">
                    <div class="table-responsive col-md-12">
                        <table class="table table-striped" cellspacing="0" cellpadding="0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>TITULO</th>
                                    <th>AUTOR</th>
                                    <th class="actions">Ações</th>
                                 </tr>
                            </thead>
                            <tbody>
                                
                                <% for (Livros livro : livros) { %>
                                    <tr>
                                        <td><%=livro.getId() %></td>
                                        <td><%=livro.getTitulo() %></td>
                                        <td><%=livro.getAutor() %></td>
                                        <td class="actions">
                                            <a class="btn btn-warning btn-xs" href="#" data-href="<%=livro.getId() %>" data-toggle="modal" data-target="#edit-modal">Editar</a>
                                            <a class="btn btn-danger" href="#" data-href="${pageContext.request.contextPath}/livros/excluir.jsp?id=<%=livro.getId() %>" data-toggle="modal" data-target="#delete-modal" >Excluir</a>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                         </table>

                     </div>
                </div> <!-- /#list -->

                <div id="bottom" class="row">

                </div> <!-- /#bottom -->
            </div>  <!-- /#main -->
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
        <script>
            $('#edit-modal').on('show.bs.modal', function(e) {
                $(this).find('.teste').attr('value', $(e.relatedTarget).data('href'));
            });
        </script>
        <!--
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        -->
    </body>
</html>

