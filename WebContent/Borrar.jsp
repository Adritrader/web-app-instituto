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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Borrar Alumno</title>
</head>
<body>
	<div class="div1">
		<img src="images/logo.jpg" class="img-fluid"
			alt="Responsive image">
	</div>
	<div class="container1">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="Index.jsp">Inicio <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="VerAlumnos.jsp">Registro Alumnos</a>
      <a class="nav-item nav-link" href="VerMatriculas.jsp">Ver matrículas</a>
      <a class="nav-item nav-link" href="VerCursos.jsp">Ver cursos</a>
      <a class="nav-item nav-link" href="Notas.jsp">Notas</a>
    </div>
  </div>
</nav>
</div>
	<%
		Connection conexio = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");
	Statement s = conexio.createStatement();
	s.execute("DELETE FROM matricula WHERE alumno_IdAlumno='" + request.getParameter("IdAlumno") + "'");
	s.execute("DELETE FROM alumno WHERE dni='" + request.getParameter("dni") + "'");
	s.close();
	conexio.close();
	%>
	<h3>Alumno borrado correctamente.</h3>
	<%
		out.println("El número de DNI del alumno borrado es: " + request.getParameter("dni"));
	%>
</body>
</html>