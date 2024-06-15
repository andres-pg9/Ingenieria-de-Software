/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bruni
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
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
        
        Statement st;
            
            System.out.println("Peticion en espera...");

            try {  

                String correo = "";
                String contra = "";

boolean flag = true;
                if(request.getParameter("correo") != null){
			correo = request.getParameter("correo");
		}
                if(request.getParameter("contra") != null){
			contra = request.getParameter("contra");
		}
		
		
		//revisar que sean validos
		if(correo == "" && correo.length()>60){
                request.setAttribute("a1", "<font color='white'>(correo o contraseña incorrecta)</font>");
                flag = false;
                }
                if(contra == "" && contra.length()>60){
                request.setAttribute("a2", "<font color='white'>(correo o contraseña incorrecta)</font>");
                flag=false;
                }
                
                System.out.println(correo + " " + contra);
              
            if(flag==true){
                System.out.println("Peticion garantizada!");
                String idu = "", nom = "", prio = "";
                int prov1 = 0;
                //Iniciando conexion a BD
                Connection con=BD.iniciar();
                System.out.println("Iniciando peticion...");
                //Statement
                st=con.createStatement();
                System.out.println("Obteniendo datos...");
                System.out.println("Step 1");
                PreparedStatement stmt=con.prepareStatement("SELECT id_usuarios, NombreUsuario, TipoUsuario_idTipoUsuario,  correo FROM Usuario WHERE correo='" + correo + "' and contrasena='" + contra + "'");
                ResultSet rs=stmt.executeQuery("SELECT id_usuarios, NombreUsuario, TipoUsuario_idTipoUsuario,  correo FROM Usuario WHERE correo='" + correo + "' and contrasena='" + contra + "'");
                while(rs.next()){
                    idu = rs.getString("id_usuarios");
                    nom = rs.getString("NombreUsuario");
                    prio = rs.getString("TipoUsuario_idTipoUsuario");
                    prov1++;
                    System.out.println(idu + " " + nom + " " + prio);
                }
                System.out.println("Step 2");
                System.out.println("Preparando inicio");
                System.out.println("Buscando usuarios registrados " + prov1);
                if(prov1==0 || idu.equals("") || nom.equals("") || prio.equals("")){
                    request.setAttribute("a1", "<font color='white'>(Ingresa un correo valido)</font>");
                    flag=false;
                }
                if(flag == true){
                    
                    System.out.println("Iniciando sesion");
                    
                    HttpSession sesion=request.getSession();
                    
                    
                    sesion.setAttribute("id",idu);
                    sesion.setAttribute("usuario",nom);
                    if(prio.equals("1")){
                        sesion.setAttribute("prioridad","1");
                    }else if(prio.equals("2")){
                        sesion.setAttribute("prioridad","2");
                    }
                    
                    System.out.println(sesion.getAttribute("id") + " " + sesion.getAttribute("prioridad") );
                    
                    
                    
                }else{
                    RequestDispatcher rd = request.getRequestDispatcher("registroDesarrollador.html");
                    rd.forward(request,response);
                }
                System.out.println("listo");
                
                response.sendRedirect("inicioDesarrollador.jsp");
                
                rs.close();
                st.close();
                con.close();
            

            
            
            }
            else{
            RequestDispatcher rd = request.getRequestDispatcher("registroDesarrollador.html"); 
             rd.forward(request,response);
            }
            }
            catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    public boolean validarNom(String nom){
		String reg = "[A-Za-záéíóúÁÉÍÓÚñÑ ]*";
		if(!contieneNum(nom) && nom.length() < 40 && nom.length() > 3 && nom.matches(reg)){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean contieneNum(String num){
		for(int i = 0; i < num.length(); i++){
			char c = num.charAt(i);
			if(Character.isDigit(c)){
				return true;
			}
		}
		return false;
	}
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
