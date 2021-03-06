<%@ page 
	contentType="text/html"
	pageEncoding="utf-8" 
	language="java"
	import="java.util.Vector,java.sql.*" 
%>
<html>
<head>
<title>Piloto de SDI</title>
</head>
<body>
<h1>Notaneitor!</h1>
<br>
<h2>Aplicación de gestión de alumnos</h2>
<br>
<br>
Listado de alumnos:
<br>
<table>
	<tr>
		<td><b>Nombre</b></td>
		<td><b>Apellidos</b></td>
		<td><b>Identificador de usuario</b></td>
		<td><b>EMail</b></td>
	</tr>

	<%
	/* 
	 * Aquí iría la lógica de negocio pero este ejemplo es tan sencillo
	 * que no tiene nada, es una simple consulta a la BDD
	 */
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			String SQL_DRV = "org.hsqldb.jdbcDriver";
			String SQL_URL = "jdbc:hsqldb:hsql://localhost/localDB";
			Class.forName(SQL_DRV);
			con = DriverManager.getConnection(SQL_URL, "sa", "");
			ps = con.prepareStatement("select * from alumno");
			rs = ps.executeQuery();

			while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("NOMBRE")%></td>
		<td><%=rs.getString("APELLIDOS")%></td>
		<td><%=rs.getString("IDUSER")%></td>
		<td><%=rs.getString("EMAIL")%></td>
	</tr>

	<%
			} // del while
				
		} catch (Exception e) {
			e.printStackTrace();
			throw (e);
		} finally {
			try {
				ps.close();
				con.close();
			} catch (Exception e) {
			}
		} // del try
	%>
</table>
<br>
<br>
</body>
</html>