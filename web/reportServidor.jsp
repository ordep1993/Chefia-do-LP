<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório Servidor</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Relatório Servidor</h4>
            <form action="RelatorioControllerServidor?acao=relatorioComParametro" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
                <table id="tbManter">
                    <tr>
                        <td>Matricula:</td> 
                        <td><input type="text" name="txtMatricula" value="${servidor.matricula}" </td>
                    </tr>
                    <tr>
                        <td>Nome:</td> 
                        <td><input type="text" name="txtNome" value="${servidor.nome}"></td>
                    <tr>
                        <td ><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
                        <td><a href="RelatorioControllerServidor?acao=relatorioSemParametro"/>Gerar</a></td>
                    </tr>
                </table>
            </form>
            <Table id="btn">
                <tr>
                    <td>
                        <a href="PesquisarServidorController"><button class="btnIncluir">Voltar</button></a>
                    </td>
                    <td>
                        <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                    </td>
                </tr>
            </table> 
        </div>
    </body>
</html>
