<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css\Estilos.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Guadar Alumno</title>
</head>
<body>
	<div class="container">
		<img src="images/logo.jpg" class="img-fluid" alt="Responsive image">
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
	Statement stat = conexio.createStatement();
	PreparedStatement ps = conexio.prepareStatement(
			"INSERT INTO `instituto`.`alumno` (`IdAlumno`,`nomAlu`, `apellido1`,`apellido2`, `dni`, `direccion`) VALUES(?,?,?,?,?,?)");
	ps.setString(1, request.getParameter("IdAlumno"));
	ps.setString(2, request.getParameter("nomAlu"));
	ps.setString(3, request.getParameter("apellido1"));
	ps.setString(4, request.getParameter("apellido2"));
	ps.setString(5, request.getParameter("dni"));
	ps.setString(6, request.getParameter("direccion"));
	ps.execute();
	ps.close();
	out.println("El alumno : " + request.getParameter("nomAlu") + " " + request.getParameter("apellido1") + " "
			+ request.getParameter("apellido2") + " ha sido matriculado. ");
	%>


</body>
</html>