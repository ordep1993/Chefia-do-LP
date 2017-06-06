<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Disciplina</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa Diciplina</h4>
            <table id="tbPesqAvaliacao">
                <tr>
                    <th class="title">Código Disciplina</th>
                    <th class="title">Nome Disciplina</th>
                    <th class="title">Num Aulas</th>
                    <th class="title">Ementa</th>
                    <th class="title">Bibliografia</th>
                    <th colspan="2" class="title">Ação</th>                         
                </tr>
                <c:forEach items="${disciplinas}" var="disciplina">
                    <tr>
                        <td><c:out value="${disciplina.codigo}"/></td>
                        <td><c:out value="${disciplina.descricao}"/></td>
                        <td><c:out value="${disciplina.numAula}"/></td>
                        <td><c:out value="${disciplina.ementa}"/></td>
                        <td><c:out value="${disciplina.bibliografia}"/></td>
                        <td><a href="ManterDisciplinaController?acao=prepararOperacao&operacao=editar&codigo=${disciplina.codigo}"/>Editar</a></td>
                        <td><a href="ManterDisciplinaController?acao=prepararOperacao&operacao=excluir&codigo=${disciplina.codigo}"/>Excluir</a></td>          
                    </tr>      
                </c:forEach>
            </table>
            <Table id="btn">
                <form action="ManterDisciplinaController?acao=prepararOperacao&operacao=incluir" method="post">
                    <tr>
                        <td>
                            <input type="submit" name="btnIncluir" value="Incluir" class="btnIncluir">
                        </td>
                </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportDisciplina.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>

