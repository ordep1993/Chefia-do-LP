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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author weber
 */
@Entity
@Table(name = "titulacao")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Titulacao.findAll", query = "SELECT t FROM Titulacao t")})
public class Titulacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTitulacao")
    private Integer idTitulacao;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "descricao")
    private String descricao;

    public Titulacao() {
    }

    public Titulacao(Integer idTitulacao) {
        this.idTitulacao = idTitulacao;
    }

    public Titulacao(Integer idTitulacao, String descricao) {
        this.idTitulacao = idTitulacao;
        this.descricao = descricao;
    }

    public Integer getIdTitulacao() {
        return idTitulacao;
    }

    public void setIdTitulacao(Integer idTitulacao) {
        this.idTitulacao = idTitulacao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTitulacao != null ? idTitulacao.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Titulacao)) {
            return false;
        }
        Titulacao other = (Titulacao) object;
        if ((this.idTitulacao == null && other.idTitulacao != null) || (this.idTitulacao != null && !this.idTitulacao.equals(other.idTitulacao))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Titulacao[ idTitulacao=" + idTitulacao + " ]";
    }
    
}
