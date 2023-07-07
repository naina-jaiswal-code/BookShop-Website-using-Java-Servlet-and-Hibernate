<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>Evergreeen Bookstore Adminstration</title>
<link rel="stylesheet" href="../css/style.css">

</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div align="center">
<h2 class="pageheading">Painel Administrativo
</h2>
</div>



<div align="center">
<hr width="60%" />
<h2 class="pageheading">Ações rápidas: </h2>
<b>
<a href="create_book"> Novo Livro</a>&nbsp;
<a href="create_user">Novo Usuário</a>&nbsp;
<a href="create_category">Nova Categoria</a>&nbsp;
<a href="create_customer">Novo cliente</a>&nbsp;
</b>
</div>



<div align="center">
<hr width="60%" />
<h2 class="pageheading">Vendas recentes:</h2>
</div>

<div align="center">
<hr width="60%" />
<h2 class="pageheading">Revisões recentes:</h2>
</div>

<div align="center">
<hr width="60%" />
<h2 class="pageheading">Estatisticas:</h2>
<hr width="60%" />
</div>

<div class="footer">
<jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>