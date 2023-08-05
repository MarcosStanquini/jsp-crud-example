package br.ifsp.dsw3.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ifsp.dsw3.model.dao.AlunoDao;
import br.ifsp.dsw3.model.domain.Aluno;

@WebServlet(name = "alunoServlet", value = "/alunos")
public class AlunoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AlunoDao dao = new AlunoDao();
        dao.excluir(id);
        resp.sendRedirect("visualizar.jsp");
    }

    @Override
    public void init() throws ServletException {
        AlunoDao dao = new AlunoDao();
        dao.criarTabela();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String nome = req.getParameter("nome");
        int codigoDisciplina = Integer.parseInt(req.getParameter("codigo_disciplina"));
        String enviar = req.getParameter("enviar_aluno");
        Aluno aluno = new Aluno(id, nome, codigoDisciplina);
        AlunoDao dao = new AlunoDao();
        if (enviar.contains("Salvar")) {
            dao.inserir(aluno);
        } else {
            dao.alterar(aluno);
        }
        resp.sendRedirect("index.jsp");
    }
}
