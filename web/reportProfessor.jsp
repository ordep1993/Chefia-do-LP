<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório Professor</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Relatório Professor</h4>
        <form action="RelatorioControllerProfessor?acao=relatorioComParametro" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Matricula:</td> 
                    <td><input type="text" name="txtMatricula" value="${professor.matricula}" </td>
                    </tr>
                    <tr>
                        <td>Nome:</td> 
                        <td><input type="text" name="txtNome" value="${professor.nome}"></td>
                    <tr>
                        <td ><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
                        <td><a href="RelatorioControllerProfessor?acao=relatorioSemParametro"/>Gerar</a></td>
                    </tr>
             </table>
        </form>
        <Table id="btn">
            <tr>
                <td>
                    <a href="PesquisarProfessorController"><button class="btnIncluir">Voltar</button></a>
                </td>
                <td>
                    <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                </td>
            </tr>
        </table>   
    </body>
</html>
