<%-- 
    Document   : manterDiciplina
    Created on : 13/09/2016, 09:59:20
    Author     : Daniel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Disciplina</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Disciplina</h4>

        <form action="ManterDisciplinaController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterDisciplina" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Código da Disciplina:</td> 
                    <td><input type="text" name="txtCodigo" value="${disciplina.codigo}" </td>
                </tr>
                <tr>
                    <td>Descrição:</td> 
                    <td><input type="text" name="txtDescricao" value="${disciplina.descricao}" </td>
                </tr>
                <tr>
                    <td>Número de Aulas:</td> 
                    <td><input type="text" name="txtNumAula" value="${disciplina.numAula}" </td>
                </tr> 
                <tr>
                    <td>Ementa:</td> 
                    <td><input name="txtEmenta" value="${disciplina.ementa}" </td>
                </tr>
                <tr>
                    <td>Bibliografia:</td> 
                    <td><input name="txtBibliografia" value="${disciplina.bibliografia}" </td>
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
                if (!campoNumerico(form.txtCodigo.value) || form.txtCodigo.value == "") {
                    mensagem = mensagem + "Código da Disciplina deve ser numérico\n";
                }
                if (form.txtDescricao.value == "") {
                    mensagem = mensagem + "Informe a Descrição\n";
                }
                if (!campoNumerico(form.txtNumAula.value) || form.txtNumAula.value == "") {
                    mensagem = mensagem + "Número de Aulas deve ser numérico\n";
                }
                if (form.txtEmenta.value == "") {
                    mensagem = mensagem + "Informe a Ementa\n";
                }
                if (form.txtBibliografia.value == "") {
                    mensagem = mensagem + "Informe a Bibliografia\n";
                }
                if (mensagem == ""){
                    return true;
                }else{
                    alert(mensagem);
                    return false;
                }                
            } 
        </SCRIPT>        
        </div>
    </body>
</html>