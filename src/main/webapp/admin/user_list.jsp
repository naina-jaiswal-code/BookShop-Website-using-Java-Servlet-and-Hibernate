<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bookstore.entity.Users" import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp" />


	<div align="center">
		<h2>Gerenciamento de usuários</h2>
		<a href="user_form.jsp">Criar novo usuário</a>
	</div>
	<c:if test="${ message != null}">
		<div>
			<h4 align="center" style="color: green;">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>



	<br>
	<div align="center">
		<table border="1">
			<tr>
				<th>Índice</th>
				<th>Id</th>
				<th>Nome Completo</th>
				<th>E-mail</th>
				<th>Ações</th>
			</tr>
			<c:forEach var="user" items="${listUsers}" varStatus="status">

				<tr>
					<td>${status.index + 1}</td>
					<td>${user.userId}</td>
					<td>${user.fullName}</td>
					<td>${user.email}</td>

					<td><a href="edit_user?id=${user.userId}">Edit</a> &nbsp; <a
						href="delete_user?id=${user.userId}" class="deleteLink" id="${user.userId}">Delete</a></td>

				</tr>

			</c:forEach>

		</table>
	</div>

	<div align="center"></div>

	<div align="center"></div>

	<div align="center"></div>

	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
$(document).ready(function(){
	$(".deleteLink").each(function(){
		$(this).on("click",function(){
			
			userId=$(this).attr("id");
			if(confirm('Tem certeza que quer deletar o User: '+userId+'?')){
				window.location='delete_user?id='+userId;
			}else{
				 location.reload();
			}
					
			
		});
	});
});
//java script must for delete do this code with <a href="javascript:confirmDelete(${user.userId})">Delete</a>
/* function confirmDelete(userId){
	if (confirm('Are you sure you want to delete the user with ID '+userId+ '?')) {
		window.location= 'delete_user?id=' +userId;
	}
} */
</script>
</body>
</html>