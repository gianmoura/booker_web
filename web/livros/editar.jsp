<%@page import="booker.controller.LivrosController"%>
<%@page import="booker.bean.Livros"%>
<%@page import="booker.bean.Usuario"%>
<%
    String id = request.getParameter("id");
    LivrosController control = new LivrosController();
    Livros livro = new Livros();
    livro = control.getLivro(Long.parseLong(id));
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    Usuario usu = (Usuario) session.getAttribute("usuario");
    livro.setTitulo(titulo);
    livro.setAutor(autor);
    control.alterar(livro);
    String redirect = "livros.jsp";
    
    response.sendRedirect(redirect);
%>