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
import java.util.Iterator;
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
    public List<Livros> getLivros(Usuario usuario) throws SQLException, ClassNotFoundException{
        LivrosDao l = new LivrosDao();
        List<Livros> lista = l.busca(usuario);
        List<Livros> livros;
            livros = new ArrayList<>();
        lista.forEach((livroLista) -> {
            livros.add(livroLista);
        });
        return livros;
    }
    
    public Livros incluir(Livros livro, Usuario usu) throws SQLException, ClassNotFoundException {
        LivrosDao livroDAO = new LivrosDao();
        Livros l = livroDAO.inseri(livro, usu);
        return l;
    }
    
    public Livros alterar(Livros livro) throws SQLException, ClassNotFoundException {
        LivrosDao livroDAO = new LivrosDao();
        Livros l = livroDAO.altera(livro);
        return l;
    }
    
    public void exclui(Livros livro) throws SQLException, ClassNotFoundException{
        LivrosDao livroDAO = new LivrosDao();
        livroDAO.exclui(livro);
    }

    private void ForEach(List<Livros> lista) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
