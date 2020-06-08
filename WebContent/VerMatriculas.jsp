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
<title>Matrícula</title>
</head>
<body>
	<div class="container">
		<img src="images/logo.jpg" class="img-fluid" alt="Responsive image">
	</div>
	<hr>
	<div class="container1">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link" href="Index.jsp">Inicio</a> 
					<a class="nav-item nav-link"href="VerAlumnos.jsp">Registro Alumnos</a> <a
						class="nav-item nav-link active" href="VerMatriculas.jsp">Ver matrículas</a> <a
						class="nav-item nav-link" href="VerCursos.jsp">Ver cursos</a>
						<a class="nav-item nav-link" href="Notas.jsp">Notas</a>
				</div>
			</div>
		</nav>
	</div>
	</div>
	
	<h2 style="text-align: center;">Alumnos matriculados</h2>
	<%
	Connection conexio = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");
	Statement s = conexio.createStatement();
	ResultSet llistamatriculas = s.executeQuery("SELECT * FROM matricula");%>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id curso</th>
				<th scope="col">Id alumno</th>
				<th scope="col">Info matrícula</th>
				<th scope="col">Data matrícula</th>

			</tr>
		</thead>
		
	<%while (llistamatriculas.next()) {%>
		<tr>
			<td>
				<%out.println(" " + llistamatriculas.getString("curso_IdCurso"));%>
			</td>
			<td>
				<%out.println(" " + llistamatriculas.getInt("alumno_IdAlumno"));%>
			</td>
			<td>
				<%out.println(" " + llistamatriculas.getString("infoMat"));%>
			</td>
			<td>
				<%out.println(" " + llistamatriculas.getString("dataMat"));%>
			</td>
		</tr>
		
		 <%
	}
	
	llistamatriculas.close();
	s.close();
	conexio.close();
	%> 
	<form method="post"action="DarAltaAlumno.jsp">
	<button class="btn btn-success" id="botonActualizar" type="submit" style="margin: 15px;">Registrar alumno en curso</button>
	</form>
</body>
</table>
</html>