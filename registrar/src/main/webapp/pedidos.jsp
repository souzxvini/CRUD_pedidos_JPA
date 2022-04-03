<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script src="../JS/index.js"></script>

	<style>

		.etiqueta{
		color:grey;
		font-size: 15px;
		}
		
		.opcoes{
			color:white;
			transition: all .5s;
   			 cursor: pointer;
		}
		.opcoes:hover{
			color:white;
			text-shadow: 1px 1px 30px white;
			
		}
		
		.titulo{
			letter-spacing: 8px;
			text-shadow: 1px 1px 40px white; 
			font-size: 4em;
		}
		
		.btn{
			transition: all .5s;
    		cursor: pointer;
    		text-transform: uppercase;
		}
   		 
   		 html {
    			height: 100%;
   				 min-height: 100%;
		}
   		 
   		 body {
   				 display: flex;
    			flex-direction: column;
    			min-height: 100%;
		}

		footer {
   			 margin-top: auto;
		}
    	
    	.text-footer{
    		letter-spacing: 7px;
    		text-decoration: none;
    	}
    	
    	.text-footer-nome{
    		color: white;
    		letter-spacing: 7px;
    		text-decoration: none;
    		border-bottom: 1px dotted;
    		transition: all .5s;
    	}
    	
    	.text-footer-nome:hover{
    		color:red;
    		letter-spacing: 7px;
    		text-decoration: none;
    		border-bottom: 1px dotted;
    	}
    	
    	opcoes:visited{
    		color:white;
			text-shadow: 1px 1px 30px white;
    	}
		 
		 .title-header{
		 	font-family="National";
		 }
		 
		 @media (max-width: 1200px){
		 
		 }
		 
		 @media (max-width: 992px){
		 	
		 }
}
	</style>
</head>
<body class="p-3 mb-2 bg-light ">

	<header> 
		<div
			class="d-flex justify-content-between p-4  shadow rounded logo-container ">
			<div>
				<h2 class="title-header">Virtual Store</h2>
			</div>
			<span class="btn btn-secondary">Sair</span>
		</div>

	</header>
	<div class="container">
		<div>
			<h1 class="navbar navbar-expand d-flex justify-content-center text-uppercase titulo">Pedidos</h1>
		</div>
		<nav
			class="navbar navbar-expand d-flex justify-content-between bg-dark p-3">
			<div class="navbar navbar-nav ">
			
				<a class="nav-link opcoes" href="/registrar/entrada?acao=listarTodos" >TODOS</a> 
				<a class="nav-link opcoes" href="/registrar/entrada?acao=listarEntregues">ENTREGUES</a> 
				<a class="nav-link opcoes" href="/registrar/entrada?acao=listarAprovados">APROVADOS</a> 
				<a class="nav-link opcoes" href="/registrar/entrada?acao=listarAguardando">AGUARDANDO</a>
			</div>

			<div>
				<a href="/registrar/entrada?acao=formNovoPedido"
					class="btn btn-success">Adicionar novo pedido</a>
			</div>
		</nav>
		<c:forEach items="${listaPedidos}" var="pedido">
			<div class="card shadow p-3 mb-4 bg-white rounded ">
				<div class="card-header  " >
					<h2>${pedido.nomeProduto}</h2>
					
					<p class="etiqueta">PEDIDO #${pedido.id }</p>
				</div>
				<div class="card-body" >
					<div class="row  mb-4">
						<div class="col-4">
							<label>Status: </label> 
							<input type="text" name="status" value="${pedido.status } " disabled="disabled" style="text-align:center; width:50%;">
						</div>

						<div class="col-4">
							<label>Preço: </label>
							<fmt:setLocale value="pt-BR" />
							<fmt:formatNumber value="${pedido.preco}" minFractionDigits="2" type="currency" var="myprice"/>
							<input type="text" name="preco" value="${myprice }" disabled="disabled" style="text-align:center; width:50%;"> 
						</div>

						<div class="col-4">
							<label>Data do Pedido: </label>
							<fmt:formatDate value="${pedido.data}" pattern="dd/MM/yyyy" var="mydata" />
							<input type="text" name="date" value="${mydata }" disabled="disabled" style="text-align:center; width:50%;"> 
						</div>
					</div>

					<div class="row">
						<div class="col-12 d-grid gap-2 mx-auto mb-3">
							<label>Descrição do produto: </label>
							<textarea name="descricao" id="txtArea" rows="3" disabled="disabled">${pedido.descricao}</textarea>
						</div>
					</div>

					<div class="row">
						<div class="col-6 d-grid gap-2 mx-auto">
							<a href="/registrar/entrada?acao=excluir&id=${pedido.id}" class="btn btn-danger" onclick="excluir()">Excluir</a>
						</div>

						<div class="col-6 d-grid gap-2 mx-auto">
							<a href="/registrar/entrada?acao=editar&id=${pedido.id}" class="btn btn-primary">Editar</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
	
	<footer class="bg-dark text-center text-white ">

 		 <div class="text-center p-3 text-footer" >
   		 	DESENVOLVIDO POR: <a class=" text-footer-nome" target="blank_"href="https://www.linkedin.com/in/vinicius-souza-oliveira/">VINICIUS SOUZA</a>
  		</div>
  		
	</footer>

	<script>
		function excluir(){
			alert("PRODUTO EXCLUIDO COM SUCESSO!")
		}
	
	</script>
</body>
</html>

