/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package booker.bean;

/**
 *
 * @author Moura
 */
public class Livros {
    long id;
    String titulo;
    String autor;
    long idUsuario;
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }
    
    public long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public Livros(String titulo, String autor, Long idUsuario) {
        this.titulo = titulo;
        this.autor = autor;
        this.idUsuario = idUsuario;
    }
    
    public Livros(){
        
    }
}
