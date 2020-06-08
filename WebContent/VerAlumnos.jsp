<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<!DOCTYPEhtml>
<html>
<head>
<metacharset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css\Estilos.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Registro Alumnos</title>
</head>
<body>
	<div class="container">
		<img src="images/logo.jpg" class="img-fluid" alt="Responsive image">
	</div>
	<hr>
	<div class="container1">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link" href="Index.jsp">Inicio <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link active" href="VerAlumnos.jsp">Registro Alumnos</a>
      <a class="nav-item nav-link" href="VerMatriculas.jsp">Ver matrículas</a>
      <a class="nav-item nav-link" href="VerCursos.jsp">Ver cursos</a>
      <a class="nav-item nav-link" href="Notas.jsp">Notas</a>
    </div>
  </div>
</nav>
</div>
	<h3 style="text-align: center; margin: 15px;">Lista de alumnos matriculados</h3>
	<%
	Connection conexio = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");
	Statement s = conexio.createStatement();
	ResultSet listaAlumnos = s.executeQuery("SELECT * FROM alumno");%>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id Alumno</th>
				<th scope="col">Nombre</th>
				<th scope="col">1º Apellido</th>
				<th scope="col">2º Apellido</th>
				<th scope="col">DNI</th>
				<th scope="col">Dirección</th>
				<th scope="col">Editar</th>
				<th scope="col">Borrar</th>
			</tr>
		</thead>
		<%
	while (listaAlumnos.next()) {%>
		<tr>
			<td>
				<%out.println(" " + listaAlumnos.getInt("IdAlumno"));%>
			</td>
			<td>
				<%out.println(" " + listaAlumnos.getString("nomAlu"));%>
			</td>
			<td>
				<%out.println(" " + listaAlumnos.getString("apellido1"));%>
			</td>
			<td>
				<%out.println(" " + listaAlumnos.getString("apellido2"));%>
			</td>
			<td>
				<%out.println(" " + listaAlumnos.getString("dni"));%>
			</td>
			<td>
				<%out.println(" " + listaAlumnos.getString("direccion"));%>
			
			</td>
			<td>
			<form action="Actualizar.jsp" method="post">
				<input type="hidden" name="dni" value="<%=listaAlumnos.getInt("dni")%>">
				<button class="btn btn-success" id="botonEditar" type="submit">Editar</button>
			</form></td>
			<td><form action="Borrar.jsp" method="post">
				<input type="hidden" name="dni" value="<%=listaAlumnos.getInt("dni")%> ">
				<button class="btn btn-danger" id="botonBorrar" type="submit">Borrar</button>
			</form>
			</td></tr> <%
	}
	listaAlumnos.close();
	s.close();
	conexio.close();
	%> 

	</table>
	<hr>
	
	
	<div class="container col-6">
	<h2 style="text-align: center; margin: 15px;">Matricula un nuevo alumno</h2>
	<table class="table table-bordered table-dark">
	<form method="post" action="GuardaAlumno.jsp">
				<tr>
					<td>Id Alumno</td>
					<td><input type ="text" name="IdAlumno" style="width: 40px;" /></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type ="text" name="nomAlu"/></td>
				</tr>
				<tr>
					<td>Apellido1</td>
					<td><input type ="text" name="apellido1" /></td>
				</tr>
				<tr>
					<td>Apellido2</td>
					<td><input type ="text" name="apellido2" /></td>
				</tr>
				<tr>
					<td>DNI</td>
					<td><input type ="text" name="dni" /></td>
				</tr>
				<tr>
					<td>Dirección</td>
					<td><input type ="text" name="direccion" /></td>
				</tr>
	</table>
	
	<hr>
	<input type ="submit" value="Aceptar" class="btn btn-primary col-3" style="margin-left: 250px;">
	</form>
	</div>
	
	
</body>
</html>
</body>
</html>