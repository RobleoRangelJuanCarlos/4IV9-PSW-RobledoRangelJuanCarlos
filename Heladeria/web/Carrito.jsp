
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Carrito</title>
        <link rel="icon" href= "images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="scripts/script.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
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
                <div class="texto">

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
                                String q = "select * from carrito order by heladoCompro";
                                set = con.createStatement();
                                rs = set.executeQuery(q);
                                while (rs.next()) {
                    %>

                    <div class="producto">
                        <image src = "images/unicornio.png" class="helados"></image>
                        <div class="precios">
                            <p class="izquierda">Helado: <%= rs.getString("heladoCompro")%></p>
                            <p class="izquierda"> Litros $<%= rs.getInt("litros")%> </p>
                            <p class="izquierda">Monto: $<%= rs.getInt("monto")%> </p>
                        </div>
                    </div>

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

                </div>
            </main>
        </section>
        <footer>
            <h4>Integrantes:</h4>
            <p>Gervasio Flores Isaac Antonio</p>
            <p>Robledo Rangel Juan Carlos</p>
            <p>Romero Tovar Adrian</p>
        </footer>
    </body>
</html>
