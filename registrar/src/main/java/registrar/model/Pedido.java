package registrar.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pedidos")
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="nome_produto")
	private String nomeProduto;
	private BigDecimal preco;
	private String status;
	private String descricao;
	private Date data;
	
	public Pedido(String nomeProduto, BigDecimal preco, String status, String descricao, Date data) {
		super();
		this.nomeProduto = nomeProduto;
		this.preco = preco;
		this.status = status;
		this.descricao = descricao;
		this.data = data;
	}
	
	public Pedido() {
		
	}
	
	public Pedido(Long id, String nomeProduto, BigDecimal preco, String status, String descricao, Date data) {
		this.id = id;
		this.nomeProduto = nomeProduto;
		this.preco = preco;
		this.status = status;
		this.descricao = descricao;
		this.data = data;
	}

	public Pedido(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public BigDecimal getPreco() {
		return preco;
	}
	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
	
	
	
	
}
