<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!DOCTYPE html>
<html>

    <head>
        <title>Sistema de Controle de Curso de Extensão</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css">
    </head>

    <body> 
        <div id="top">
            <h1>Sistema de Controle de Curso de Extensão</h1>
        </div>
        <div id="container">
            <table cellspacing = "0" cellpadding="5"  border="0" id="tbMenu"> 
                <tr>
                    <td><a href="PesquisarAlunoController"><button>Alunos</button></a></td>
                    <td><a href="PesquisarAvaliacaoController"><button>Avaliações</button></a></td>
                    <td><a href="PesquisarCursoController"><button>Cursos</button></a></td>
                    <td><a href="PesquisarDisciplinaController"><button>Disciplinas</button></a></td>
                    <td><a href="PesquisarMatriculaController"><button>Matrículas</button></a></td>
                    <td><a href="PesquisarProfessorController"><button>Professores</button></a></td>
                    <td><a href="PesquisarServidorController"><button>Servidores</button></a></td>
                    <td><a href="PesquisarTurmaController"><button>Turmas</button></a></td>                    
                </tr>
            </table>
        </div>
    </body>

</html>
