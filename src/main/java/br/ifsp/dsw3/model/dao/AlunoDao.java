package br.ifsp.dsw3.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ifsp.dsw3.model.domain.Aluno;

public class AlunoDao {

    public void criarTabela() {
        String sql = "CREATE TABLE IF NOT EXISTS alunos (id integer PRIMARY KEY AUTOINCREMENT, nome varchar(30), codigo_disciplina integer, FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo))";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void inserir(Aluno aluno) {
        String sql = "INSERT INTO alunos (nome, codigo_disciplina) VALUES (?, ?)";
        try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
            stmt.setString(1, aluno.getNome());
            stmt.setInt(2, aluno.getCodigo_disciplina());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public void excluir(int id) {
    String sql = "DELETE FROM alunos WHERE id=?";
    try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
        stmt.setInt(1, id);
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public void alterar(Aluno aluno) {
    String sql = "UPDATE alunos SET nome=?, codigo_disciplina=? WHERE id=?";
    try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
        stmt.setString(1, aluno.getNome());
        stmt.setInt(2, aluno.getCodigo_disciplina());
        stmt.setInt(3, aluno.getId());
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public ArrayList<Aluno> listar() {
    ArrayList<Aluno> alunos = new ArrayList<>();
    String sql = "SELECT * FROM alunos";
    try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Aluno aluno = new Aluno(rs.getInt("id"), rs.getString("nome"), rs.getInt("codigo_disciplina"));
            alunos.add(aluno);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return alunos;
}

public Aluno pesquisarPorId(int id) {
    Aluno aluno = null;
    String sql = "SELECT * FROM alunos WHERE id=?";
    try (PreparedStatement stmt = ConnectionFactory.criaStatement(sql)) {
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String nome = rs.getString("nome");
            int codigo_disciplina = rs.getInt("codigo_disciplina");
            aluno = new Aluno(id, nome, codigo_disciplina);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return aluno;
}


}