<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Matricula</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa Matricula</h4>
            <table id="tbPesqAvaliacao">
                <tr>
                    <th class="title">Matricula</th>
                    <th class="title">Curso</th>
                    <th class="title">Disciplina</th>
                    <th class="title">Turma</th>
                    <th class="title">Aluno</th>
                    <th colspan="2" class="title">Ação</th>                         
                </tr>
                <c:forEach items="${matriculas}" var="matricula">
                    <tr>
                        <td><c:out value="${matricula.codigo}"/></td>
                        <td><c:out value="${matricula.curso.descricao}"/></td>
                        <td><c:out value="${matricula.disciplina.descricao}"/></td>
                        <td><c:out value="${matricula.codigoTurma}"/></td>
                        <td><c:out value="${matricula.aluno.nome}"/></td>

                        <td><a href="ManterMatriculaController?acao=prepararOperacao&operacao=editar&codigo=${matricula.codigo}"/>">Editar</a></td>
                        <td><a href="ManterMatriculaController?acao=prepararOperacao&operacao=excluir&codigo=${matricula.codigo}"/>">Excluir</a></td>          
                    </tr>      
                </c:forEach>
            </table>
            <Table id="btn">
                <form action="ManterMatriculaController?acao=prepararOperacao&operacao=incluir" method="post">
                    <tr>
                        <td>
                            <input type="submit" name="btnIncluir" value="Incluir" class="btnIncluir">
                        </td>
                </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportMatricula.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>

