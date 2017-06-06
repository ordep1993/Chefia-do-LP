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
@Table(name = "tipo_contrato")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoContrato.findAll", query = "SELECT t FROM TipoContrato t")})
public class TipoContrato implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTipoContrato")
    private Integer idTipoContrato;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "descricao")
    private String descricao;

    public TipoContrato() {
    }

    public TipoContrato(Integer idTipoContrato) {
        this.idTipoContrato = idTipoContrato;
    }

    public TipoContrato(Integer idTipoContrato, String descricao) {
        this.idTipoContrato = idTipoContrato;
        this.descricao = descricao;
    }

    public Integer getIdTipoContrato() {
        return idTipoContrato;
    }

    public void setIdTipoContrato(Integer idTipoContrato) {
        this.idTipoContrato = idTipoContrato;
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
        hash += (idTipoContrato != null ? idTipoContrato.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoContrato)) {
            return false;
        }
        TipoContrato other = (TipoContrato) object;
        if ((this.idTipoContrato == null && other.idTipoContrato != null) || (this.idTipoContrato != null && !this.idTipoContrato.equals(other.idTipoContrato))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.TipoContrato[ idTipoContrato=" + idTipoContrato + " ]";
    }
    
}
