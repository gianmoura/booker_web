<%@page import="io.github.eldemonstro.bodetracker.controller.UsuarioController" %>
<%@page import="io.github.eldemonstro.bodetracker.bean.Usuario" %>
<%
    String email = request.getParameter("email");
    String name = request.getParameter("nome");
    String senha = request.getParameter("senha");
    String confirmarSenha = request.getParameter("confirmarSenha");
    String redirect = "registrar.jsp";
    if (!senha.equals(confirmarSenha)) {
        redirect = "registrar.jsp";
    } else {
        UsuarioController usuControl = new UsuarioController();
        Usuario usu = usuControl.consultar(email);
        if (email.equalsIgnoreCase(usu.getEmail())) {
            redirect = "registrar.jsp";
        } else {
            usu.setSenha(senha);
            usu.setNome(name);
            usu.setEmail(email);
            usu.setTipo("admin");
            usuControl.incluir(usu);
            redirect = "../index.jsp";
        }
    }
    response.sendRedirect(redirect);
%>