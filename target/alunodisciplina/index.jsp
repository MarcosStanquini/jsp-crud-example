<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ifsp.dsw3.model.dao.*,br.ifsp.dsw3.model.domain.*"%>
<%@page import="java.util.*"%>

<%
    Aluno a = null;
    String botao;

    if (request.getParameter("id") != null) {
        AlunoDao dao = new AlunoDao();
        int id = Integer.parseInt(request.getParameter("id"));
        a = dao.pesquisarPorId(id);
        a.setId(id);
        botao = "Alterar";
    } else {
        a = new Aluno();
        botao = "Salvar";
    }
%>

<%
    Disciplina d = null;
    String botaoDisciplina;

    if (request.getParameter("codigo") != null) {
        DisciplinaDao dao = new DisciplinaDao();
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        d = dao.pesquisarPorCodigo(codigo);
        d.setCodigo(codigo);
        botaoDisciplina = "Alterar";
    } else {
        d = new Disciplina();
        botaoDisciplina = "Salvar";
    }
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DSW3</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <link rel="stylesheet" href="css/form.css">
</head>

<body>
    <header>
        <nav class="navbar navbar-light navbar-expand-md bg-dark fixed-top">
            <div class="container-fluid">
                <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
                    <span class="visually-hidden">Toggle navigation</span>
                    <i class="fas fa-chevron-down fa-sm" style="color: #ffffff;"></i>
                </button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link active text-white spend_logo" href="index.jsp">
                                <i class="fas fa-plus"></i> Inserir
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white spend_logo" href="visualizar.jsp">
                                <i class="fas fa-eye"></i> Visualizar
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white spend_logo" href="alterar.jsp">
                                <i class="fas fa-edit"></i> Alterar
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <section class="container-fluid d-flex flex-column justify-content-center shadow contact-clean overflow-hidden body_color"
        style="background: #034d8b;">
        <div class="row d-flex align-items-center justify-content-center mt-5">

            <form action="alunos" class="bg-light border rounded border-secondary shadow-lg col-6 my-5"
                method="POST" style="background: rgb(248,248,249);">
                <h2 class="text-center spend_text text-black">Inserir Aluno</h2>
                <div class="form-group mb-3 spend_logo">
                    <input type="hidden" class="form-control"  required id="id" name="id" value="<%= a.getId() %>">
                </div>
                <div class="form-group mb-3 spend_logo">
                    <input class="form-control" required id="codigo_disciplina" type="text"
                        name="codigo_disciplina" placeholder="Código da Disciplina"
                        value="<%= a.getCodigo_disciplina() %>">
                </div>
                <div class="form-group mb-3 spend_logo">
                    <input class="form-control" required id="nome" name="nome" placeholder="Nome" value="<%= a.getNome() %>">
                </div>
                <div class="form-group mb-3 spend_logo">
                    <button class="btn btn-primary" type="submit" name="enviar_aluno" value="<%= botao %>"><%= botao %>
                    </button>
                </div>
            </form>

            <form action="disciplinas" class="bg-light border rounded border-secondary shadow-lg col-6 my-5"
                method="post" style="background: rgb(248,248,249);">
                <h2 class="text-center spend_text text-black">Inserir Disciplina</h2>
                <div class="form-group mb-3 spend_logo">
                    <input class="form-control" required id="codigo" type="hidden" name="codigo" placeholder="Código"
                        value="<%=d.getCodigo()%>">
                </div>
                <div class="form-group mb-3 spend_logo">
                    <input class="form-control" required id="nome" name="nome" placeholder="Nome da Disciplina" value="<%=d.getNome()%>">
                </div>
                <div class="form-group mb-3 spend_logo">
                    <button class="btn btn-primary" type="submit" name="enviar_disciplina" 
                        value="<%=botaoDisciplina%>"><%=botaoDisciplina %></button>
                </div>
            </form>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>

</html>
