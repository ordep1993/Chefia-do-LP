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
import modelo.Titulacao;


public class TitulacaoDAO {

    private static TitulacaoDAO instance = new TitulacaoDAO();

    public static TitulacaoDAO getInstance() {
        return instance;
    }

    private TitulacaoDAO() {
    }

    public void salvar(Titulacao titulacao) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            if (titulacao.getIdTitulacao() != null) {
                em.merge(titulacao);
            } else {
                em.persist(titulacao);
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

    
    public List<Titulacao> getAllTitulacoes() {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        List<Titulacao> titulacoes = null;
        try {
            tx.begin();
            TypedQuery<Titulacao> query = em.createQuery("select t from Titulacao t", Titulacao.class);
            titulacoes = query.getResultList();
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
        return titulacoes;
    }

    public Titulacao getTitulacao(int id) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Titulacao titulacao = null;
        try {
            tx.begin();
            titulacao = em.find(Titulacao.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
        return titulacao;
    }
    
    public void excluir(Titulacao titulacao) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.remove(em.getReference(Titulacao.class, titulacao.getIdTitulacao()));
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
