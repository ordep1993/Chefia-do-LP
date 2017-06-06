package controller;

import dao.AlunoDAO;
import dao.ProfessorDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;

public class ManterAlunoController extends HttpServlet {

    private Aluno aluno;

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
            request.setAttribute("alunos", AlunoDAO.getInstance().getAllAlunos());
            if (!operacao.equals("incluir")) {
                int matricula = Integer.parseInt(request.getParameter("txtMatricula"));
                aluno = AlunoDAO.getInstance().getAluno(matricula);
                request.setAttribute("aluno", aluno);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterAluno.jsp");
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
            String email = request.getParameter("txtEmail");
            int telefone = Integer.parseInt(request.getParameter("txtTelefone"));
            int celular = Integer.parseInt(request.getParameter("txtCelular"));
            String logradouro = request.getParameter("txtLogradouro");
            int numero = Integer.parseInt(request.getParameter("txtNumero"));
            String complemento = request.getParameter("txtComplemento");
            String bairro = request.getParameter("txtBairro");
            int cep = Integer.parseInt(request.getParameter("txtCEP"));
            int anoInicio = Integer.parseInt(request.getParameter("txtAnoInicio"));
            int semestreInicio = Integer.parseInt(request.getParameter("txtSemestreInicio"));
            boolean estadoAluno = Boolean.parseBoolean(request.getParameter("txtEstadoAluno"));
            
            if (operacao.equals("incluir")) {
                aluno = new Aluno(matricula,nome,dataNasc,cpf,dataExpedicao,email,telefone,celular,logradouro,numero,complemento,bairro,cep,anoInicio,semestreInicio,estadoAluno);
                AlunoDAO.getInstance().salvar(aluno);
            } else if (operacao.equals("editar")) {
                aluno.setNome(nome);
                aluno.setDataNasc(dataNasc);
                aluno.setCpf(cpf);
                aluno.setDataExpedicao(dataExpedicao);
                aluno.setEmail(email);
                aluno.setTelefone(telefone);
                aluno.setCelular(celular);
                aluno.setLogradouro(logradouro);
                aluno.setNumero(numero);
                aluno.setComplemento(complemento);
                aluno.setBairro(bairro);
                aluno.setCep(cep);
                aluno.setAnoInicio(anoInicio);
                aluno.setSemestreInicio(semestreInicio);
                aluno.setEstadoAluno(estadoAluno);
                
                AlunoDAO.getInstance().alterar(aluno);
            } else if (operacao.equals("excluir")) {
                AlunoDAO.getInstance().excluir(aluno);
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarAlunoController");
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
