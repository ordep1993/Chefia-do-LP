<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Alunos</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa de Alunos</h4>
        <table id ="tbPesq">
            <tr>
                <th class="title">Matricula</th>
                <th class="title">Nome</th>
                <th class="title">Data de Nascimento</th>
                <th class="title">CPF</th>
                <th class="title">Data de Expedicao</th>
                <th class="title">Email</th>
                <th class="title">Telefone</th>
                <th class="title">Celular</th>
                <th class="title">Logradouro</th>
                <th class="title">Numero</th>
                <th class="title">Complemento</th>
                <th class="title">Bairro</th>
                <th class="title">Cep</th>
                <th class="title">Ano Inicio</th>
                <th class="title">Semestre Inicio</th>
                <th class="title">Estado do Aluno</th>
                <th colspan="2" class="title">Ação</th>                         
            </tr>
            <c:forEach items="${alunos}" var="aluno">
                <tr>
                    <td><c:out value="${aluno.matricula}"/></td>
                    <td><c:out value="${aluno.nome}"/></td>
                    <td><c:out value="${aluno.dataNasc}"/></td>
                    <td><c:out value="${aluno.cpf}"/></td>
                    <td><c:out value="${aluno.dataExpedicao}"/></td>
                    <td><c:out value="${aluno.email}"/></td>
                    <td><c:out value="${aluno.telefone}"/></td>
                    <td><c:out value="${aluno.celular}"/></td>
                    <td><c:out value="${aluno.logradouro}"/></td>
                    <td><c:out value="${aluno.numero}"/></td>
                    <td><c:out value="${aluno.complemento}"/></td>
                    <td><c:out value="${aluno.bairro}"/></td>
                    <td><c:out value="${aluno.cep}"/></td>
                    <td><c:out value="${aluno.anoInicio}"/></td>
                    <td><c:out value="${aluno.semestreInicio}"/></td>
                    <td><c:out value="${aluno.estadoAluno}"/></td>
                    <td><a href="ManterAlunoController?acao=prepararOperacao&operacao=editar&matricula=${aluno.matricula}"/>Editar</a></td>
                    <td><a href="ManterAlunoController?acao=prepararOperacao&operacao=excluir&matricula=${aluno.matricula}"/>Excluir</a></td>          
                </tr>      
            </c:forEach>
        </table>
        <Table id="btn">
        <form action="ManterAlunoController?acao=prepararOperacao&operacao=incluir" method="post">
            <tr>
                <td>
                    <input type="submit" name="btnIncluir" value="Incluir" class="btnIncluir">
                </td>
        </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportAluno.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
            </tr>
        </table>
        </div>
    </body>
</html>



