
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Turmas</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa Turmas</h4>
            <table id="tbPesqAvaliacao">
                <tr>
                    <th class="title">Código Turma</th>
                    <th class="title"> Ano</th>
                    <th class="title"> Semestre</th>
                    <th class="title"> MaxAluno</th>
                    <th colspan="2" class="title">Ação</th>                
                </tr>
                <c:forEach items="${turmas}" var="turma">
                    <tr>
                        <td> <c:out value="${turma.codigo}" />
                        <td> <c:out value="${turma.ano}" />
                        <td> <c:out value="${turma.semestre}" />
                        <td> <c:out value="${turma.maxAlunos}" />
                        <td><a href="ManterTurmaController?acao=prepararOperacao&operacao=editar&codigo=${turma.codigo}">Editar</a></td>
                        <td><a href="ManterTurmaController?acao=prepararOperacao&operacao=excluir&codigo=${turma.codigo}">Excluir</a></td>
                    </tr>
                </c:forEach>
            </table>
            <Table id="btn"> 
                <form action="ManterTurmaController?acao=prepararOperacao&operacao=incluir" method="post">
                    <tr>
                        <td>
                            <input type="submit" name="btnIncluir" value="Incluir" class="btnIncluir">
                        </td>
                </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportTurma.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>
