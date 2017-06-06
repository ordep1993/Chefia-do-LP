<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Aluno</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>
    <body>

        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <h4>Manter Aluno</h4>

        <form action="ManterAlunoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
            <table id="tbManter">
                <tr>
                    <td>Matricula:</td> 
                    <td><input type="text" name="txtMatricula" value="${aluno.matricula}"</td>
                    </tr>
                    <tr>
                        <td>Nome:</td> 
                        <td><input type="text" name="txtNome" value="${aluno.nome}" </td>
                    </tr>
                    <tr>
                        <td>Data de Nascimento:</td> 
                        <td><input type="text" name="txtDataNasc" value="${aluno.dataNasc}"</td>
                    </tr>
                    <tr>
                        <td>CPF:</td> 
                        <td><input type="text" name="txtCPF" value="${aluno.cpf}" </td>
                    </tr>
                    <tr>
                        <td>Data de Expedicao:</td> 
                        <td><input type="text" name="txtDataExpedicao" value="${aluno.dataExpedicao}" </td>
                    </tr>                    
                    <tr> 
                        <td>Email:</td> 
                        <td><input type="text" name="txtEmail" value="${aluno.email}"</td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Telefone:</td> 
                        <td><input type="text" name="txtTelefone" value="${aluno.telefone}"</td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Celular:</td> 
                        <td><input type="text" name="txtCelular" value="${aluno.celular}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Logradouro:</td> 
                        <td><input type="text" name="txtLogradouro" value="${aluno.logradouro}"</td>
                        </td>
                    </tr>
                    <tr>
                        <td>Numero:</td> 
                        <td><input type="text" name="txtNumero" value="${aluno.numero}" </td>
                    </tr>
                    <tr>
                        <td>Complemento:</td> 
                        <td><input type="text" name="txtComplemento" value="${aluno.complemento}"</td>
                    </tr>
                    <tr>
                        <td>Bairro:</td> 
                        <td><input type="text" name="txtBairro" value="${aluno.bairro}" </td>
                    </tr>
                    <tr> 
                        <td>CEP:</td> 
                        <td><input type="text" name="txtCEP" value="${aluno.cep}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Ano de Inicio:</td> 
                        <td><input type="text" name="txtAnoInicio" value="${aluno.anoInicio}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Semestre de Inicio:</td> 
                        <td><input type="text" name="txtSemestreInicio" value="${aluno.semestreInicio}" </td>
                        </td>
                    </tr>
                    <tr> 
                        <td>Estado do Aluno:</td> 
                        <td><input type="text" name="txtEstadoAluno" value="${aluno.estadoAluno}" </td>
                    </td>
                </tr>
                <tr>
                    <td ><input type="submit" name="btnConfirmar" value="Confirmar" class="btnConf"></td>
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
                if (!campoNumerico(form.txtAnoInicio.value) ||form.txtAnoInicio.value == "") {
                    mensagem = mensagem + "Ano Início deve Numérico\n";
                }
                if (!campoNumerico(form.txtSemestreInicio.value) ||form.txtSemestreInicio.value == "") {
                    mensagem = mensagem + "Semestre Início deve Numérico\n";
                }
                if(form.txtEstadoAluno.value == ""){
                     mensagem = mensagem + "Informe o Estado do Aluno\n";
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
