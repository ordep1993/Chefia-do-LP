<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Matricula</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Matricula</h4>

        <form action="ManterMatriculaController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterMatricula" >
            <table id="tbManter">
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtCodigo" value="${matricula.codigo}" </td>
                    </tr>
                    <tr>
                        <td>Curso:</td>
                        <td>
                            <select name="optCurso" >
                            <option value="0" <c:if test="${matricula.curso.codigo == null}"> selected</c:if>> </option>  
                            <c:forEach items="${cursos}" var="curso">
                                <option value="${curso.codigo}" <c:if test="${matricula.curso.codigo == curso.codigo}"> selected</c:if>>
                                    ${curso.descricao}
                                </option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Disciplina:</td>
                    <td>
                        <select name="optDisciplina" >
                            <option value="0" <c:if test="${matricula.disciplina.codigo == null}"> selected</c:if>> </option>  
                            <c:forEach items="${disciplinas}" var="disciplina">
                                <option value="${disciplina.codigo}" <c:if test="${matricula.disciplina.codigo == disciplina.codigo}"> selected</c:if>>
                                    ${disciplina.descricao}
                                </option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Turma:</td>
                    <td>
                        <select name="optTurma" >
                            <option value="0" <c:if test="${matricula.turma.codigo == null}"> selected</c:if>> </option>  
                            <c:forEach items="${turmas}" var="turma">
                                <option value="${turma.codigo}" <c:if test="${matricula.turma.codigo == turma.codigo}"> selected</c:if>>
                                    ${turma.codigo}
                                </option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Aluno:</td>
                    <td>
                        <select name="optAluno" >
                            <option value="0" <c:if test="${matricula.aluno.matricula == null}"> selected</c:if>> </option>  
                            <c:forEach items="${alunos}" var="aluno">
                                <option value="${aluno.matricula}" <c:if test="${matricula.aluno.matricula == aluno.matricula}"> selected</c:if>>
                                    ${aluno.nome}
                                </option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
                </tr>
            </table>
        </form>
        <br><a href="index.jsp"><button class="btnInicio">Inicio</button></a>
        <SCRIPT language="JavaScript">
           function campoNumerico(valor)
            {
                var caracteresValidos = "0123456789";
                var ehNumero = true;
                var umCaracter;
                for (i = 0; i < valor.length && ehNumero == true; i++)
                {
                    umCaracter = valor.charAt(i);
                    if (caracteresValidos.indexOf(umCaracter) == -1)
                    {
                        ehNumero = false;
                    }
                }
                return ehNumero;
            }

            function validarFormulario(form) {
                var mensagem;
                mensagem = "";
               
                if (!campoNumerico(form.txtCodigo.value)|| form.txtCodigo.value == "") {
                    mensagem = mensagem + "Código da Matrícula deve ser numérico\n";
                }
                if (form.optCurso.value == "0") {
                    mensagem = mensagem + "Informe um Curso\n";
                }
                if (form.optDisciplina.value == "0") {
                    mensagem = mensagem + "Informe a Disciplina\n";
                }
                if (form.optTurma.value == "0") {
                    mensagem = mensagem + "Informe a Turma\n";
                }
                if (form.optAluno.value == "0") {
                    mensagem = mensagem + "Informe o Aluno\n";
                }
                if (mensagem == "") {
                    return true;
                } else {
                    alert(mensagem);
                    return false;
                }
            }
           
        </SCRIPT>        
        </div>
    </body>
</html>
