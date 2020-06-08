<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- Main CSS-->
<link href="css/main.css" rel="stylesheet" media="all">
<title>Lista de alumnos matriculados</title>
</head>
<body>

<div class="container">
		<img src="images/logo.jpg" class="img-fluid" alt="Responsive image">
	</div>
	<hr>
	<div class="div4">
		<div class="container">
			<h2 style="margin: 15px;">Notas alumnos matriculados</h2>
			<nav class="navbar navbar-light bg-light justify-content-between">
				<form class="form-inline" action="Index.jsp">
					<a class="navbar-brand"><button class="btn btn-danger"
							id="botonEditar">Atrás</button></a>
					<a class="nav-link js-scroll-trigger btn" href="#notas" style="font-weight: bold;">Ver notas</a>
				</form>
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Busca un contacto" aria-label="Search">
					<button class="btn--green btn-outline-success my-2 my-sm-0"
						id="botonBuscar" type="submit">Buscar</button>
				</form>
			</nav>
			<table class="table">
				<thead>
					<tr>
						<th>Id Curso</th>
						<th>Id Alumno</th>
						<th>Info Curso</th>
						<th>Data Matrícula</th>
						<th>1º Evaluacion</th>
						<th>2º Evaluacion</th>
						<th>3º Evaluacion</th>
						<th>Final</th>
					</tr>
				</thead>
				<tbody>
					<tr>




						<%
							//Carga del driver

						Class.forName("com.mysql.jdbc.Driver");

						try {

							//Conexión con la base de datos
							

							java.sql.Connection miConexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");

							//Crear statement

							java.sql.Statement miStatement = miConexion.createStatement();
							java.sql.Statement miStatement2 = miConexion.createStatement();

							//Instruccion SQL

							ResultSet miResultSet2 = miStatement2.executeQuery("SELECT * from matricula");
							
							

							while (miResultSet2.next()) {
						%>
					
					<tr>
						<td name="curso">
						
							<%=
							miResultSet2.getInt("curso_IdCurso")
							%>
						
						</td>
						<td name="alumno">
							<%=
								miResultSet2.getInt("alumno_IdAlumno")
							%>
						</td>
						<td name="info">
							<%=
								miResultSet2.getInt("infoMat")
							%>
						</td>
						<td name="data">
							<%=
								miResultSet2.getString("dataMat")
							%>
						</td>
						<td>
							<input type=text name="1EVA" class="form-control text-center">
						</td>
						<td>
							<input type="text" name="2EVA" class="form-control text-center">
						</td>
						<td>
							<input type="text" name="3EVA" class="form-control text-center" >
						</td>
						<td>
							<input type="text" name="Final" class="form-control text-center">
						</td>

						


						<td><form action="InsertaNotas.jsp" method="post">
				<input type="hidden" name="alumno2" value="<%=miResultSet2.getInt("alumno_IdAlumno")%> ">
				<input type="hidden" name="curso2" value="<%=miResultSet2.getInt("curso_IdCurso")%> ">
				<!--  <input type="hidden" name="1EVA" class="form-control text-center">
				<input type="hidden" name="2EVA" class="form-control text-center">
				<input type="hidden" name="3EVA" class="form-control text-center" >
				<input type="hidden" name="Final" class="form-control text-center">-->
				<button class="btn btn-outline-success" id="botonInsertar" type="submit">Insertar</button>
			</form>
			
			</td></tr>
					</tr>
					<%
						}

					miResultSet2.close();
					miStatement.close();
					miStatement2.close();
					miConexion.close();

					} catch (Exception e) {

						out.println("Ha habido un error");

					}
						
						
					%>

					</tr>
				</tbody>
			</table>

		</div>
	</div>
	<div class="container">
	<section id="Notas">
		<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id Curso</th>
				<th scope="col">Id Alumno</th>
				<th scope="col">1ª Evaluación</th>
				<th scope="col">2ª Evalución</th>
				<th scope="col">3ª Evalución</th>
				<th scope="col">Final</th>
				
				
				
				<%
							//Carga del driver

						Class.forName("com.mysql.jdbc.Driver");

						try {

							//Conexión con la base de datos
							

							java.sql.Connection miConexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC", "root", "");

							//Crear statement

							java.sql.Statement miStatement = miConexion.createStatement();
							java.sql.Statement miStatement2 = miConexion.createStatement();

							//Instruccion SQL

							ResultSet miResultSet3 = miStatement2.executeQuery("SELECT * from cualificacion");
							
							

							while (miResultSet3.next()) {
						%>
					
					<tr>
						<td name="curso">
						
							<%=
							miResultSet3.getInt("curso_IdCurso")
							%>
						
						</td>
						<td name="alumno">
							<%=
								miResultSet3.getInt("alumno_IdAlumno")
							%>
						</td>
						<td>
							<%=
								miResultSet3.getString("Primera_EV")
							%>
						</td>
						<td>
							<%=
								miResultSet3.getString("Segunda_EV")
							%>
						</td>
						<td>
							<%=
								miResultSet3.getString("Tercera_EV")
							%>
						</td>
						<td>
							<%=
								miResultSet3.getString("Final")
							%>
						</td>
			</tr>
			<%
						}

					miResultSet3.close();
					miStatement.close();
					miStatement2.close();
					miConexion.close();

					} catch (Exception e) {

						out.println("Ha habido un error");

					}
						
						
					%>
		</thead>
	</section>
	</div>
</body>
</html>