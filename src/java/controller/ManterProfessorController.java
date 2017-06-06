package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



import dao.ProfessorDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Professor;


/**
 *
 * @author Marco
 */
public class ManterProfessorController extends HttpServlet {

    private Professor professor;

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
                int matricula = Integer.parseInt(request.getParameter("matricula"));
                professor = ProfessorDAO.getInstance().getProfessor(matricula);
                request.setAttribute("professor", professor);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterProfessor.jsp");
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
            int matricula = Integer.parseInt(request.getParameter("txtMatricula"));
            String nome = request.getParameter("txtNome");
            String dataNasc = request.getParameter("txtDataNasc");
            int cpf = Integer.parseInt(request.getParameter("txtCPF"));
            String dataExpedicao = request.getParameter("txtDataExpedicao");
            String orgaoExpedidor = request.getParameter("txtOrgaoExpedidor");
            String ufExpedicao = request.getParameter("txtUFExpedicao");
            String email = request.getParameter("txtEmail");
            int telefone = Integer.parseInt(request.getParameter("txtTelefone"));
            int celular = Integer.parseInt(request.getParameter("txtCelular"));
            String logradouro = request.getParameter("txtLogradouro");
            int numero = Integer.parseInt(request.getParameter("txtNumero"));
            String complemento = request.getParameter("txtComplemento");
            String bairro = request.getParameter("txtBairro");
            int cep = Integer.parseInt(request.getParameter("txtCEP"));

            if (operacao.equals("incluir")) {
                professor = new Professor(matricula,nome,dataNasc,cpf,dataExpedicao,orgaoExpedidor,ufExpedicao,email,telefone,celular,logradouro,numero,complemento,bairro,cep);
                ProfessorDAO.getInstance().salvar(professor);
            } else if (operacao.equals("editar")) {
                professor.setNome(nome);
                professor.setDataNasc(dataNasc);
                professor.setCpf(cpf);
                professor.setDataExpedicao(dataExpedicao);
                professor.setOrgaoExpedidor(orgaoExpedidor);
                professor.setUfExpedicao(ufExpedicao);
                professor.setEmail(email);
                professor.setTelefone(telefone);
                professor.setCelular(celular);
                professor.setLogradouro(logradouro);
                professor.setNumero(numero);
                professor.setComplemento(complemento);
                professor.setBairro(bairro);
                professor.setCep(cep);
                
                ProfessorDAO.getInstance().salvar(professor);
            } else if (operacao.equals("excluir")) {
                ProfessorDAO.getInstance().excluir(professor);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarProfessorController");
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
