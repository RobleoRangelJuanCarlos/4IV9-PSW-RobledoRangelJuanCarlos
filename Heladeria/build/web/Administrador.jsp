<%-- 
    Document   : Administrador
    Created on : 1/05/2021, 02:13:18 PM
    Author     : 52554
--%>

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
                        <li onclick="javascript:IniciarSesion()"><i class="fas fa-user"></i>CERRAR SESION</a></li>
                    </ul>
                </nav>
            </div>
        </header>



        <section>
            <main>

                <div class="texto">

                    <table border="0" style="background: rgba(28,146,128,0.3); border: 1px solid black; border-radius: 0px; padding: 5px; font-size: 13px; box-shadow: 0 0 20px 1px rgba(0,0,0,0.7);">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Helado</th>
                                <th>Precio</th>
                                <th>Precio Mayoreo</th>
                                <th>Cantidad Disponible (Litros)</th>
                                <th>Actualizar Datos</th>
                                <th>Borrar</th>
                            </tr>
                        </thead>
                        
                        <tbody>


                        <tbody>

                            <%
                                Connection con;
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
                                        String q = "select * from inventario order by helado";
                                        set = con.createStatement();
                                        rs = set.executeQuery(q);
                                        while (rs.next()) {
                            %>

                            <tr>
                                <td><%= rs.getInt("idH")%></td>
                                <td><%= rs.getString("helado")%></td>
                                <td><%= rs.getInt("precio")%></td>
                                <td><%= rs.getInt("precioMayoreo")%></td>
                                <td><%= rs.getInt("cantidadGeneral")%></td>

                                <td style="padding: 32px;"> 
                                    <a class="boton" href="ActualizarHelado.jsp?id=<%=rs.getInt("idH")%>">Editar</a>
                                </td>
                                <td style="padding: 32px;">
                                    <a class="boton" href="Borrar.jsp?id=<%=rs.getInt("idH")%>"> Borrar </a>
                                </td>
                            </tr>

                            <%
                                        }
                                        rs.close();
                                        set.close();
                                    } catch (SQLException ed) {
                                        System.out.println("Error al consultar la tabla");
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
                        <body>
                            <tr>
                                <td>1</td>
                                <td>Chocolate</td>
                                <td>25</td>
                                <td>25</td>
                                <td>1</td>

                                <td style="padding: 32px;"> 
                                    <a class="boton" href="ActualizarHelado.jsp?id=<%=rs.getInt("idH")%>">Editar</a>
                                </td>
                                <td style="padding: 32px;">
                                    <a class="boton" href="Borrar.jsp?id=<%=rs.getInt("idH")%>"> Borrar </a>
                                </td>
                            </tr>  
                        </body>

                    </table>

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