package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import dao.ServidorDAO;
import dao.ProfessorDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Servidor;


/**
 *
 * @author Marco
 */
public class ManterServidorController extends HttpServlet {

    private Servidor servidor;

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
            request.setAttribute("servidores", ServidorDAO.getInstance().getAllServidores());
            if (!operacao.equals("incluir")) {
                int matricula = Integer.parseInt(request.getParameter("matricula"));
                servidor = ServidorDAO.getInstance().getServidor(matricula);
                request.setAttribute("servidor", servidor);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterServidor.jsp");
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
            String dataAdmissao = request.getParameter("txtDataAdmissao");

            if (operacao.equals("incluir")) {
                servidor = new Servidor(matricula,nome,dataNasc,cpf,dataExpedicao,orgaoExpedidor,ufExpedicao,email,telefone,celular,logradouro,numero,complemento,bairro,cep,dataAdmissao);
                ServidorDAO.getInstance().salvar(servidor);
            } else if (operacao.equals("editar")) {
                servidor.setNome(nome);
                servidor.setDataNasc(dataNasc);
                servidor.setCpf(cpf);
                servidor.setDataExpedicao(dataExpedicao);
                servidor.setOrgaoExpedidor(orgaoExpedidor);
                servidor.setUfExpedicao(ufExpedicao);
                servidor.setEmail(email);
                servidor.setTelefone(telefone);
                servidor.setCelular(celular);
                servidor.setLogradouro(logradouro);
                servidor.setNumero(numero);
                servidor.setComplemento(complemento);
                servidor.setBairro(bairro);
                servidor.setCep(cep);
                servidor.setDataAdmissao(dataAdmissao);
                ServidorDAO.getInstance().alterar(servidor);
            } else if (operacao.equals("excluir")) {
                ServidorDAO.getInstance().excluir(servidor);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarServidorController");
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
