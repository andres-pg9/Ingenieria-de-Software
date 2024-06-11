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
public class RegistrarE extends HttpServlet {

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
                
                String Nombre = "";
                String Apellido = "";
                String Correo = "";
                String FechaDeNac = "";
                String NombreUsuario = "";
                String Contrasena = "";
                String CContrasena = "";
                String NombreE = "";
                String Localizacion = "";
                String TipoDeEmpresa = "";
                String Verificacion = "";
                
boolean flag = true;
                if(request.getParameter("Nombre") != null){
			Nombre = request.getParameter("Nombre");
		}
                if(request.getParameter("Apellido") != null){
			Apellido = request.getParameter("Apellido");
		}
                if(request.getParameter("Correo") != null){
			Correo = request.getParameter("Correo");
		}
                if(request.getParameter("FechaDeNac") != null){
			FechaDeNac = request.getParameter("FechaDeNac");
		}
                if(request.getParameter("NombreUsuario") != null){
			NombreUsuario = request.getParameter("NombreUsuario");
		}
                if(request.getParameter("Contrasena") != null){
			Contrasena = request.getParameter("Contrasena");
		}
                if(request.getParameter("CContrasena") != null){
			CContrasena = request.getParameter("CContrasena");
		}
                if(request.getParameter("NombreE") != null){
			NombreE = request.getParameter("NombreE");
		}
                if(request.getParameter("Localizacion") != null){
			Localizacion = request.getParameter("Localizacion");
		}
                if(request.getParameter("TipoDeEmpresa") != null){
			TipoDeEmpresa = request.getParameter("TipoDeEmpresa");
		}
                if(request.getParameter("Verificacion") != null){
			Verificacion = request.getParameter("Verificacion");
		}
                
		//revisar que sean validos
		if(Nombre == "" || Nombre.length()>60 || contieneNum(Nombre)){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(Apellido == "" || Apellido.length()>60 || contieneNum(Nombre)){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(Correo == "" || Correo.length()>60){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(FechaDeNac == ""){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(NombreUsuario == "" || NombreUsuario.length()>60){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(Contrasena == "" || Contrasena.length()>60){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(CContrasena == "" || CContrasena.length()>60){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(NombreE == "" || NombreE.length()>60){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                if(Localizacion == "" || Localizacion.length()>60){
                request.setAttribute("a1", "<font color='white'>(Ingresa un paciente o formato valido)</font>");
                flag = false;
                System.out.println("False nomp");
                }
                
                if(TipoDeEmpresa == "" || TipoDeEmpresa.length()>60){
                request.setAttribute("a3", "<font color='white'>(Ingresa un consultorio)</font>");
                flag=false;
                System.out.println("False sex");
                }
                
                if(!Contrasena.equals(CContrasena)){
                request.setAttribute("a1", "<font color='white'>(Ingresa un nombre valido)</font>");
                flag=false;
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
                    PreparedStatement stmt=con.prepareStatement("SELECT id_Usuarios FROM Usuario WHERE NombreUsuario='" + NombreUsuario + "' or correo='" +  Correo + "'");
                    ResultSet rs=stmt.executeQuery("SELECT id_Usuarios FROM Usuario WHERE NombreUsuario='" + NombreUsuario + "' or correo='" +  Correo + "'");
                    while(rs.next()){
                    idp = rs.getString("id_Usuarios");
                    prov1++;
                    }
                System.out.println("Iniciando incercion");
                    System.out.println("Buscando pacientes registrados");
                        if(prov1==0 || idp.equals("")){
                            request.setAttribute("a1", "<font color='white'>(Ingresa un correo no registrado)</font>");
                            flag=false;
                        }
                        if(flag=true){
                        
                        System.out.println("Iniciando incercion");
                        
                        st.executeUpdate("INSERT INTO Usuario(Nombres, Apellido, Correo, FechaDeNac, NombreUsuario, Contrasena, TipoUsuario_idTipoUsuario) VALUES ('" + Nombre +"', '" + Apellido +"', '" + Correo +"', '" + FechaDeNac +"', '" + NombreUsuario +"', '" + Contrasena +"', '2')");
                        stmt=con.prepareStatement("SELECT id_Usuarios FROM Usuario WHERE correo='" +  Correo + "'");
                        rs=stmt.executeQuery("SELECT id_Usuarios FROM Usuario WHERE correo='" +  Correo + "'");
                        while(rs.next()){
                        idp = rs.getString("id_Usuarios");
                        prov1++;
                        }
                        st2.executeUpdate("INSERT INTO DatosEmpresa(Nombre, Localizacion, TipoDeEmpreza, Verificacion, Usuario_id_usuarios) VALUES ('" + NombreE +"', '" + Localizacion +"', '" + TipoDeEmpresa +"', '" + Verificacion +"', '" + idp +"')");
                        
                        HttpSession sesion=request.getSession();
                        
                        sesion.setAttribute("id",idp);
                        sesion.setAttribute("usuario",NombreUsuario);
                        sesion.setAttribute("prioridad","2");
                        
                        }else{
                            RequestDispatcher rd = request.getRequestDispatcher("registrar.jsp"); 
                            rd.forward(request,response);
                        }

            response.sendRedirect("index.jsp");
            st.close();
            con.close();

            }
            else{
            RequestDispatcher rd = request.getRequestDispatcher("registrar.jsp"); 
             rd.forward(request,response);
            }
            
            }catch (SQLException ex) {
			Logger.getLogger(RegistrarE.class.getName()).log(Level.SEVERE, null, ex);
		} catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarE.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(RegistrarE.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(RegistrarE.class.getName()).log(Level.SEVERE, null, ex);
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
