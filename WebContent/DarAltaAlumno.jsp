<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPEhtml>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dar Altas</title>
<link href="css/Estilos.css " rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<div class="div1">
		<img src="images/logo.jpg" class="img-fluid" alt="Responsive image">
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
					<a class="nav-item nav-link active" href="Index.jsp">Inicio <span
						class="sr-only"></span></a> <a class="nav-item nav-link"
						href="VerAlumnos.jsp">Registro Alumnos</a> <a
						class="nav-item nav-link" href="VerMatriculas.jsp">Ver matriculas</a> <a
						class="nav-item nav-link" href="VerCursos.jsp">Ver cursos</a>
				</div>
			</div>
		</nav>
	</div>
	<form method="post" action="IntroAluCurs.jsp">
		<label>Id Alumne:</label><input type="text" name="matricula"
			placeholder="Id Alumne" /> <input type="date" id="start"
			name="DATA" value="2020-05-25" min="2018-01-01" max="2021-12-31"
			placeholder="YYYY-MM-DD"> <select name="ALUMNOS">
			<%
				Connection conexioalumno = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC",
					"root", "");
			Statement s = conexioalumno.createStatement();
			ResultSet llistaAlumnos = s.executeQuery("SELECT * FROM alumno");//LListat d'opcions del select de llibres creat de forma dinàmic
			while (llistaAlumnos.next()) {
				out.println("<option value='" + llistaAlumnos.getString("IdAlumno") + "'> " + llistaAlumnos.getString("dni")
				+ "</option>");
			}
			llistaAlumnos.close();
			s.close();
			conexioalumno.close();
			%>
		</select> <select name="CURSO">
			<%
				Connection conexiocursos = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC",
					"root", "");
			Statement a = conexiocursos.createStatement();
			ResultSet llistaCursos = a.executeQuery("SELECT * FROM curso");//LListat d'opcions del select de llibres creat de forma dinàmic
			while (llistaCursos.next()) {
				out.println("<option value='" + llistaCursos.getString("IdCurso") + "'> " + llistaCursos.getString("infoCurso")
				+ "</option>");
			}
			llistaCursos.close();
			a.close();
			conexiocursos.close();
			%>
		</select>

		<button class="btn btn-success" id="botonActualizar" type="submit">Registrar</button>
	</form>
	</div>
</body>
</html>