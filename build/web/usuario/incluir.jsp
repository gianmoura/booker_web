<%@page import="io.github.eldemonstro.bodetracker.controller.UsuarioController" %>
<%@page import="io.github.eldemonstro.bodetracker.bean.Usuario" %>
<% 
    String email = request.getParameter("email");
    String name = request.getParameter("nome");
    String senha = request.getParameter("senha");
    String confirmarSenha = request.getParameter("confirmarSenha");
    String message;
    if (senha != confirmarSenha) {
        response.sendRedirect("registrar.jsp");
    }
    message = confirmarSenha + " " + senha;
    UsuarioController usuControl = new UsuarioController();
    Usuario usu = usuControl.consultar(email);
    //if(usu.getEmail() != email) {
      //  message = "Email not found in database, you can continue";
    //}
%>
<h1><%=message%></h1>