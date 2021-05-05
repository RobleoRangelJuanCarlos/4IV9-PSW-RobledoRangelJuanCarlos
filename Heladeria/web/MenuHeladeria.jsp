<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                        <li onclick = "javascript:Carrito()"><i></i>CARRITO</li>
                        <li onclick="javascript:Inicio()"><i></i>CERRAR SESION</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    <articule>
                <div class="producto" align="left">
                                    
                    <image src = "images/heladozzz.jpg" class="helados"></image>
                    <div class="precios">
                        <form name="formularioCompra" onsubmit="return validarCompra(this)">
                            <p class="izquierda">Helado: Fresa</p>
                            <p class="izquierda">Precio: 25 </p>
                            <p class="izquierda">Mayoreo: 22 </p>
                            <p class="em7"></p>
                            <a href="FormularioCompra.jsp?id=" name="heladoComprar" class="boton">Comprar</a>
                        </form>
                    </div>
                </div>
                <div class="producto" align="center">
                                    
                    <image src = "images/heladozzz.jpg" class="helados"></image>
                    <div class="precios">
                        <form name="formularioCompra" onsubmit="return validarCompra(this)">
                            <p class="izquierda">Helado: Vainilla</p>
                            <p class="izquierda">Precio: 25 </p>
                            <p class="izquierda">Mayoreo: 22 </p>
                            <p class="em7"></p>
                            <a href="FormularioCompra.jsp?id=" name="heladoComprar" class="boton">Comprar</a>
                        </form>
                    </div>
                </div>
                <div class="producto" align="right">
                                    
                    <image src = "images/heladozzz.jpg" class="helados"></image>
                    <div class="precios">
                        <form name="formularioCompra" onsubmit="return validarCompra(this)">
                            <p class="izquierda">Helado: Chocolate</p>
                            <p class="izquierda">Precio: 25 </p>
                            <p class="izquierda">Mayoreo: 22 </p>
                            <p class="em7"></p>
                            <a href="FormularioCompra.jsp?id=" name="heladoComprar" class="boton">Comprar</a>
                        </form>
                    </div>
                </div>
    </articule>

        <section>
            <main>



                <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    String url, userName, password, driver;
                    url = "jdbc:mysql://localhost/helados";
                    userName = "root";
                    password = "tutankamonroot";
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

                <div class="producto">
                                    
                    <image src = "images/heladozzz.jpg" class="helados"></image>
                    <div class="precios">
                        <form name="formularioCompra" onsubmit="return validarCompra(this)">
                            <p class="izquierda">Helado: <%= rs.getString("helado")%></p>
                            <p class="izquierda">Precio: $<%= rs.getInt("precio")%> </p>
                            <p class="izquierda">Mayoreo: $<%= rs.getInt("precioMayoreo")%> </p>
                            <p class="em7"></p>
                            <a href="FormularioCompra.jsp?id=<%= rs.getInt("idH")%>" name="heladoComprar" class="boton">Comprar</a>
                        </form>
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