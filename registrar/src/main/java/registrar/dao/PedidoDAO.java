package registrar.dao;

import java.util.List;

import javax.persistence.EntityManager;

import registrar.model.Pedido;

public class PedidoDAO {
	
	private Pedido pedido = new Pedido();
	private EntityManager em;

	public PedidoDAO(EntityManager em) {
		this.em = em;
	}

	public void inserir(Pedido pedido) {
		em.getTransaction().begin();
		this.em.persist(pedido);
		em.getTransaction().commit();
	}

	public Pedido buscarPorId(Long id) {
		return em.find(Pedido.class, id);
	}

	public Pedido excluir(Long id) {
		em.getTransaction().begin();
			pedido = em.find(Pedido.class, id);
			em.remove(pedido);
			em.getTransaction().commit();
		return pedido;
	}

	public void atualizar(Pedido pedido) {
		em.getTransaction().begin();
		em.merge(pedido);
		em.getTransaction().commit();
	}
	
	public List<Pedido> listar(){
		
        String jpql =
        		"SELECT p FROM Pedido p order by p.id desc";
		return em.createQuery(jpql, Pedido.class).getResultList();
    }
	
	public List<Pedido> buscarPorStatus(String status) {
		String jpql =
        		"SELECT p FROM Pedido p where p.status = :status order by p.id desc";
		return em.createQuery(jpql, Pedido.class).setParameter("status", status).getResultList();
	}

	
}
