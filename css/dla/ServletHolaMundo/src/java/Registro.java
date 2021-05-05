/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;


public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request                                           Atender las peticiones del cliente
     * @param response servlet response                                         Atender las respuestas por parte del servidor
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    //variables globales
    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    //constructor
    public void init(ServletConfig cfg) throws ServletException{
        
        //como se va a conectar a la base de datos
        String url = "jdbc:mysql:8084//localhost/registro4iv9";
                     //tipodriver:gestorbd:puerto//IP/nombrebd
                     
                     
        String userName = "root";
        String password = "juanito123";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            //para solucionar error de conexion, poner:
            //url = "jdbc:mysql://localhost/registro4iv9";
            //(quitando el puerto)
            
            con = DriverManager.getConnection(url, userName, password);
            set = con.createStatement();
            
            System.out.println("Conexion exitosa");
                    
        }catch(Exception e){
          
            System.out.println("Conexion no exitosa");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
    }
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String nom, appat, apmat, correo, ip, ipr;
            int edad, puerto, puertor;
            
            
            nom = request.getParameter("nombre");
            appat = request.getParameter("appat");
            apmat = request.getParameter("apmat");
            edad = Integer.parseInt(request.getParameter("edad"));
            correo = request.getParameter("correo");
            
            ip = request.getLocalAddr();
            puerto = request.getLocalPort();
            
            ipr = request.getRemoteAddr();
            puertor = request.getRemotePort();
            
            //registrar en la base de datos :3
            
            
            try{
                
                //"" cadena
                //'' numerico
                //   numerico
                
                String q = "insert into mregistro"
                        + "(nom_usu, appat_usu, apmat_usu, edad_usu, email_usu) "
                        + "values "
                        + "('"+nom+"','"+appat+"','"+apmat+"', "+edad+", '"+correo+"')";
                
                set.executeUpdate(q);
                System.out.println("Registro exitoso de la tabla");
                
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");            
            out.println("</head>");
            out.println("<body>"
                    + "<h1>Registro exitoso</h1>"
                    + "<br>"
                    + "Tu nombre es: "+nom
                    + "<br>"
                    + "Tu apellido paterno es: "+appat
                    + "<br>"
                    + "Tu apellido materno es: "+apmat
                    + "<br>"
                    + "Tu edad es: "+edad
                    + "<br>"
                    + "Tu correo es: "+correo
                    + "<br>"
                    + "IP Local: "+ip
                    + "<br>"
                    + "Puerto Local: "+puerto
                    + "<br>"
                    + "IP Remota: "+ipr
                    + "<br>"
                    + "Puerto Remoto: "+puertor
                    + "<br>");
            out.println("<h1>Bv</h1>"
                    + "<a href='index.html'>Regresar al Menu Principal</a>");
            out.println("</body>");
            out.println("</html>");
            
            }catch(Exception e){
                System.out.println("Error al registrar en la tabla");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                
                
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");            
            out.println("</head>");
            out.println("<body>"
                    + "<br>");
            out.println("<h1>Registro NO exitoso, ocurrio un error UnU</h1>"
                    + "<a href='index.html'>Regresar al Menu Principal</a>");
            out.println("</body>");
            out.println("</html>");
                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
