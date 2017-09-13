<%@page import="io.github.eldemonstro.bodetracker.controller.UsuarioController" %>
<%@page import="io.github.eldemonstro.bodetracker.bean.Usuario" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String redirect = "registrar.jsp";
    UsuarioController usuControl = new UsuarioController();
    Usuario usu = usuControl.consultar(email);
    if (!email.equalsIgnoreCase(usu.getEmail())) {
        redirect = "registrar.jsp";
    } else {
        session.setAttribute("usuario", usu);
        redirect = "../index.jsp";
    }
    response.sendRedirect(redirect);
%>