/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.github.eldemonstro.bodetracker.util;

import com.mysql.jdbc.*;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author demon
 */
public class ConexaoDB {
    public Connection getConnection() throws SQLException, ClassNotFoundException
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url ="jdbc:mysql://localhost:3306/bodetracker";
            String usuario = "root";
            String senha = "admin";
            return (Connection) DriverManager.getConnection(url,usuario,senha);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
