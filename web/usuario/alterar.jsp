<%@page import="booker.controller.UsuarioController"%>
<%@page import="booker.bean.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String name = request.getParameter("nome");
    String senha = request.getParameter("senha");
    String confirmarSenha = request.getParameter("confirmarSenha");
    String redirect = "editar.jsp";
    if (!senha.equals(confirmarSenha)) {
        redirect = "editar.jsp";
    } else {
        UsuarioController usuControl = new UsuarioController();
        Usuario usu = usuControl.consultar(usuario);
        if (usu == null) {
            redirect = "editar.jsp";
        } else {
            usu.setSenha(senha);
            usu.setNome(name);
            usu.setTipo("admin");
            usuControl.alterar(usu);
            session.setAttribute("usuario", usu);
            redirect = "../index.jsp";
        }
    }
    response.sendRedirect(redirect);
%>