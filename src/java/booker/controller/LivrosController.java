/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package booker.controller;


import booker.bean.Livros;
import booker.bean.Usuario;
import booker.db.LivrosDao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Moura
 */
public class LivrosController {

    /**
     *
     * @param usuario
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public List<Livros> getLista(Usuario usuario) throws SQLException, ClassNotFoundException{
        LivrosDao l = new LivrosDao();
        List<Livros> lista = l.busca(usuario);
        List<Livros> livros;
            livros = new ArrayList<>();
        lista.forEach((livroLista) -> {
            livros.add(livroLista);
        });
        return livros;
    }
    
    public Livros getLivro(Long id) throws SQLException, ClassNotFoundException{
        Livros livro = new Livros();
        LivrosDao l = new LivrosDao();
        livro = l.busca(id);
        return livro;
    }
    
    public Livros incluir(Livros livro) throws SQLException, ClassNotFoundException {
        LivrosDao livroDAO = new LivrosDao();
        Livros l = new Livros();
        l = livroDAO.inseri(livro);
        return l;
    }
    
    public void alterar(Livros livro) throws SQLException, ClassNotFoundException {
        LivrosDao livroDAO = new LivrosDao();
        livroDAO.altera(livro);
    }
    
    public void exclui(Livros livro) throws SQLException, ClassNotFoundException{
        LivrosDao livroDAO = new LivrosDao();
        livroDAO.exclui(livro);
    }
}
