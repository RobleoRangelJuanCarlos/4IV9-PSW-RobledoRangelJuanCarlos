<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Espere...</title>
        <META HTTP-EQUIV="REFRESH" CONTENT="1;URL=./Administrador.jsp"> 
    </head>
    <body>
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
                    int id = Integer.parseInt(request.getParameter("id2"));
                    String helado;
                    int precio, precioMayoreo, cantidad;
                    
                    helado = request.getParameter("heladoE");
                    precio = Integer.parseInt(request.getParameter("precioE"));
                    precioMayoreo = Integer.parseInt(request.getParameter("precioME"));
                    cantidad = Integer.parseInt(request.getParameter("cantidadE"));
                    String q = "update inventario set helado = '" + helado + "', "
                            + "precio = " + precio + ", precioMayoreo = " + precioMayoreo + " , cantidadGeneral = " + cantidad + " "
                            + "where idH = " + id ;
                    set = con.createStatement();
                    int actualizar = set.executeUpdate(q);
                    set.close();
                } catch (SQLException ed) {
                    System.out.println("Error al actualizar el dato");
                    System.out.println(ed.getMessage());
                }
                con.close();
            } catch (Exception e) {
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
        %>
    </body>
</html>