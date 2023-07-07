<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bookstore.entity.Users" import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Users</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp" />
<div align="center">
<h2 class="pageheading">
<c:if test="${user != null}">
Editar Usuário
</c:if> 

<c:if test="${user==null}">
Criar novo usuário
</c:if>

  </h2>

</div>
<div align="center">
<c:if test="${user != null}">
<form action="update_user" method="post" id="userForm" onsubmit="return validateFormInput()" onsubmit='disableButton()'>
<input type="hidden" name="userId" value="${user.userId}">
</c:if>

<c:if test="${user == null}">
<form action="create_user" method="post" id="userForm" onsubmit="return validateFormInput()" onsubmit=' return disableButton()'>
</c:if>
<table class="form">
<tr>
<td align="right">Email: </td>
<td aligh="left"><input type="text" id="email" name="email" size="20"  value="${user.email}" /></td>
</tr>

<tr>
<td class="test-form" align="right">Nome completo: </td>
<td aligh="left"><input type="text" id="fullname" name="fullname" size="20" value="${user.fullName}"/></td>
</tr>

<tr>
<td aligh="right">senha: </td>
<td aligh="left"><input type="password" id="password" name="password" size="20" value="${user.password}" /></td>
</tr>

<tr><td>&nbsp;</td></tr>

<tr>
<td colspan="2" align="center">
<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
<button  id="buttonCancel">Cancel</button>
<!-- //<button  onclick="location.href = document.referrer;">Cancel</button>  -->

<!-- //with javascipt=  <button  onclick="javascript:history.go(-1);">Cancel</button>
 -->
 
</td>
</tr>

</table>
</form>
</div>

<jsp:directive.include file="footer.jsp"/>


</body>


<script type="text/javascript">
//code jquery is more simply and short email refer to id email and therfore 
//and must add two library jquery in folder js then add them in <head> 
$(document).ready(function(){
	$("#userForm").validate({
		rules:{
			email:{ 
				required:true,
				email:true
				},
			fullname:"required",
			password:"required",
		},
		messages: {
			email: {
			required:"Campo obrigatório",
				email:"Campo obrigatório"
			},
			fullname:"Campo obrigatório",
			password:"Campo obrigatório"
		}
	});
	$("#buttonCancel").click(function(){
		history.go(-1);
	});
});
/* //with java script we can use this but must add onsubmit="return validateFormInput()" in the both
//form action="update_user" and action="create_user"  
function validateFormInput(){
	var fieldEmail=document.getElementById("email");
	var fieldFullname=document.getElementById("fullname");
	var fieldPassword=document.getElementById("password");
	if(fieldEmail.value.length==0){
		alert("Email is requierd!");
		fieldEmail.focus();
		return false;
		
	}
	if(fieldFullname.value.length==0){
		alert("full name is requierd!");
		fieldFullname.focus();
		return false;
		
	}
	
	if(fieldPassword.value.length==0){
		alert("password is requierd!");
		fieldPassword.focus();
		return false;
		
	}
	return true;
	
}
 */
</script>
</html>