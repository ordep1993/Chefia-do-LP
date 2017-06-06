<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório Turma</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Relatório Turma</h4>
            <form action="RelatorioControllerTurma?acao=relatorioComParametro" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
                <table id="tbManter">
                    <tr>
                        <td>Código:</td> 
                        <td><input type="text" name="txtCodigo" value="${turma.codigo}"</td>
                    </tr>
                    <tr>
                        <td>Ano:</td> 
                        <td><input type="text" name="txtAno" value="${turma.ano}"</td>
                    </tr>
                    <tr>
                        <td ><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
                        <td><a href="RelatorioControllerTurma?acao=relatorioSemParametro"/>Gerar</a></td>
                       
                    </tr>
                </table>
            </form>
            <Table id="btn">
                <tr>
                    <td>
                        <a href="PesquisarTurmaController"><button class="btnIncluir">Voltar</button></a>
                    </td>
                    <td>
                        <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                    </td>
                </tr>
            </table> 
        </div>
    </body>
</html>
