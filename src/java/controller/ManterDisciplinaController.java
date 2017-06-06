package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import dao.DisciplinaDAO;
import dao.ProfessorDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Disciplina;


/**
 *
 * @author Marco
 */
public class ManterDisciplinaController extends HttpServlet {

    private Disciplina disciplina;

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
                int codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
                disciplina = DisciplinaDAO.getInstance().getDisciplina(codDisciplina);
                request.setAttribute("disciplina", disciplina);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterDisciplina.jsp");
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
            int numAula = Integer.parseInt(request.getParameter("txtNumAula"));
            String ementa = request.getParameter("txtEmenta");
            String bibliografia = request.getParameter("txtBibliografia");
            
            if (operacao.equals("incluir")) {
                disciplina = new Disciplina(codigo,descricao,numAula,ementa,bibliografia);
                DisciplinaDAO.getInstance().salvar(disciplina);
            } else if (operacao.equals("editar")) {
                disciplina.setCodigo(codigo);
                disciplina.setDescricao(descricao);
                disciplina.setNumAula(numAula);
                disciplina.setEmenta(ementa);
                disciplina.setBibliografia(bibliografia);
                DisciplinaDAO.getInstance().alterar(disciplina);
            } else if (operacao.equals("excluir")) {
                DisciplinaDAO.getInstance().excluir(disciplina);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarDisciplinaController");
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
