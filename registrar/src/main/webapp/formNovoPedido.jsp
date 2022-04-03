<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/entrada" var="linkEntradaServlet" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>FormNovoPedidoooo</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
	<style>
		.btn{
			text-transform: uppercase
		}
		
		.titulo{
			letter-spacing: 8px;
			text-shadow: 1px 1px 30px white; 
			font-size: 4em;
			color: white;
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
    		text-decoration: none
    	}
    	
    	.text-footer-nome{
    		color: black;
    		letter-spacing: 7px;
    		text-decoration: none;
    		border-bottom: 1px dotted;
    		transition: all .5s;
    	}
    	
    	.text-footer-nome:hover{
    		color:green;
    		letter-spacing: 7px;
    		text-decoration: none;
    		border-bottom: 1px dotted;
    		
    	}
    	
    	@media (max-width: 1200px){
		 
		 	.titulo{
		 		text-align:center;
		 	}
		 }
		 
		 
	</style>
</head>
<body class="p-3 mb-2 bg-success tudo">
	<header class=" bg-light">
		<div
			class="d-flex justify-content-between p-4  shadow rounded logo-container ">
			<div>
				<h2>Virtual Store</h2>
			</div>
			<span class="btn btn-secondary">Sair</span>
		</div>

	</header>
	<div class="container">
		<div>
			<h1 class="navbar navbar-expand d-flex justify-content-center titulo">INSIRA UM NOVO PEDIDO</h1>
		</div>
		<div>
			<form method="post" action="${linkEntradaServlet}" >
			<div class="card shadow p-3 mb-5 bg-white rounded">
				<div class="card-header">
					<h2 >PEDIDO</h2>
				</div>
				<div class="card-body " style="text-align:center;">
					<div class="row mb-4">
						<div class="col-12 d-grid " style="width:50%; margin:auto;">
							<label>NOME: </label> 
								<input type="text" name="nomeProduto"  autocomplete="off" required>
						</div>
					</div>
					
						<div class="row mb-4">
							<div class="col-12 d-grid "style="width:50%; margin:auto;">
								<label>PREÇO: </label> 
								<input type="text" name="preco" required autocomplete="off">
							</div>
						</div>
					
						<div class="row mb-4">
							<div class="col-12 d-grid "style="width:50%; margin:auto;">
								<label>DESCRIÇÃO: </label> 
								
								<textarea name="descricao"rows="3" required autocomplete="off"></textarea>
							</div>
						</div>
					
						<div class="row mb-4">
							<div class="col-12 d-grid "style="width:50%; margin:auto;">
								<label>DATA DO PEDIDO: </label> 
								<input type="text" name="data" required autocomplete="off">
							</div>
						</div>
					
						<div class="row mb-4">
							<div class="col-12 d-grid "style="width:50%; margin:auto;">
								<label>STATUS: </label> 
								<select name="status" required >
									<option>AGUARDANDO</option>
									<option>APROVADO</option>
									<option>ENTREGUE</option>
								</select>
							</div>
						</div>
						
						<div class="row">
							<div class="col-6 d-grid gap-2 mx-auto">
								<input class="btn btn-success "type="submit" name="acao" value="inserir"  >
							</div>

							<div class="col-6 d-grid gap-2 mx-auto">
								<a href="/registrar/entrada?acao=listarPedidos" class="btn btn-secondary">Voltar</a>
							</div>
					</div>
					</div>
				</div>
			</form>
			</div>
		</div>
		
		<footer class="bg-light text-center text-dark ">

 		 <div class="text-center p-3 text-footer" >
   		 	DESENVOLVIDO POR: <a class=" text-footer-nome" target="blank_"href="https://www.linkedin.com/in/vinicius-souza-oliveira/">VINICIUS SOUZA</a>
  		</div>
  		
	</footer>
	
	<script>
	function inserir(){
		alert("PRODUTO INSERIDO COM SUCESSO!")
	}
	
	function editar(){
		alert("PRODUTO EDITADO COM SUCESSO!")
	}
	</script>
</body>
</html>