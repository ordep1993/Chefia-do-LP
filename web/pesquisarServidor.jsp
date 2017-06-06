<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Servidores</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Pesquisa Servidores</h4>
            <table id ="tbPesqServ">
                <tr>
                    <th class="title">Matricula</th>
                    <th class="title">Nome</th>
                    <th class="title">Data Nasc</th>
                    <th class="title">CPF</th>
                    <th class="title">Data Expedição</th>
                    <th class="title">Orgao Expedidor</th>
                    <th class="title">UF Expedição</th>
                    <th class="title">Email</th>
                    <th class="title">Telefone</th>
                    <th class="title">Celular</th>
                    <th class="title">Logradouro</th>
                    <th class="title">Número</th>
                    <th class="title">Complemento</th>
                    <th class="title">Bairro</th>
                    <th class="title">CEP</th>
                    <th class="title">Data Admissão</th>
                    <th colspan="2" class="title">Ação</th>  
                </tr>
                <c:forEach items="${servidores}" var="servidor">
                    <tr>
                        <td> <c:out value="${servidor.matricula}" />
                        <td> <c:out value="${servidor.nome}" />
                        <td> <c:out value="${servidor.dataNasc}" />
                        <td> <c:out value="${servidor.cpf}" />
                        <td> <c:out value="${servidor.dataExpedicao}" />
                        <td> <c:out value="${servidor.orgaoExpedidor}" />
                        <td> <c:out value="${servidor.ufExpedicao}" />
                        <td> <c:out value="${servidor.email}" />
                        <td> <c:out value="${servidor.telefone}" />
                        <td> <c:out value="${servidor.celular}" />
                        <td> <c:out value="${servidor.logradouro}" />
                        <td> <c:out value="${servidor.numero}" />
                        <td> <c:out value="${servidor.complemento}" />
                        <td> <c:out value="${servidor.bairro}" />
                        <td> <c:out value="${servidor.cep}" />
                        <td> <c:out value="${servidor.dataAdmissao}" />
                        <td><a href="ManterServidorController?acao=prepararOperacao&operacao=editar&matricula=${servidor.matricula}"/>">Editar</a></td>
                        <td><a href="ManterServidorController?acao=prepararOperacao&operacao=excluir&matricula=${servidor.matricula}"/>">Excluir</a></td>
                    </tr>
                </c:forEach>
            </table>
            <Table id="btn">    
                <form action="ManterServidorController?acao=prepararOperacao&operacao=incluir" method="post">
                    <tr>
                        <td>
                            <input type="submit" name"btnIncluir" value="incluir" class="btnIncluir">
                        </td>
                </form>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                <td>
                    <a href="reportServidor.jsp"><button class="btnInicio">Relatorio</button></td>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>
