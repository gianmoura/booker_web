/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package booker.db;

import booker.conexao.ConexaoDB;
import java.sql.*;
import booker.bean.Livros;
import booker.bean.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Moura
 */
public class LivrosDao {
    private final Connection c;

    public LivrosDao() throws SQLException, ClassNotFoundException {
        this.c = new ConexaoDB().getConnection();
    }
    
    public Livros busca(Long id) throws SQLException {
        String sql = "select * from livros WHERE id = ?";
        Livros livro = new Livros();
        // seta os valores
        try (
            // prepared statement para inserção
            PreparedStatement stmt = this.c.prepareStatement(sql)) {
            // seta os valores
            stmt.setLong(1, id);
            try (
                // executa
                ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // criando o objeto Usuario
                    livro.setId(rs.getLong(1));
                    livro.setTitulo(rs.getString(2));
                    livro.setAutor(rs.getString(3));
                    livro.setIdUsuario(rs.getLong(4));
                }
            }
        }
        c.close();
        return livro;
    }
    
    
    public List<Livros> busca(Usuario usu) throws SQLException {
    
    List<Livros> livros;
    livros = new ArrayList<>();
    String sql = "select * from livros WHERE idUsuario = ?";

    // seta os valores
    try (
        // prepared statement para inserção
        PreparedStatement stmt = this.c.prepareStatement(sql)) {
        // seta os valores
        stmt.setLong(1, usu.getId());
        try (
            // executa
            ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
            // criando o objeto Livro
            Livros livro = new Livros();
            livro.setId(rs.getLong(1));
            livro.setTitulo(rs.getString(2));
            livro.setAutor(rs.getString(3));
            livro.setIdUsuario(rs.getLong(4));
            // adiciona o usu à lista de usus
            livros.add(livro);
            }
            rs.close();
        }
    }
    c.close();
    return livros;
    }
    
    public List<Livros> lista(String text, Usuario usu) throws SQLException {
        // usus: array armazena a lista de registros
        List<Livros> livroLista;
        livroLista = new ArrayList<>();
        String sql = "select * from livros where titulo like ? or autor like ? and idUsuario = ?";
        // seta os valores
        try (PreparedStatement stmt = this.c.prepareStatement(sql)) {
            // seta os valores
            stmt.setString(1, "%" + text + "%");
            stmt.setString(2, "%" + text + "%");
            stmt.setLong(3, usu.getId());

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // criando o objeto Usuario
                    Livros livro = new Livros();
                    livro.setId(rs.getInt(1));
                    livro.setTitulo(rs.getString(2));
                    livro.setAutor(rs.getString(3));
                    livro.setIdUsuario(rs.getInt(4));
                    // adiciona o usu à lista de usus
                    livroLista.add(livro);
                }
            }
            c.close();
        }
        return livroLista;

    }
    
    public List<Livros> lista(Usuario usu) throws SQLException {
        // usus: array armazena a lista de registros
        List<Livros> livroLista = new ArrayList<>();

        String sql = "select * from livros where idUsuario = ?";
        // seta os valores
        try (PreparedStatement stmt = this.c.prepareStatement(sql)) {
            // seta os valores
            stmt.setLong(1, usu.getId());

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // criando o objeto Usuario
                    Livros livro = new Livros();
                    livro.setId(rs.getInt(1));
                    livro.setTitulo(rs.getString(2));
                    livro.setAutor(rs.getString(3));
                    livro.setIdUsuario(rs.getInt(4));
                    // adiciona o usu à lista de usus
                    livroLista.add(livro);
                }
            }
            c.close();
        }
        return livroLista;

    }
    
    public Livros inseri(Livros livro) throws SQLException {
        String sql = "insert into Livros" + " (titulo, autor, idusuario)" + " values (?,?,?)";

        // seta os valores
        try ( // prepared statement para inserção
                PreparedStatement stmt = c.prepareStatement(sql)) {
            // seta os valores
            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.setLong(3, livro.getIdUsuario());
            // executa
            stmt.execute();
            stmt.close();
            c.close();
        }
        return livro;
    }

    public Livros exclui(Livros livro) throws SQLException {
        String sql = "delete from Livros WHERE id = ?";
        
        try ( 
            // prepared statement para exclusão
            PreparedStatement stmt = c.prepareStatement(sql)) {
            // seta os valores
            stmt.setLong(1, livro.getId());
            // executa
            stmt.execute();
        }
        c.close();
        return livro;
    }

    public Livros altera(Livros livro) throws SQLException {
        String sql = "UPDATE Livros SET titulo = ?, autor = ? WHERE id = ?";
        
        try ( // prepared statement para inserção
            PreparedStatement stmt = c.prepareStatement(sql)) {
            // seta os 
            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.setLong(3, livro.getId());
            // executa
            stmt.execute();
            stmt.close();
            c.close();
        }
        return livro;
    }
}
