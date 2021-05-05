package Controlador;

import java.sql.*;

public class Consultas extends Conexion {

    public boolean autenticacion(String usuario, String contrasena) {

        PreparedStatement pst = null;
        ResultSet rs = null;

        try {

            String q = "SELECT * FROM registro where usu = ? and cont_usu = ?";
            pst = getConexion().prepareStatement(q);
            pst.setString(1, usuario);
            pst.setString(2, contrasena);
            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("error" + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.err.println("error" + e);
            }
        }

        return false;
    }

}
