<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Curso</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Curso</h4>


        <form action="ManterCursoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterCurso" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtCodigo" value="${curso.codigo}" </td>
                    </tr>
                    <tr>
                        <td>Nome do curso:</td> 
                        <td><input type="text" name="txtDescricao" value="${curso.descricao}" </td>
                    </tr>
                    <tr>
                        <td>Carga Horária:</td> 
                        <td><input type="text" name="txtCargaHoraria" value="${curso.cargaHoraria}" </td>
                    </tr>      
                    <tr>
                        <td>Coordenador:</td>
                        <td>
                            <select name="optProfessor" >
                            <option value="0" <c:if test="${curso.professor.matricula == null}"> selected</c:if>> </option>  
                            <c:forEach items="${professores}" var="professor">
                                <option value="${professor.matricula}" <c:if test="${curso.professor.matricula == professor.matricula}"> selected</c:if>>
                                    ${professor.nome}
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
                if (form.txtCodigo.value == "") {
                    mensagem = mensagem + "Codigo\n";
                }
                if (form.txtDescricao.value == "") {
                    mensagem = mensagem + "Informe o Nome do Curso\n";
                }
                if (!campoNumerico(form.txtCargaHoraria.value) || form.txtCargaHoraria.value == "") {
                    mensagem = mensagem + "Carga Horária deve ser numérico\n";
                }
                if (form.optProfessor.value == "0") {
                    mensagem = mensagem + "Informe o Coordenador\n";
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
