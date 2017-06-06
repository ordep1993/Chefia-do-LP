<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório Matricula</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Relatório Matricula</h4>
            <form action="RelatorioControllerMatricula?acao=relatorioComParametro" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
                <table id="tbManter">
                    <tr>
                        <td>Matricula:</td> 
                        <td><input type="text" name="txtMatricula" value="${matricula.codigo}" </td>
                    </tr>
                    <tr>
                        <td>Curso:</td> 
                        <td><input type="text" name="optCurso" value="${curso.nome}" </td>
                    </tr>
                    <tr>
                        <td>Disciplina:</td> 
                        <td><input type="text" name="txtMatricula" value="${disciplina.descricao}" </td>
                    </tr>
                    <tr>
                        <td>Turma:</td> 
                        <td><input type="text" name="txtMatricula" value="${turma.codigo}" </td>
                    </tr>
                    <tr>
                        <td>Aluno:</td> 
                        <td><input type="text" name="txtMatricula" value="${aluno.nome}" </td>
                    </tr>
                        <td ><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
                        <td><a href="RelatorioControllerMatricula?acao=relatorioSemParametro"/>Gerar</a></td>
                    </tr>
                </table>
            </form>
            <Table id="btn">
                <tr>
                    <td>
                        <a href="PesquisarMatriculaController"><button class="btnIncluir">Voltar</button></a>
                    </td>
                    <td>
                        <a href="index.jsp"><button class="btnInicio">Inicio</button></a>
                    </td>
                </tr>
            </table> 
        </div>
    </body>
</html>
