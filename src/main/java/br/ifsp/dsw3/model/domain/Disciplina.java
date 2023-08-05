package br.ifsp.dsw3.model.domain;

public class Disciplina {

    private int codigo;
    private String nome;

    public Disciplina() {
        this.nome = "";
    }

    public Disciplina(int codigo, String nome) {
        this.codigo = codigo;
        this.nome = nome;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
