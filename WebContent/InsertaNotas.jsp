<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insertar notas</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Insertar Notas</title>
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
      <a class="nav-item nav-link" href="Index.jsp">Inicio</a>
      <a class="nav-item nav-link" href="VerAlumnos.jsp">Registro Alumnos</a>
      <a class="nav-item nav-link" href="VerMatriculas.jsp">Ver matrículas</a>
      <a class="nav-item nav-link" href="VerCursos.jsp">Ver cursos</a>
      <a class="nav-item nav-link active" href="Notas.jsp">Notas</a>
    </div>
  </div>
</nav>
</div>
	<%
		Connection conexio = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");
	Statement stat = conexio.createStatement();
	PreparedStatement ps = conexio.prepareStatement("INSERT INTO `instituto`.`cualificacion`(`curso_IdCurso`,`alumno_IdAlumno`, `Primera_EV`,`Segunda_EV`,`Tercera_EV`,`Final`) VALUES(?,?,?,?,?,?)");
	ps.setString(1, request.getParameter("curso2"));
	ps.setString(2, request.getParameter("alumno2"));
	ps.setString(3, request.getParameter("1EVA"));
	ps.setString(4, request.getParameter("2EVA"));
	ps.setString(5, request.getParameter("3EVA"));
	ps.setString(6, request.getParameter("Final"));
	ps.execute();
	out.println("Se han puesto las notas correctamente para el alumno nº: " + request.getParameter("alumno2") + "correctamente;");
	%>


</body>
</html>