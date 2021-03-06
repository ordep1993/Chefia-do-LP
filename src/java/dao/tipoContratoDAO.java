/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import modelo.TipoContrato;


public class tipoContratoDAO {

    private static tipoContratoDAO instance = new tipoContratoDAO();

    public static tipoContratoDAO getInstance() {
        return instance;
    }

    private tipoContratoDAO() {
    }

    public void salvar(TipoContrato tipoContrato) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            if (tipoContrato.getIdTipoContrato() != null) {
                em.merge(tipoContrato);
            } else {
                em.persist(tipoContrato);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
    }

    
    public List<TipoContrato> getAlltipoContratos() {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        List<TipoContrato> tipoContratos = null;
        try {
            tx.begin();
            TypedQuery<TipoContrato> query = em.createQuery("select t from tipoContrato t", TipoContrato.class);
            tipoContratos = query.getResultList();
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
        return tipoContratos;
    }

    public TipoContrato gettipoContrato(int id) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        TipoContrato tipoContrato = null;
        try {
            tx.begin();
            tipoContrato = em.find(TipoContrato.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
        return tipoContrato;
    }
    
    public void excluir(TipoContrato tipoContrato) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.remove(em.getReference(TipoContrato.class, tipoContrato.getIdTipoContrato()));
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
    }
}
