<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Su compra fue...</title>
        <link rel="icon" href= "images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="scripts/scripts.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Espere...</title>
        <META HTTP-EQUIV="REFRESH" CONTENT="1;URL=./MenuHeladeria.jsp"> 
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
        <br>
        <br>
        <br>

        <%
            Connection con;
            Statement set = null;
            ResultSet rs = null;
            String url, userName, password, driver;
            url = "jdbc:mysql://localhost/helados";
            userName = "root";
            password = "juanito123";
            driver = "com.mysql.cj.jdbc.Driver";
            
            try{
                
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    
                    String helado;
                    String nombre = "AdminIceMaster2529";
                    int precio, precioMayoreo, litros, monto;
                    
                    helado = request.getParameter("heladoNombre");
                    precio = Integer.parseInt(request.getParameter("precio2"));
                    litros = Integer.parseInt(request.getParameter("cantidad2"));
                    
                    set = con.createStatement();
                    
                    monto = litros * precio;
                    
                    String q = "INSERT INTO carrito (nombreUsu, litros, heladoCompro, monto)"
                        + "values"
                        + "('"+nombre+"', "+ litros +", '"+ helado +"' , "+monto+")";
                    //"+ litros +", '"+ helado +"' , "+precio+"
                    set.executeUpdate(q);
                        
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                }
                con.close();
                
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
        %>
 
        <br>
        <br>
        <br>
        <footer>
            <h4>Integrantes:</h4>
            <p>Gervasio Flores Isaac Antonio</p>
            <p>Robledo Rangel Juan Carlos</p>
            <p>Romero Tovar Adrian</p>
        </footer>



        <script src="./scripts/scripts.js"></script>
        <script src="./scripts/validarFormularios.js"></script>
        
    </body>
</html>