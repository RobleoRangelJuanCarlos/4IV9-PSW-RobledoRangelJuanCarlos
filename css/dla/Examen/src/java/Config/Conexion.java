
package Config;

import java.sql.*;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    public Conexion(){
        try{
        Class.forName("com.mysql.jbdc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","juanito123");
    }catch (Exception e) {
        System.out.println("Error"+e);
        }
    }
    
    public Connection getConnection(){
        return con;
    }

}

