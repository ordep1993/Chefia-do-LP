package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import dao.TurmaDAO;
import dao.ProfessorDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Turma;
import modelo.Professor;

/**
 *
 * @author Marco
 */
public class ManterTurmaController extends HttpServlet {

    private Turma turma;

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
            request.setAttribute("turmas", TurmaDAO.getInstance().getAllTurmas());
            if (!operacao.equals("incluir")) {
                int codigo = Integer.parseInt(request.getParameter("codigo"));                
                turma = TurmaDAO.getInstance().getTurma(codigo);
                request.setAttribute("turma", turma);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterTurma.jsp");
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
            int ano = Integer.parseInt(request.getParameter("txtAno"));
            int semestre = Integer.parseInt(request.getParameter("txtSemestre"));
            int maxAlunos = Integer.parseInt(request.getParameter("txtMaxAlunos"));

            if (operacao.equals("incluir")) {
                turma = new Turma(codigo, ano , semestre , maxAlunos);
                TurmaDAO.getInstance().salvar(turma);
            } else if (operacao.equals("editar")) {
                turma.setAno(ano);
                turma.setSemestre(semestre);
                turma.setMaxAlunos(maxAlunos);

                TurmaDAO.getInstance().alterar(turma);
            } else if (operacao.equals("excluir")) {
                TurmaDAO.getInstance().excluir(turma);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarTurmaController");
            view.forward(request, response);

        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
