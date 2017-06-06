package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import dao.AlunoDAO;
import dao.CursoDAO;
import dao.DisciplinaDAO;
import dao.MatriculaDAO;
import dao.ProfessorDAO;
import dao.TurmaDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Matricula;
import modelo.Aluno;
import modelo.Curso;
import modelo.Turma;
import modelo.Disciplina;

public class ManterMatriculaController extends HttpServlet {

    private Matricula matricula;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if (acao.equals("prepararOperacao")) {
            prepararOperacao(request, response);
        }
        if (acao.equals("confirmarOperacao")) {
            confirmarOperacao(request, response);
        }

    }

    public void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String operacao = request.getParameter("operacao");
            request.setAttribute("operacao", operacao);
            request.setAttribute("professores", ProfessorDAO.getInstance().getAllProfessores());
            if (!operacao.equals("incluir")) {
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                matricula = MatriculaDAO.getInstance().getMatricula(codigo);
                request.setAttribute("matricula", matricula);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterMatricula.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }

    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String operacao = request.getParameter("operacao");
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            int codAluno = Integer.parseInt(request.getParameter("txtCodAluno"));
            int codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
            int codDisciplina = Integer.parseInt(request.getParameter("txtCodDisciplina"));
            int codTurma = Integer.parseInt(request.getParameter("txtCodTurma"));
            Aluno aluno = null;
            Curso curso = null;
            Disciplina disciplina = null;
            Turma turma = null;
            if (codAluno != 0) {
                aluno = AlunoDAO.getInstance().getAluno(codAluno);
            }
            if (codDisciplina != 0) {
                disciplina = DisciplinaDAO.getInstance().getDisciplina(codDisciplina);
            }
            if (codTurma != 0) {
                turma = TurmaDAO.getInstance().getTurma(codTurma);
            }
            if (codCurso != 0) {
                curso = CursoDAO.getInstance().getCurso(codCurso);
            }
            if (operacao.equals("incluir")) {
                matricula = new Matricula(codigo);
                MatriculaDAO.getInstance().salvar(matricula);
            } else if (operacao.equals("editar")) {
                matricula.setCodigo(codigo);
                matricula.setCodigoAluno(aluno);
                matricula.setCodigoCurso(curso);
                matricula.setCodigoDisciplina(disciplina);
                matricula.setCodigoTurma(turma);
                MatriculaDAO.getInstance().salvar(matricula);
            } else if (operacao.equals("excluir")) {
                MatriculaDAO.getInstance().excluir(matricula);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarMatriculaController");
            view.forward(request, response);

        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
