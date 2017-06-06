<%-- 
    Document   : manterServidor
    Created on : 13/09/2016, 09:56:45
    Author     : Daniel
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Servidor</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Servidor</h4>

        <form action="ManterServidorController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterServidor" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Matricula:</td> 
                    <td><input type="text" name="txtMatricula" value="${servidor.matricula}"</td>
                    </tr>
                    <tr>
                        <td>Nome:</td> 
                        <td><input type="text" name="txtNome" value="${servidor.nome}" </td>
                    </tr>
                    <tr>
                        <td>Data de Nascimento:</td> 
                        <td><input type="text" name="txtDataNasc" value="${servidor.dataNasc}" </td>
                    </tr>
                    <tr>
                        <td>CPF:</td> 
                        <td><input type="text" name="txtCPF" value="${servidor.cpf}" </td>
                    </tr>
                    <tr>
                        <td>Data de Expedição:</td>
                        <td><input type="text" name="txtDataExpedicao" value="${servidor.dataExpedicao}" </td>                    
                    </tr>
                    <tr>
                        <td>Orgão Expedidor:</td>
                        <td><input type="text" name="txtOrgaoExpedidor" value="${servidor.orgaoExpedidor}"</td>                        
                    </tr>
                    <tr>
                        <td>UF Expedição:</td>
                        <td><input type="text" name="txtUFExpedicao" value="${servidor.ufExpedicao}" </td>                        
                    </tr>

                    <tr> 
                        <td>Email:</td> 
                        <td><input type="text" name="txtEmail" value="${servidor.email}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Telefone:</td> 
                        <td><input type="text" name="txtTelefone" value="${servidor.telefone}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Celular:</td> 
                        <td><input type="text" name="txtCelular" value="${servidor.celular}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Logradouro:</td> 
                        <td><input type="text" name="txtLogradouro" value="${servidor.logradouro}" </td>
                        </td>
                    </tr>
                    <tr>
                        <td>Numero:</td> 
                        <td><input type="text" name="txtNumero" value="${servidor.numero}" </td>
                    </tr>
                    <tr>
                        <td>Complemento:</td> 
                        <td><input type="text" name="txtComplemento" value="${servidor.complemento}" </td>
                    </tr>
                    <tr>
                        <td>Bairro:</td> 
                        <td><input type="text" name="txtBairro" value="${servidor.bairro}" </td>
                    </tr>
                    <tr> 
                        <td>CEP:</td> 
                        <td><input type="text" name="txtCEP" value="${servidor.cep}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Data de Admissão:</td> 
                        <td><input type="text" name="txtDataAdmissao" value="${servidor.dataAdmissao}" </td>
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
                if (!campoNumerico(form.txtMatricula.value) ||form.txtMatricula.value == "") {
                    mensagem = mensagem + "Matrícula deve ser numérico\n";
                }
                if(campoNumerico(form.txtNome.value) || form.txtNome.value == ""){
                     mensagem = mensagem + "Informe o nome\n";
                }
                if(form.txtDataNasc.value == ""){
                     mensagem = mensagem + "Informe a Data de Nascimento\n";
                }
                if(form.txtOrgaoExpedidor.value == ""){
                     mensagem = mensagem + "Informe o Orgão Expedidor\n";
                }
                if(form.txtUFExpedicao.value == ""){
                     mensagem = mensagem + "Informe o UF Expedição\n";
                }
                if(form.txtEmail.value == ""){
                     mensagem = mensagem + "Informe o Email\n";
                }
                if (!campoNumerico(form.txtCPF.value) ||form.txtCPF.value == "") {
                    mensagem = mensagem + "Informe o CPF\n";
                }
                if (!campoNumerico(form.txtTelefone.value) ||form.txtTelefone.value == "") {
                    mensagem = mensagem + "Informe o Telefone\n";
                }
                if (!campoNumerico(form.txtCelular.value) ||form.txtCelular.value == "") {
                    mensagem = mensagem + "Informe o Celular\n";
                }
                if(form.txtLogradouro.value == ""){
                     mensagem = mensagem + "Informe o Logradouro\n";
                }
                if (!campoNumerico(form.txtNumero.value) ||form.txtNumero.value == "") {
                    mensagem = mensagem + "Informe o Nmero\n";
                }
                if(form.txtComplemento.value == ""){
                     mensagem = mensagem + "Informe o Complemento\n";
                }
                if(form.txtBairro.value == ""){
                     mensagem = mensagem + "Informe o Bairro\n";
                }
                if(form.txtComplemento.value == ""){
                     mensagem = mensagem + "Informe o CEP\n";
                }
                if(form.txtDataAdmissao.value == ""){
                     mensagem = mensagem + "Informe a Data Admissão\n";
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
