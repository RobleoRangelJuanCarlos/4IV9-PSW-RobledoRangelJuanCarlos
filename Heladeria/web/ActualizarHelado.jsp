<%-- 
    Document   : ActualizarHelado
    Created on : 1/05/2021, 05:38:26 PM
    Author     : 52554
--%>

<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Iniciar Sesión</title>
        <link rel="icon" href= "./images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = './Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <header>
            <div class = "container logo-nav-container">
    
                <span class="menu-icon"> <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick="javascript:Inicio();"><i></i>INICIO</li>
                        <li onclick="javascript:IniciarSesion()"><i class=></i>CERRAR SESION</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                <div align="center">

                    <form action="Editar.jsp">
                        <table border="0" style="background: rgba(28,146,128,0.3); border: 2px solid rgb(255, 255, 255); border-radius: 0px; padding: 16px; font-size: 30px; box-shadow: 0 0 20px 1px rgba(0,0,0,0.7);">

                            <tbody>

                                <%
                                    Connection con = null;
                                    Statement set = null;
                                    ResultSet rs = null;
                                    String url, userName, password, driver;
                                    url = "jdbc:mysql://localhost/helados";
                                    userName = "root";
                                    password = "juanito123";
                                    driver = "com.mysql.cj.jdbc.Driver";
                                    try {
                                        Class.forName(driver);
                                        con = DriverManager.getConnection(url, userName, password);
                                        try {
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            String q = "SELECT idH, helado, precio, precioMayoreo, cantidadGeneral from inventario where idH=" + id;
                                            set = con.createStatement();
                                            rs = set.executeQuery(q);
                                            while (rs.next()) {
                                %>

                                <tr>
                                <td>ID: </td>
                                <td><input type="hidden" readonly name="id2" value="<%=rs.getInt("idH")%>" ></td>
                            </tr>
                            <tr>
                                <td>Helado: </td>
                                <td><input type="text" name="heladoE" value="<%=rs.getString("helado")%>" onkeypress="return validarLetras(event)" > </td>
                            </tr>
                            <tr>
                                <td>Precio: </td>
                                <td><input type="text" name="precioE" value="<%=rs.getInt("precio")%>" onkeypress="return validarNumeros(event)"> </td>
                            </tr>
                            <tr>
                                <td>Precio Mayoreo: </td>
                                <td><input type="text" name="precioME" value="<%=rs.getInt("precioMayoreo")%>" onkeypress="return validarNumeros(event)"> </td>
                            </tr>
                            <tr>
                                <td>Cantidad disponible: </td>
                                <td><input type="text" name="cantidadE" value="<%=rs.getInt("cantidadGeneral")%>" onkeypress="return validarNumeros(event)"> </td>
                            </tr>
                            <tr>
                        <input type="submit" class="boton" value="Actualizar datos">
                        </tr>

                            <%
                                        }
                                        rs.close();
                                        set.close();
                                    } catch (SQLException ed) {
                                        System.out.println("Error al consultar los datos");
                                        System.out.println(ed.getMessage());
                                    }
                                    con.close();
                                } catch (Exception e) {
                                    System.out.println("Error al conectar con la bd");
                                    System.out.println(e.getMessage());
                                    System.out.println(e.getStackTrace());
                                }
                            %>

                            </tbody>

                </table>
            </form>            
        </div>    
    </main>
</section>

<footer>
    <h4>Integrantes:</h4>
    <p>Gervasio Flores Isaac Antonio</p>
    <p>Robledo Rangel Juan Carlos</p>
    <p>Romero Tovar Adrian</p>
</footer>

<script src="./scripts/script.js"></script>
<script src="./scripts/validarFormularios.js"></script>

</body>
</html>