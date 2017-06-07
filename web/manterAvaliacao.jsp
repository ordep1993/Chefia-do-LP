<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Style/style.css">
        <title>Manter Avaliação</title>
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Avaliação</h4>

        <form action="ManterAvaliacaoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterAvaliacao" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtCodigo" value="${avaliacao.codigo}" </td>
                    </tr>
                    <tr>
                        <td>Avaliação 1:</td> 
                        <td><input type="text" name="txtAvaliacao1" value="${avaliacao.avaliacao1}"</td>
                    </tr>
                    <tr>
                        <td>Avaliação 2:</td> 
                        <td><input type="text" name="txtAvaliacao2" value="${avaliacao.avaliacao2}" </td>
                    </tr>
                    <tr>
                        <td>Avaliação Final:</td> 
                        <td><input type="text" name="txtAvaliacaoFinal" value="${avaliacao.avaliacaoFinal}"</td>
                </tr>
                <tr>
                    <td>Aluno</td>
                    <td>
                        <select name="optAluno" >
                            <option value="0" <c:if test="${avaliacao.aluno.matricula == null}"> selected</c:if>> </option>  
                            <c:forEach items="${alunos}" var="aluno">
                                <option value="${aluno.matricula}" <c:if test="${avaliacao.aluno.matricula == aluno.matricula}"> selected</c:if>>
                                    ${aluno.nome}
                                </option>  
                            </c:forEach>
                        </select>
                    </td>   
                </tr>
                <tr>
                    <td>Disciplina:</td>
                    <td>
                        <select name="optDisciplina" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${avaliacao.disciplina.codigo == null}"> selected</c:if>> </option>  
                            <c:forEach items="${disciplinas}" var="disciplina">
                                <option value="${disciplina.codigo}" <c:if test="${avaliacao.disciplina.codigo == disciplina.codigo}"> selected</c:if>>${disciplina.descricao}</option>  
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
                if (form.txtCodigo.value == "") {
                    mensagem = mensagem + "Informe o Código da Avaliação\n";
                }
                if (!campoNumerico(form.txtAvaliacao1.value) || form.txtAvaliacao1.value == "") {
                    mensagem = mensagem + "Avaliação 1 deve ser numérico\n";
                }
                if (!campoNumerico(form.txtAvaliacao2.value) || form.txtAvaliacao2.value == "") {
                    mensagem = mensagem + "Avaliação 2 deve ser numérico\n";
                }
                if (!campoNumerico(form.txtAvaliacaoFinal.value) || form.txtAvaliacaoFinal.value == "") {
                    mensagem = mensagem + "Avaliação Final deve ser numérico\n";
                }
                if (form.optAluno.value == "0") {
                    mensagem = mensagem + "Informe o Aluno\n";
                }
                if (form.optDisciplina.value == "0") {
                    mensagem = mensagem + "Informe a Disciplina\n";
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
