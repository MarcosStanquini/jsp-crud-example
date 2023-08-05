package br.ifsp.dsw3.model.domain;

public class Aluno {

    private String nome;
    private int id;
    private int codigo_disciplina;

    public Aluno(int id, String nome, int codigo_disciplina) {
        this.id = id;
        this.nome = nome;
        this.codigo_disciplina = codigo_disciplina;
    }

    public Aluno() {
        this.nome = "";
        this.id = -1;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCodigo_disciplina() {
        return codigo_disciplina;
    }

    public void setCodigo_disciplina(int codigo_disciplina) {
        this.codigo_disciplina = codigo_disciplina;
    }
}
