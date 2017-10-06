<%@page import="booker.controller.LivrosController"%>
<%@page import="booker.bean.Livros"%>
<%
    String id = request.getParameter("id");
    LivrosController control = new LivrosController();
    Livros livro = new Livros();
    livro = control.getLivro(Long.parseLong(id));
    control.exclui(livro);
    String redirect = "livros.jsp";
    response.sendRedirect(redirect);
    
%>