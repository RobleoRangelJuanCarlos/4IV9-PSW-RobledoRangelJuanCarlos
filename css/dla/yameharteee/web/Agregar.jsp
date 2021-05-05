<%-- 
    Document   : Agregar
    Created on : 1/05/2021, 10:33:08 PM
    Author     : 52554
--%>
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
            Connection con;
            Statement set = null;
            ResultSet rs = null;
            String url, userName, password, driver;
            url = "jdbc:mysql://localhost/helados";
            userName = "root";
            password = "tutankamonroot";
            driver = "com.mysql.cj.jdbc.Driver";
            
            try{
                
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    
                    String helado;
                    int precio, precioMayoreo, cantidad;
                    
                    helado = request.getParameter("helado");
                    precio = Integer.parseInt(request.getParameter("precio"));
                    precioMayoreo = Integer.parseInt(request.getParameter("precioMayoreo"));
                    cantidad = Integer.parseInt(request.getParameter("cantidad"));
                    
                    set = con.createStatement();
                    
                    String q = "INSERT INTO inventario (helado, precio, precioMayoreo, cantidadGeneral)"
                        + "values"
                        + "('"+helado+"', "+precio+", "+precioMayoreo+" , "+cantidad+")";
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
    </body>
</html>