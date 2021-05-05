<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Proceso de compra...</title>
        <link rel="icon" href= "images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="scripts/js/scripts.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>

    </head>
    <body>

        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Compra</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick = "javascript:Catalogo()"><i class="fas fa-ice-cream"></i> Seguir Comprando</li>
                        <li onclick= "javascript:Carrito()"><i class="fas fa-shopping-cart"></i> Ver Carrito</li>
                        <li onclick="javascript:Inicio()"><i class="fas fa-user"></i>Cerrar sesion</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <%
            Connection con;
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
                    int id;
                    id = Integer.parseInt(request.getParameter("id"));
                    String q = "select idH, helado, precio, precioMayoreo, cantidadGeneral from inventario where idH=" + id;
                    set = con.createStatement();
                    rs = set.executeQuery(q);
                    if (rs.next()) {
        %>

        <section>
            <main>
                <form action="ValidarCompra.jsp" name="formularioCompra" onsubmit="return validarCompra(this)" class="formulario">
                    <p class="formulario__titulo">¡Que buena Elección!</p>
                    
                    <input type="number" class="formulario__input" name="precio2" readonly value="<%= rs.getInt("precio")%>">
                    <input type="number" class="formulario__input" name="maximo" readonly value="<%= rs.getInt("cantidadGeneral")%>">
                    <input type="text" class="formulario__input" name="heladoNombre" readonly value="<%= rs.getString("helado")%>">
                    <input type="number" value="1" max="<%= rs.getInt("cantidadGeneral")%>" name = "cantidad2" class="formulario__input" onkeypress="return validarNumeros(event)" min="1" placeholder="Inserte Cantidad en Litros">
                    
                    <input type="submit" class="boton" name = "AceptarCompra" value="Aceptar">
                </form>
            </main>
        </section>
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


        <footer>
            <h4>Integrantes</h4>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Castañeda Rodríguez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos González <div class="espacio"></div>Gian Carlo</div>
        </footer>



        <script src="./scripts/script.js"></script>
        <script src="./scripts/validarFormularios.js"></script>

    </body>
</html>