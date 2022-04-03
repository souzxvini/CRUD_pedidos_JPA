<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/entrada" var="linkEntradaServlet" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="pt">
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
	<style>
		.titulo{
			letter-spacing: 8px;
			text-shadow: 1px 1px 30px white; 
			font-size: 4em;
			color: white;
			
		}
		
		.btn{
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
    	.text-footer{
    		letter-spacing: 7px;
    		text-decoration: none;
    	}
    	
    	.text-footer-nome{
    		color: black;
    		letter-spacing: 7px;
    		text-decoration: none;
    		border-bottom: 1px dotted;
    		transition: all .5s;
    	}
    	
    	.text-footer-nome:hover{
    		color:blue;
    		letter-spacing: 7px;
    		text-decoration: none;
    		border-bottom: 1px dotted;
    	}
    	
    	.input-status-disabled{
    		width:32%;
    		height:20px;
    	}
    	
    	.input-status-disabled-div{
    		color:grey;
    		font-size:14px;
    		width:30%;
    	}
    	
    	@media (min-width: 1200px){
		 	
		 }
	</style>
	<title>EDITAR PEDIDO</title>

</head>
<body class="p-3 mb-2 bg-primary tudo">
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
			<h1 class="navbar navbar-expand d-flex justify-content-center titulo">EDITAR PEDIDO</h1>
		</div>
		<div >
			<form method="post" action="${linkEntradaServlet}" class="form-group">
				<div class="card shadow p-3 mb-5 bg-white rounded ">
					<div class="card-header ">
						<div>
							<h2 >PEDIDO #${pedido.id }</h2>
						</div>
						
						<div class="input-status-disabled-div">
							<label class="text-uppercase">STATUS ATUAL: </label> 
							<input class="input-status-disabled" type="text" name="data" value="${pedido.status }" disabled="disabled">
						</div>
					</div>
					
					<div class="card-body " >
						<div class="row mb-4" >
							<div class="col-6 d-grid "  >
								<input type="hidden" name="id" value="${pedido.id}"> 
								<label class="text-uppercase">NOME: </label> 
								<input type="text" name="nomeProduto" value="${pedido.nomeProduto }">
							</div>
							
							<div class="col-6 d-grid " >
								<label class="text-uppercase">PREÇO: </label> 
								<input type="text" name="preco" value="${pedido.preco }">
							</div>
						</div>
						
						<div class="row mb-4">
							<div class="col-12 d-grid " >
								<label class="text-uppercase">DESCRIÇÃO: </label> 
								<textarea name="descricao"rows="3" required >${pedido.descricao }</textarea>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col-6 d-grid" >
								<fmt:formatDate value="${pedido.data}" pattern="dd/MM/yyyy" var="mydata"/>
								<label class="text-uppercase">DATA DO PEDIDO: </label> 
								<input type="text" name="data" value="${mydata }">
							</div>
							
							<div class="col-6 d-grid " >
								<label class="text-uppercase">SELECIONE O NOVO STATUS: </label> 
								<select name="status" >
									<option>${pedido.status }</option>
									<option>AGUARDANDO</option>
									<option>APROVADO</option>
									<option>ENTREGUE</option>
								</select>
							</div>
						</div>
							
						<div class="row">
							<div class="col-6 d-grid gap-2 mx-auto">
								<input type="submit" name="acao" value="atualizar" class="text-uppercase btn btn-success">
							</div>
							
							<div class="col-6 d-grid gap-2 mx-auto">
								<a href="/registrar/entrada?acao=listarPedidos" class="text-uppercase btn btn-secondary">Voltar</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<footer class="bg-light text-center text-dark  ">

 		 <div class="text-center p-3 text-footer" >
   		 	DESENVOLVIDO POR: <a class=" text-footer-nome" target="blank_"href="https://www.linkedin.com/in/vinicius-souza-oliveira/">VINICIUS SOUZA</a>
  		</div>
  		
	</footer>
	
	
	
	<script>
	
	function editar(){
		alert("PRODUTO EDITADO COM SUCESSO!")
	}
	</script>
</body>
</html>