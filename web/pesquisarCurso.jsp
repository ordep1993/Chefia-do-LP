<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Cursos</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa Cursos</h4>
            <table id="tbPesqAvaliacao">
                <tr>
                    <th class="title">Código do Curso</th>
                    <th class="title">Nome Cursos</th>
                    <th class="title">Carga Horária</th>
                    <th class="title">Coordenador</th>
                    <th colspan="2" class="title">Ação</th>
                </tr>
                <c:forEach items="${cursos}" var="curso">
                    <tr>
                        <td><c:out value="${curso.codigo}"/></td>
                        <td><c:out value="${curso.descricao}"/></td>
                        <td><c:out value="${curso.cargaHoraria}"/></td>
                        <td><c:out value="${curso.professor.nome}"/></td>
                        <td><a href="ManterCursoController?acao=prepararOperacao&operacao=editar&codigo=${curso.codigo}"/>Editar</a></td>
                        <td><a href="ManterCursoController?acao=prepararOperacao&operacao=excluir&codigo=${curso.codigo}"/>Excluir</a></td>
                    </tr> 
                </c:forEach>
            </table>
            <Table id="btn">
                <form action="ManterCursoController?acao=prepararOperacao&operacao=incluir" method="post">
                    <tr>
                        <td>
                            <input type="submit" name="btnIncluir" value="Incluir" class="btnIncluir">
                        </td>
                </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportCurso.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>
