package registrar.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registrar.dao.PedidoDAO;
import registrar.model.Pedido;
import registrar.util.JPAUtil;

@WebServlet("/entrada")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		try {
			switch (acao) {
			case "listarPedidos":
				listar(request, response);
				break;
			case "formNovoPedido":
				formNovoPedido(request, response);
				break;
			case "inserir":
				inserir(request, response);
				break;
			case "excluir":
				excluir(request, response);
				break;
			case "editar":
				formEditar(request, response);
				break;
			case "atualizar":
				atualizar(request, response);
				break;
			case "listarTodos":
				listar(request, response);
				break;
			case "listarEntregues":
				listarEntregues(request, response);
				break;
			case "listarAprovados":
				listarAprovados(request, response);
				break;
			case "listarAguardando":
				listarAguardando(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void listar(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		EntityManager em = JPAUtil.getEntityManager();

		PedidoDAO pedidoDAO = new PedidoDAO(em);

		String url = "TODOS";
		
		List<Pedido> pedidos = pedidoDAO.listar();

		request.setAttribute("listaPedidos", pedidos);
		request.setAttribute("url", url);
		
		if(pedidos.isEmpty() || pedidos.size() == 0) {
			RequestDispatcher dp = request.getRequestDispatcher("/listaVazia.jsp");
			dp.forward(request, response);
		}
		else {
			RequestDispatcher dp = request.getRequestDispatcher("/pedidos.jsp");
		dp.forward(request, response);
		}
	}

	public void formNovoPedido(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dp = request.getRequestDispatcher("/formNovoPedido.jsp");
		dp.forward(request, response);
	}

	public void inserir(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, java.text.ParseException {

		EntityManager em = JPAUtil.getEntityManager();

		String nomeProduto = request.getParameter("nomeProduto");
		String paramPreco = request.getParameter("preco");
		BigDecimal preco = BigDecimal.valueOf(Double.valueOf(paramPreco));
		String status = request.getParameter("status");
		String descricao = request.getParameter("descricao");

		String paramData = request.getParameter("data");

		Date data = null;

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		data = sdf.parse(paramData);

		PedidoDAO pedidoDAO = new PedidoDAO(em);
		Pedido pedido = new Pedido(nomeProduto, preco, status, descricao, data);

		pedidoDAO.inserir(pedido);

		List<Pedido> pedidos = pedidoDAO.listar();
		request.setAttribute("listaPedidos", pedidos);

		response.sendRedirect("/registrar/entrada?acao=listarPedidos");
		
//		RequestDispatcher dp = request.getRequestDispatcher("/pedidos.jsp");
//		dp.forward(request, response);

	}

	public void excluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = JPAUtil.getEntityManager();

		PedidoDAO pedidoDAO = new PedidoDAO(em);
		String paramId = request.getParameter("id");
		Long id = Long.valueOf(paramId);

		pedidoDAO.excluir(id);

		List<Pedido> pedidos = pedidoDAO.listar();
		request.setAttribute("listaPedidos", pedidos);
		
		if(pedidos.isEmpty() || pedidos.size() == 0) {
			RequestDispatcher dp = request.getRequestDispatcher("/listaVazia.jsp");
			dp.forward(request, response);
		}
		else {
			RequestDispatcher dp = request.getRequestDispatcher("/pedidos.jsp");
			dp.forward(request, response);
		}

	}
	
	public void formEditar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EntityManager em = JPAUtil.getEntityManager();

		PedidoDAO pedidoDAO = new PedidoDAO(em);
		String paramId = request.getParameter("id");
		Long id = Long.valueOf(paramId);

		pedidoDAO.buscarPorId(id);

		Pedido pedido = pedidoDAO.buscarPorId(id);

		request.setAttribute("pedido", pedido);
		RequestDispatcher dp = request.getRequestDispatcher("/formEditar.jsp");
		dp.forward(request, response);

	}

	public void atualizar(HttpServletRequest request, HttpServletResponse response) throws IOException, java.text.ParseException {
		EntityManager em = JPAUtil.getEntityManager();
		PedidoDAO pedidoDAO = new PedidoDAO(em);
		
		Long id = Long.parseLong(request.getParameter("id"));
		String nomeProduto = request.getParameter("nomeProduto");
		String paramPreco = request.getParameter("preco");
		BigDecimal preco = BigDecimal.valueOf(Double.valueOf(paramPreco));
		String status = request.getParameter("status");
		String descricao = request.getParameter("descricao");

		String paramData = request.getParameter("data");
		Date data = null;

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		data = sdf.parse(paramData);

		Pedido pedido = new Pedido(id, nomeProduto, preco, status, descricao, data);

		pedidoDAO.atualizar(pedido);

		response.sendRedirect("/registrar/entrada?acao=listarPedidos");
	}

	public void listarEntregues(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		EntityManager em = JPAUtil.getEntityManager();

		PedidoDAO pedidoDAO = new PedidoDAO(em);
		String status = "ENTREGUE";

		List<Pedido> pedidos = pedidoDAO.buscarPorStatus(status);

		request.setAttribute("listaPedidos", pedidos);
		
		if(pedidos.isEmpty() || pedidos.size() == 0) {
			RequestDispatcher dp = request.getRequestDispatcher("/listaVaziaEntregues.jsp");
			dp.forward(request, response);
		}
		else {
			RequestDispatcher dp = request.getRequestDispatcher("/pedidos.jsp");
		dp.forward(request, response);
		}
	}
	
	public void listarAprovados(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		EntityManager em = JPAUtil.getEntityManager();

		PedidoDAO pedidoDAO = new PedidoDAO(em);
		String status = "APROVADO";

		List<Pedido> pedidos = pedidoDAO.buscarPorStatus(status);

		request.setAttribute("listaPedidos", pedidos);
		
		if(pedidos.isEmpty() || pedidos.size() == 0) {
			RequestDispatcher dp = request.getRequestDispatcher("/listaVaziaAprovados.jsp");
			dp.forward(request, response);
		}
		else {
			RequestDispatcher dp = request.getRequestDispatcher("/pedidos.jsp");
		dp.forward(request, response);
		}
	}
	
	public void listarAguardando(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		EntityManager em = JPAUtil.getEntityManager();

		PedidoDAO pedidoDAO = new PedidoDAO(em);
		String status = "AGUARDANDO";

		List<Pedido> pedidos = pedidoDAO.buscarPorStatus(status);

		request.setAttribute("listaPedidos", pedidos);
		
		if(pedidos.isEmpty() || pedidos.size() == 0) {
			RequestDispatcher dp = request.getRequestDispatcher("/listaVaziaAguardando.jsp");
			dp.forward(request, response);
		}
		else {
			RequestDispatcher dp = request.getRequestDispatcher("/pedidos.jsp");
		dp.forward(request, response);
		}
	}
	
}
