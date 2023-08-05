package br.ifsp.dsw3.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ifsp.dsw3.model.dao.DisciplinaDao;
import br.ifsp.dsw3.model.domain.Disciplina;

@WebServlet(name = "disciplinaServlet", value = "/disciplinas")
public class DisciplinaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int codigo = Integer.parseInt(req.getParameter("codigo"));
        DisciplinaDao dao = new DisciplinaDao();
        dao.excluir(codigo);
        resp.sendRedirect("visualizar.jsp");
    }

    @Override
    public void init() throws ServletException {
        DisciplinaDao dao = new DisciplinaDao();
        dao.criarTabela();
    }

    @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    int codigo = Integer.parseInt(req.getParameter("codigo"));
    String nome = req.getParameter("nome");
    String enviar = req.getParameter("enviar_disciplina");
    Disciplina disciplina = new Disciplina(codigo, nome);
    System.out.println(codigo);
    DisciplinaDao dao = new DisciplinaDao();
    if (enviar.equals("Salvar")) {
        dao.inserir(disciplina);
    } else {
        dao.alterar(disciplina);
    }
    resp.sendRedirect("index.jsp");
}

}