<%-- 
    Document   : Prueba
    Created on : 1/05/2021, 03:45:08 AM
    Author     : 52554
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Espere...</title>
        <META HTTP-EQUIV="REFRESH" CONTENT="1;URL=./MenuHeladeria.jsp"> 
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
                    
                    String nombre, appat, apmat, usuario, fecha, domicilio, contrasenaBD;
                    String edad, telefonoPrivado, celular;
                    
                    nombre = request.getParameter("nombre");
                    appat = request.getParameter("appat");
                    apmat = request.getParameter("apmat");
                    usuario = request.getParameter("usuario");
                    edad = request.getParameter("edad");
                    fecha = request.getParameter("fecha_de_nacimiento");
                    telefonoPrivado = request.getParameter("telefono_Particular");
                    celular = request.getParameter("telefono_Celular");
                    domicilio = request.getParameter("domicilio");
                    contrasenaBD = request.getParameter("contraseña");
                    
                    set = con.createStatement();
                    
                    String q = "INSERT INTO registro (nom_usu, appat_usu, appmat_usu, usu, edad_usu, fecha, telp_usu, telc_usu, domicilio, cont_usu)"
                        + "values"
                        + "('"+nombre+"', '"+appat+"', '"+apmat+"', '"+usuario+"', '"+edad+"', '"+fecha+"', '"+telefonoPrivado+"', '"+celular+"', '"+domicilio+"', '"+contrasenaBD+"')";
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