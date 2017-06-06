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
@Table(name = "matricula")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Matricula.findAll", query = "SELECT m FROM Matricula m")})
public class Matricula implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codigo")
    private Integer codigo;
    @JoinColumn(name = "codigoAluno", referencedColumnName = "matricula")
    @ManyToOne
    private Aluno codigoAluno;
    @JoinColumn(name = "codigoCurso", referencedColumnName = "codigo")
    @ManyToOne
    private Curso codigoCurso;
    @JoinColumn(name = "codigoDisciplina", referencedColumnName = "codigo")
    @ManyToOne
    private Disciplina codigoDisciplina;
    @JoinColumn(name = "codigoTurma", referencedColumnName = "codigo")
    @ManyToOne
    private Turma codigoTurma;

    public Matricula() {
    }

    public Matricula(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Aluno getCodigoAluno() {
        return codigoAluno;
    }

    public void setCodigoAluno(Aluno codigoAluno) {
        this.codigoAluno = codigoAluno;
    }

    public Curso getCodigoCurso() {
        return codigoCurso;
    }

    public void setCodigoCurso(Curso codigoCurso) {
        this.codigoCurso = codigoCurso;
    }

    public Disciplina getCodigoDisciplina() {
        return codigoDisciplina;
    }

    public void setCodigoDisciplina(Disciplina codigoDisciplina) {
        this.codigoDisciplina = codigoDisciplina;
    }

    public Turma getCodigoTurma() {
        return codigoTurma;
    }

    public void setCodigoTurma(Turma codigoTurma) {
        this.codigoTurma = codigoTurma;
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
        if (!(object instanceof Matricula)) {
            return false;
        }
        Matricula other = (Matricula) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Matricula[ codigo=" + codigo + " ]";
    }
    
}
