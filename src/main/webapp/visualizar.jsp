<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ifsp.dsw3.model.dao.*,br.ifsp.dsw3.model.domain.*"%>
<%@page import="java.util.*"%>

<%
  AlunoDao adao = new AlunoDao();
  ArrayList<Aluno> alunos = adao.listar();

  DisciplinaDao ddao = new DisciplinaDao();
  ArrayList<Disciplina> disciplinas = ddao.listar();
%>

<!DOCTYPE html>
<html lang="pt=br">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>DSW3</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="css/table.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

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
    <div class="container text-center my-5">
        <div class="table-container">
          <div class="float-left my-5">
            <h2>Tabela Aluno</h2>
            <table class="table table-striped table-hover">
              <thead class="thead-dark">
                <tr>
                  <th>Nome</th>
                  <th>Código da Disciplina</th>
                  <th>Código da Matrícula</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
               <% for(Aluno a:alunos){ %>
                <tr>
                  <td><%=a.getNome()%></td>
                  <td><%=a.getCodigo_disciplina()%></td>
                  <td><%=a.getId()%></td>
                  <td coolspan= "2">
                   <a class="btn btn-info btn-sm" href="index.jsp?id=<%=a.getId()%>" role="button">
                                <span class="oi oi-brush" title="Alterar" aria-hidden="true"></span>
                            </a>
                   <a class="btn btn-danger btn-sm" href="alunos?id=<%=a.getId()%>" role="button">
                                <span class="oi oi-circle-x" title="Excluir" aria-hidden="true"></span>
                        </a>
                   </td>     
                </tr>
                 <% } %>
              </tbody>
            </table>
          </div>
          <div class="float-right my-5">
            <h2>Tabela Disciplina</h2>
            <table class="table table-striped table-hover">
              <thead class="thead-dark">
                <tr>
                  <th>Nome</th>
                  <th>Código</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <% for(Disciplina d:disciplinas){ %>
                <tr>
                  <td><%=d.getNome()%></td>
                  <td><%=d.getCodigo()%></td>
                  <td coolspan ="2">
                  <a class="btn btn-info btn-sm" href="index.jsp?codigo=<%=d.getCodigo()%>" role="button">
                                <span class="oi oi-brush" title="Alterar" aria-hidden="true"></span>
                            </a>
                   <a class="btn btn-danger btn-sm" href="disciplinas?codigo=<%=d.getCodigo()%>" role="button">
                                <span class="oi oi-circle-x" title="Excluir" aria-hidden="true"></span>
                        </a>
                   </td>     
                  </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
</body>
</html>
