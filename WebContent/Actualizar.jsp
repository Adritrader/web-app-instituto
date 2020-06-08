<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar Alumno</title>
<link rel="stylesheet" type="text/css" href="css\Estilos.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>CAMBIAR ALUMNO</title>
</head>
<body>
	<div class="div1">
		<img src="images/logo.jpg" class="img-fluid" alt="Responsive image">
	</div>
	
	<hr>
	<br>
	</div>
	<div class="container1">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link" href="Index.jsp">Inicio <span
						class="sr-only"></span></a> <a class="nav-item nav-link active"
						href="VerAlumnos.jsp">Registro Alumnos</a> <a
						class="nav-item nav-link" href="VerMatriculas.jsp">Ver matrículas</a> <a
						class="nav-item nav-link" href="VerCursos.jsp">Ver cursos</a>
						<a class="nav-item nav-link" href="Notas.jsp">Notas</a>
				</div>
			</div>
		</nav>
	</div>
	</div>
	<div align="center" class="container" style="text-align: center;">
		<h1>Editar alumno matriculado</h1>
		<hr>
		<table class="table">
			<form method="post" action="AlumnoEditar.jsp">
				<tr>
					<td>Dni</td>
					<td><input type="text" name="dni"
						value="<%=request.getParameter("dni")%>" onlyread /></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nomAlu"
						value="<%=request.getParameter("nomAlu")%>" /></td>
				</tr>
				<tr>
					<td>Apellido 1</td>
					<td><input type="text" name="apellido1"
						value="<%=request.getParameter("apellido1")%>" /></td>
				</tr>
				<tr>
					<td>Apellido 2</td>
					<td><input type="text" name="apellido2"
						value="<%=request.getParameter("apellido2")%>" /></td>
				</tr>
				<tr>
					<td>Dirección</td>
					<td><input type="text" name="direccion"
						value="<%=request.getParameter("direccion")%>" /></td>
				</tr>
		</table>
		<hr>
		<input type="submit" value="Guardar cambios" class="btn btn-primary">
		</form>
	</div>
</body>
</html>