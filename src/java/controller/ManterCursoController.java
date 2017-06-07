package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import dao.CursoDAO;
import dao.ProfessorDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Curso;
import modelo.Professor;

/**
 *
 * @author Marco
 */
public class ManterCursoController extends HttpServlet {

    private Curso curso;

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
            request.setAttribute("cursos", CursoDAO.getInstance().getAllCursos());
            if (!operacao.equals("incluir")) {
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                curso = CursoDAO.getInstance().getCurso(codigo);
                request.setAttribute("curso", curso);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterCurso.jsp");
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
            String descricao = request.getParameter("txtDescricao");
            int cargaHoraria = Integer.parseInt(request.getParameter("txtCargaHoraria"));
            int codProfessor = Integer.parseInt(request.getParameter("optProfessor"));
            Professor professor = null;
            if (codProfessor != 0) {
                professor = ProfessorDAO.getInstance().getProfessor(codProfessor);
            }

            if (operacao.equals("incluir")) {
                curso = new Curso(codigo, descricao, cargaHoraria,professor);
                CursoDAO.getInstance().salvar(curso);
            } else if (operacao.equals("editar")) {
                curso.setDescricao(descricao);
                curso.setCargaHoraria(cargaHoraria);
                curso.setCodigoProfessor(professor);

                CursoDAO.getInstance().alterar(curso);
            } else if (operacao.equals("excluir")) {
                CursoDAO.getInstance().excluir(curso);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarCursoController");
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
