<%@page import="booker.controller.UsuarioController"%>
<%@page import="booker.bean.Usuario"%>
<%@page import="booker.db.UsuarioDao"%>
<%
    UsuarioController usuControll = new UsuarioController();
    Usuario usu = (Usuario) session.getAttribute("usuario");
    usuControll.exclui(usu);
    session.setAttribute("usuario", null);
    response.sendRedirect("../index.jsp");
%>