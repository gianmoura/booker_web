<%@page import="io.github.eldemonstro.bodetracker.controller.UsuarioController"%>
<%@page import="io.github.eldemonstro.bodetracker.bean.Usuario"%>
<%@page import="io.github.eldemonstro.bodetracker.db.UsuarioDao"%>
<%
    UsuarioController usuControll = new UsuarioController();
    Usuario usu = (Usuario) session.getAttribute("usuario");
    usuControll.exclui(usu);
    session.setAttribute("usuario", null);
    response.sendRedirect("../index.jsp");
%>