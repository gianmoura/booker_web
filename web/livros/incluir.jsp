<%@page import="booker.controller.LivrosController"%>
<%@page import="booker.bean.Livros"%>
<%@page import="booker.bean.Usuario"%>
<%
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    Usuario usu = (Usuario) session.getAttribute("usuario");
    LivrosController control = new LivrosController();
    Livros livro = new Livros();
    livro.setTitulo(titulo);
    livro.setAutor(autor);
    livro.setIdUsuario(usu.getId());
    control.incluir(livro);
    String redirect = "livros.jsp";
    
    response.sendRedirect(redirect);
%>