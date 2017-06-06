/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author weber
 */
@Entity
@Table(name = "avaliacao")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Avaliacao.findAll", query = "SELECT a FROM Avaliacao a")})
public class Avaliacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "avaliacao1")
    private int avaliacao1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "avaliacao2")
    private int avaliacao2;
    @Basic(optional = false)
    @NotNull
    @Column(name = "avaliacaoFinal")
    private int avaliacaoFinal;
    @Basic(optional = false)
    @NotNull
    @JoinColumn(name = "codigoDisciplina", referencedColumnName = "codigo")
    @ManyToOne(optional = false)
    private Disciplina codigoDisciplina;    
    @JoinColumn(name = "codigoAluno", referencedColumnName = "matricula")
    @ManyToOne(optional = false)
    private Aluno codigoAluno;

    public Avaliacao() {
    }

    public Avaliacao(Integer codigo) {
        this.codigo = codigo;
    }

    public Avaliacao(Integer codigo, int avaliacao1, int avaliacao2, int avaliacaoFinal , Aluno codigoAluno , Disciplina codigoDisciplina) {
        this.codigo = codigo;
        this.avaliacao1 = avaliacao1;
        this.avaliacao2 = avaliacao2;
        this.avaliacaoFinal = avaliacaoFinal;
        this.codigoAluno = codigoAluno;
        this.codigoDisciplina = codigoDisciplina;
       
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public int getAvaliacao1() {
        return avaliacao1;
    }

    public void setAvaliacao1(int avaliacao1) {
        this.avaliacao1 = avaliacao1;
    }

    public int getAvaliacao2() {
        return avaliacao2;
    }

    public void setAvaliacao2(int avaliacao2) {
        this.avaliacao2 = avaliacao2;
    }

    public int getAvaliacaoFinal() {
        return avaliacaoFinal;
    }

    public void setAvaliacaoFinal(int avaliacaoFinal) {
        this.avaliacaoFinal = avaliacaoFinal;
    }

    public Disciplina getCodigoDisciplina() {
        return codigoDisciplina;
    }

    public void setCodigoDisciplina(Disciplina codigoDisciplina) {
        this.codigoDisciplina = codigoDisciplina;
    }

    public Aluno getCodigoAluno() {
        return codigoAluno;
    }

    public void setCodigoAluno(Aluno codigoAluno) {
        this.codigoAluno = codigoAluno;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Avaliacao)) {
            return false;
        }
        Avaliacao other = (Avaliacao) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Avaliacao[ codigo=" + codigo + " ]";
    }
    
}
