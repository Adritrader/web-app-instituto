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
<title>Cursos Instituto</title>
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
      <a class="nav-item nav-link" href="Index.jsp">Inicio </a>
      <a class="nav-item nav-link" href="VerAlumnos.jsp">Registro Alumnos</a>
      <a class="nav-item nav-link" href="VerMatriculas.jsp">Ver matrículas</a>
      <a class="nav-item nav-link active" href="VerCursos.jsp">Ver cursos</a>
      <a class="nav-item nav-link" href="Notas.jsp">Notas</a>
    </div>
  </div>
</nav>
</div>
<h3 style="text-align: center; margin: 15px;">Cursos Instituto Ausias March</h3>
	<%
	Connection conexio = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");
	Statement s = conexio.createStatement();
	ResultSet llistacursos = s.executeQuery("SELECT * FROM curso");%>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id Curso</th>
				<th scope="col">Info Curso</th>
				<th scope="col">Data Inicio</th>
				<th scope="col">Data Fin</th>
				<th scope="col">Plazas Curso</th>
				<th scope="col">Máx. Alumnos</th>
				<th scope="col">Profesor</th>
			</tr>
		</thead>
		
	<%while (llistacursos.next()) {%>
		<tr>
			<td>
				<%out.println(" " + llistacursos.getString("IdCurso"));%>
			</td>
			<td>
				<%out.println(" " + llistacursos.getString("infoCurso"));%>
			</td>
			<td>
				<%out.println(" " + llistacursos.getString("dataInicio"));%>
			</td>
			<td>
				<%out.println(" " + llistacursos.getString("dataFin"));%>
			</td>
			<td>
				<%out.println(" " + llistacursos.getString("plazasCurso"));%>
			</td>
			<td>
				<%out.println(" " + llistacursos.getString("maxAlum"));%>
			</td>
			<td>
				<%out.println(" " + llistacursos.getString("nomApeProf"));%>
			</td>
		</tr>
		
		 <%
	}
	llistacursos.close();
	s.close();
	conexio.close();
	%> 
	</table>
</body>
</html>