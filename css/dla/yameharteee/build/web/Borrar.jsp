<%-- 
    Document   : Borrar
    Created on : 1/05/2021, 05:41:27 PM
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
            try {
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String q = "delete from inventario where idH=" + id;
                    set = con.createStatement();
                    int borrar = set.executeUpdate(q);
                    set.close();
                } catch (SQLException ed) {
                    System.out.println("Error al eliminar el dato");
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