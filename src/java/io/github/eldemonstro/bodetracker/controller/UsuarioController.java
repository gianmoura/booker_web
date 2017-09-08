/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.github.eldemonstro.bodetracker.controller;

import io.github.eldemonstro.bodetracker.bean.Usuario;
import io.github.eldemonstro.bodetracker.db.UsuarioDao;
import java.sql.SQLException;
        
/**
 *
 * @author demon
 */
public class UsuarioController {
    public Usuario consultar(String email) throws SQLException, ClassNotFoundException{
        UsuarioDao usuDAO = new UsuarioDao();
        Usuario usu = usuDAO.busca(email);
        return usu;
    }
}
