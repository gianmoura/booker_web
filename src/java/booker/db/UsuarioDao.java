
package booker.db;

import booker.conexao.ConexaoDB;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import booker.bean.Usuario;

/**
 *
 * @author Fabricio Bezerra (eldemonstro.github.io)
 * Qurery do mysql:
 * CREATE DATABASE IF NOT EXISTS bodetracker
 * CREATE TABLE IF NOT EXISTS `BodeTracker`.`usuarios` (`id` INT NOT NULL AUTO_INCREMENT, `nome` VARCHAR(255) NOT NULL, `email` VARCHAR(255) NOT NULL, `senha` VARCHAR(255) NOT NULL, `tipo` VARCHAR(45) NOT NULL, PRIMARY KEY (`id`)) ENGINE = InnoDB;
 */
public class UsuarioDao {

    private final Connection c;

    public UsuarioDao() throws SQLException, ClassNotFoundException {
        this.c = new ConexaoDB().getConnection();
    }

    public Usuario busca(Usuario usu) throws SQLException {
        String sql = "select * from usuarios WHERE id = ?";

        // seta os valores
        try ( // prepared statement para inserção
                PreparedStatement stmt = this.c.prepareStatement(sql)) {
            // seta os valores
            stmt.setLong(1, usu.getId());
            // executa
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // criando o objeto Usuario
                usu.setId(rs.getInt(1));
                usu.setEmail(rs.getString(2));
                usu.setNome(rs.getString(3));
                usu.setSenha(rs.getString(4));
                usu.setTipo(rs.getString(5));
                // adiciona o usu à lista de usus
            }
            rs.close();
        }
        return usu;
    }

    public Usuario busca(String email) throws SQLException {
        String sql = "select * from usuarios WHERE email = ?";

        Usuario usu = new Usuario();

        // seta os valores
        try ( 
            PreparedStatement stmt = this.c.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                usu.setId(rs.getLong(1));
                usu.setNome(rs.getString(2));
                usu.setEmail(rs.getString(3));
                usu.setSenha(rs.getString(4));
                usu.setTipo(rs.getString(5));
            }
            rs.close();
        }
        return usu;
    }

    public List<Usuario> lista(Usuario usuEnt) throws SQLException {
        // usus: array armazena a lista de registros
        List<Usuario> usus = new ArrayList<>();

        String sql = "select * from usuarios where nome like ?";
        // seta os valores
        try (PreparedStatement stmt = this.c.prepareStatement(sql)) {
            // seta os valores
            stmt.setString(1, "%" + usuEnt.getNome() + "%");

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // criando o objeto Usuario
                Usuario usu = new Usuario();
                usu.setId(rs.getInt(1));
                usu.setEmail(rs.getString(2));
                usu.setNome(rs.getString(3));
                usu.setSenha(rs.getString(4));
                usu.setTipo(rs.getString(5));
                // adiciona o usu à lista de usus
                usus.add(usu);
            }

            rs.close();
        }
        return usus;

    }

    public Usuario inseri(Usuario usu) throws SQLException {
        String sql = "insert into usuarios" + " (email, nome, senha, tipo)" + " values (?,?,?,?)";

        // seta os valores
        try ( // prepared statement para inserção
                PreparedStatement stmt = c.prepareStatement(sql)) {
            // seta os valores
            stmt.setString(1, usu.getEmail());
            stmt.setString(2, usu.getNome());
            stmt.setString(3, usu.getSenha());
            stmt.setString(4, usu.getTipo());
            // executa
            stmt.execute();
        }
        return usu;
    }

    public Usuario exclui(Usuario usu) throws SQLException {
        String sql = "delete from usuarios WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setLong(1, usu.getId());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return usu;
    }

    public Usuario altera(Usuario usu) throws SQLException {
        String sql = "UPDATE usuarios SET nome = ?, senha = ?, tipo = ? WHERE id = ?";
        System.out.println(usu.getId());
        // seta os valores
        try ( // prepared statement para inserção
                PreparedStatement stmt = c.prepareStatement(sql)) {
            // seta os 
            stmt.setString(1, usu.getNome());
            stmt.setString(2, usu.getSenha());
            stmt.setString(3, usu.getTipo());
            stmt.setLong(4, usu.getId());
            // executa
            stmt.execute();
        }
        return usu;
    }

    public Usuario validaLogin(Usuario usu) throws SQLException {
        String sql = "select * from usuarios WHERE login = ? AND senha = ?";
        // seta os valores
        try (
            PreparedStatement stmt = this.c.prepareStatement(sql)) {
            stmt.setString(2, usu.getSenha());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                usu.setId(rs.getInt(1));
                usu.setEmail(rs.getString(2));
                usu.setNome(rs.getString(3));
                usu.setSenha(rs.getString(4));
                usu.setTipo(rs.getString(5));
            }
        }
        return usu;
    }

}
