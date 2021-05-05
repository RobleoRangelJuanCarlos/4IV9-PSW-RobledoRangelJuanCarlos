package Controlador;

import java.sql.*;

public class Conexion {

    private String username = "root";
    private String password = "tutankamonroot";
    private String url = "jdbc:mysql://localhost/helados";
    private String driver = "com.mysql.cj.jdbc.Driver";
    private Connection con;

    public Conexion() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR" + e);
        } catch (SQLException e) {
            System.err.println("Error" + e);
        }
    }

    public Connection getConexion() {
        return con;
    }

}
