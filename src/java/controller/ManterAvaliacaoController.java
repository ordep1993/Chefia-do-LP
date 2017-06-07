package controller;

import dao.AlunoDAO;
import dao.AvaliacaoDAO;
import dao.DisciplinaDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Avaliacao;
import modelo.Disciplina;

public class ManterAvaliacaoController extends HttpServlet {

    private Avaliacao avaliacao;

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
            request.setAttribute("avaliacoes", AvaliacaoDAO.getInstance().getAllAvaliacoes());
            request.setAttribute("alunos", AlunoDAO.getInstance().getAllAlunos());
            request.setAttribute("disciplinas", DisciplinaDAO.getInstance().getAllDisciplinas());
            
            if (!operacao.equals("incluir")) {
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                avaliacao = AvaliacaoDAO.getInstance().getAvaliacao(codigo);
                request.setAttribute("avaliacao", avaliacao);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterAvaliacao.jsp");
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
            int avaliacao1 = Integer.parseInt(request.getParameter("txtAvaliacao1"));
            int avaliacao2 = Integer.parseInt(request.getParameter("txtAvaliacao2"));
            int avaliacaoFinal = Integer.parseInt(request.getParameter("txtAvaliacaoFinal"));
            int codAluno = Integer.parseInt(request.getParameter("optAluno"));
            int codDisciplina = Integer.parseInt(request.getParameter("optDisciplina"));
            Aluno aluno = null;
            Disciplina disciplina = null;
             if (codAluno != 0) {
                aluno = AlunoDAO.getInstance().getAluno(codAluno);
            }
              if (codDisciplina != 0) {
                disciplina = DisciplinaDAO.getInstance().getDisciplina(codDisciplina);
            }
            
          
            if (operacao.equals("incluir")) {
                avaliacao = new Avaliacao(codigo,  avaliacao1,  avaliacao2,  avaliacaoFinal,  aluno , disciplina);
                AvaliacaoDAO.getInstance().salvar(avaliacao);
            } else if (operacao.equals("editar")) {
                avaliacao.setAvaliacao1(avaliacao1);
                avaliacao.setAvaliacao2(avaliacao2);
                avaliacao.setAvaliacaoFinal(avaliacaoFinal);
                avaliacao.setCodigoAluno(aluno);
                avaliacao.setCodigoDisciplina(disciplina);
                AvaliacaoDAO.getInstance().alterar(avaliacao);
            } else if (operacao.equals("excluir")) {
                AvaliacaoDAO.getInstance().excluir(avaliacao);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarAvaliacaoController");
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
