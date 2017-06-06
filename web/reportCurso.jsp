<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório de Cursos</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Relatório Cursos</h4>
         <form action="RelatorioControllerCurso?acao=relatorioSemParametro" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
                <table id="tbManter">
                    <tr>
                        <td>Codigo:</td> 
                        <td><input type="text" name="txtCodigo" value="${curso.codigo}" </td>
                    </tr>
                    <tr>
                        <td>Nome:</td> 
                        <td><input type="text" name="txtNome" value="${codigo.nome}"></td>
                    <tr>
                        <td ><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
                        <td><a href="RelatorioControllerCurso?acao=relatorioSemParametro"/>Gerar</a></td>
                    </tr>
                </table>
            </form>
            <Table id="btn">
                <td>
                    <a href="PesquisarCursoController"><button class="btnIncluir">Voltar</button></a>
                </td>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>
