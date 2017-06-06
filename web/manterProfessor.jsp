<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Professor</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>

        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Professor</h4>

        <form action="ManterProfessorController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterProfessor" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Matricula:</td> 
                    <td><input type="text" name="txtMatricula" value="${professor.matricula}"</td>
                    </tr>
                    <tr>
                        <td>Nome:</td> 
                        <td><input type="text" name="txtNome" value="${professor.nome}" </td>
                    </tr>
                    <tr>
                        <td>Data de Nascimento:</td> 
                        <td><input type="text" name="txtDataNasc" value="${professor.dataNasc}" </td>
                    </tr>
                    <tr>
                        <td>CPF:</td> 
                        <td><input type="text" name="txtCPF" value="${professor.cpf}"</td>
                    </tr>
                    <tr>
                        <td>Data de Expedição:</td>
                        <td><input type="text" name="txtDataExpedicao" value="${professor.dataExpedicao}" </td>                        
                    </tr>
                    <tr>
                        <td>Orgão Expedidor:</td>
                        <td><input type="text" name="txtOrgaoExpedidor" value="${professor.orgaoExpedidor}" </td>                        
                    </tr>
                    <tr>
                        <td>UF Expedição:</td>
                        <td><input type="text" name="txtUFExpedicao" value="${professor.ufExpedicao}" </td>                        
                    </tr>

                    <tr> 
                        <td>Email:</td> 
                        <td><input type="text" name="txtEmail" value="${professor.email}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Telefone:</td> 
                        <td><input type="text" name="txtTelefone" value="${professor.telefone}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Celular:</td> 
                        <td><input type="text" name="txtCelular" value="${professor.celular}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Logradouro:</td> 
                        <td><input type="text" name="txtLogradouro" value="${professor.logradouro}" </td>
                        </td>
                    </tr>
                    <tr>
                        <td>Numero:</td> 
                        <td><input type="text" name="txtNumero" value="${professor.numero}" </td>
                    </tr>
                    <tr>
                        <td>Complemento:</td> 
                        <td><input type="text" name="txtComplemento" value="${professor.complemento}" </td>
                    </tr>
                    <tr>
                        <td>Bairro:</td> 
                        <td><input type="text" name="txtBairro" value="${professor.bairro}" </td>
                    </tr>
                    <tr> 
                        <td>CEP:</td> 
                        <td><input type="text" name="txtCEP" value="${professor.cep}" </td>
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
                if(form.txtNome.value == ""){
                     mensagem = mensagem + "Informe o nome\n";
                }
                if(form.txtDataNasc.value == ""){
                     mensagem = mensagem + "Informe a Data de Nascimento\n";
                }
                 if (!campoNumerico(form.txtCPF.value) ||form.txtCPF.value == "") {
                    mensagem = mensagem + "Informe o CPF\n";
                }
                if(form.txtDataExpedicao.value == ""){
                     mensagem = mensagem + "Informe a Data de Expedição\n";
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
                    mensagem = mensagem + "Informe o Numero\n";
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
