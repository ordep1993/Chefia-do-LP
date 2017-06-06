<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Professor</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa Professores</h4>
            <table id="tbPesqProf">
                <tr>
                    <th class="title">Matricula</th>
                    <th class="title">Nome</th>
                    <th class="title">Data de Nascimento</th>
                    <th class="title">CPF</th>
                    <th class="title">Data de Expedicao</th>
                    <th class="title">Orgão Expedidor</th>
                    <th class="title">UF Expedicao</th>
                    <th class="title">Email</th>
                    <th class="title">Telefone</th>
                    <th class="title">Celular</th>
                    <th class="title">Logradouro</th>
                    <th class="title" >Numero</th>
                    <th class="title">Complemento</th>
                    <th class="title">Bairro</th>
                    <th class="title">Cep</th>
                    <th colspan="2" class="title">Ação</th>
                </tr>
                <c:forEach items="${professores}" var="professor">
                    <tr>
                        <td><c:out value="${professor.matricula}"/></td>
                        <td><c:out value="${professor.nome}"/></td>
                        <td><c:out value="${professor.dataNasc}"/></td>
                        <td><c:out value="${professor.cpf}"/></td>
                        <td><c:out value="${professor.dataExpedicao}"/></td>
                        <td><c:out value="${professor.orgaoExpedidor}"/></td>
                        <td><c:out value="${professor.ufExpedicao}"/></td>
                        <td><c:out value="${professor.email}"/></td>
                        <td><c:out value="${professor.telefone}"/></td>
                        <td><c:out value="${professor.celular}"/></td>
                        <td><c:out value="${professor.logradouro}"/></td>
                        <td><c:out value="${professor.numero}"/></td>
                        <td><c:out value="${professor.complemento}"/></td>
                        <td><c:out value="${professor.bairro}"/></td>
                        <td><c:out value="${professor.cep}"/></td>
                        <td><a href="ManterProfessorController?acao=prepararOperacao&operacao=editar&matricula="${professor.matricula}"/>">Editar</a></td>
                        <td><a href="ManterProfessorController?acao=prepararOperacao&operacao=excluir&matricula=${professor.matricula}"/>">Excluir</a></td>
                    </tr> 
                </c:forEach>
            </table>
            <Table id="btn">
                <form action="ManterProfessorController?acao=prepararOperacao&operacao=incluir" method="post">
                    <tr>
                        <td>
                            <input type="submit" name="btnIncluir" value="Incluir" class="btnIncluir">
                        </td>
                </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportProfessor.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>
