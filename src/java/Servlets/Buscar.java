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
@WebServlet(name = "Registrar", urlPatterns = {"/Registrar"})
public class Buscar extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
            Statement st, st2;
            
            System.out.println("Peticion en espera...");

            try{
                
                String buscar = "";
                
                
boolean flag = true;
                if(request.getParameter("buscar") != null){
			buscar = request.getParameter("buscar");
		}
                
                System.out.println(flag);
                

            if(flag==true){
                System.out.println("Peticion garantizada!");
                String idp = "";
                int prov1 = 0;
                Connection con=BD.iniciar(); 
                System.out.println("Iniciando peticion...");
                    st=con.createStatement();
                    st2=con.createStatement();
                System.out.println("Obteniendo datos...");
                System.out.println("Step 1");
                HttpSession sesion=request.getSession();
                    
                System.out.println("Iniciando incercion");
                    System.out.println("Buscando proyectos o cuentas");
                        
                        sesion.setAttribute("Buscar",buscar);

            response.sendRedirect("buscar.jsp");
            st.close();
            con.close();

            }
            else{
            RequestDispatcher rd = request.getRequestDispatcher("inicioDesarrollador.jsp"); 
             rd.forward(request,response);
            }
            
            }catch (SQLException ex) {
			Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
		} catch (ClassNotFoundException ex) {
            Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
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
