
package Config;

import java.sql.*;

public class Conexion {
    Connection con;
    public Conexion(){
        try{
        Class.forName("com.mysql.jbdc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","juanito123");
    }catch (Exception e) {
        System.out.println("Error");
        }
    }

}
