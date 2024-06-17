<%-- 
    Document   : inicioDesarrollador
    Created on : 14/06/2024, 10:01:10 PM
    Author     : bruni
--%>
<%@page import="Servlets.BD"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%
        String co="\"";
        String usr="id", prio="prioridad", nom="usuario";
        HttpSession sesion=request.getSession();
    %>
    <% 
        if(sesion.getAttribute(prio)==""){
            response.sendRedirect("index.jsp");
        }
    %>

<html lang="es-MX">
<head>
    <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./images/logo.jpg">
    <link rel="stylesheet" href="./styles/main.css">
    <link rel="stylesheet" href="./styles/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
    <title>Inicio</title>
</head>

<body class="contenedor-principal">
    <!--Barra de Navegación-->
    <nav class="navbar navbar-dark bg-dark fixed-top">
        <div class="container-fluid d-flex justify-content-between">
            <!--Logo-->
            <div class="d-flex align-items-center">
                <img src="./images/logo.jpg" alt="" class="logo">
            </div>
            
            <!--Cuadro de búsqueda-->
            <form class="d-flex w-50 justify-content-center" role="search" id="form-buscar">
                <div class="input-group w-75">
                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                    <input class="form-control" type="search" placeholder="Buscar empresa o proyecto" aria-label="Search" aria-describedby="basic-addon1">
                </div>
                <button class="btn btn-secondary" type="submit">Buscar</button>
            </form>

            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!--Menú Desplegable de opciones-->
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Menú</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="inicioDesarrollador.jsp"> <i class="bi bi-house-door-fill"></i> Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="perfil.jsp"><i class="bi bi-person-circle"></i> Mi Perfil</a>
                        </li>
                        <% 
                            if(sesion.getAttribute(prio)=="1"){
                                out.println(
                                        "<li class=\"nav-item\">" +
                                            "<a class=\"nav-link\" href=\"Colaboracion.jsp\"><i class=\"bi bi-pencil-square\"></i> Colaboraciones</a>" +
                                        "</li>"
                                );
                            }
                        %>
                        <% 
                            if(sesion.getAttribute(prio)=="2"){
                                out.println(
                                        "<li class=\"nav-item\">" +
                                            "<a class=\"nav-link\" href=\"Proyectos.jsp\"><i class=\"bi bi-pencil-square\"></i> Proyectos</a>" +
                                        "</li>" +
                                        "<li class=\"nav-item\">" +
                                            "<a class=\"nav-link\" href=\"Solicitudes.jsp\"><i class=\"bi bi-file-earmark-medical\"></i> Solicitudes de colaboración</a>" +
                                        "</li>"
                                );
                            }
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="mensajes.jsp"><i class="bi bi-chat-dots"></i> Mensajes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp"><i class="bi bi-box-arrow-right"></i> Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <section class="inicio-empresas">
    <section class="proyectos">
        <form method="post" action="AltaProyecto" id="form-crear-proyecto">
          <div class="fieldset-form">
            <div class="titulo-botones">
              <input type="text" class="entrada-texto-principal" placeholder="Agregar un titulo" id="tituloProyecto"
                     name="Nombre" required maxlength="45" minlength="1" autofocus
                     pattern="^(?=.{1,45}$)[a-zA-ZáéíóúÁÉÍÓÚñÑ.0-9]+(?:\s[a-zA-ZáéíóúÁÉÍÓÚ.0-9]+)*$">
              
              <div class="botones-nuevo-proyecto">
                <span id="botonTexto">
                  <img src="./images/texto.png" alt="" class="icono-boton">
                </span>
                <span id="botonArchivo">
                  <img src="./images/clip.png" alt="" class="icono-boton">
                </span>
                <span id="botonImagen">
                  <img src="./images/imagen.png" alt="" class="icono-boton">
                </span>
                <span id="botonEnlace">
                  <img src="./images/enlace.png" alt="" class="icono-boton">
                </span>
              </div>
            </div>
            
            <textarea id="descripcionProyecto" name="Descripcion" placeholder="Agregar una descripción:"
                      class="descripcion-proyecto" required minlength="1" maxlength="45"></textarea>

            <div class="tecnologias-ubicacion">
              <div class="contenedor-seleccionadores">
                <label for="tecnologiasUsar">Tecnologias a utilizar:</label>
                <textarea id="tecnologiasUsar" name="Tecnologias" placeholder="Agregar las tecnologias a usar"
                      class="descripcion-proyecto" required minlength="1" maxlength="45"></textarea>
              </div>

              <div class="contenedor-seleccionadores">
                <label for="tecnologiasUsar">Perfil del colaborador:</label>
                <textarea id="tecnologiasUsar" name="Perfil" placeholder="Agregar el perfil de desarrollador a buscar"
                      class="descripcion-proyecto" required minlength="1" maxlength="45"></textarea>
              </div>
            </div>

            <div class="contenedor-seleccionadores">
              <label for="selectorColaboradores">Etiqueta del proyecto:</label>
              <select id="selectorColaboradores" name="Etiquetas" class="entrada-selector selector-colaboradores">
            
              
              <%
              int i = 0;
            
                Connection con=BD.iniciar();
                PreparedStatement stmt=con.prepareStatement("SELECT idEtiquetas, Nombre FROM Etiquetas");
                ResultSet rs=stmt.executeQuery("SELECT idEtiquetas, Nombre FROM Etiquetas");

                while(rs.next()){
                
                    out.println(
                            "<option value=\"" + rs.getString("idEtiquetas") + "\">" + rs.getString("Nombre") + "</option>"
                    );
                
                }
              %>
              </select>
              <div class="contenedor-seleccionadores">
                <label for="tecnologiasUsar">Progreso:</label>
                <textarea id="tecnologiasUsar" name="Progreso" placeholder="Agregar el perfil de desarrollador a buscar"
                      class="descripcion-proyecto" required minlength="1" maxlength="45"></textarea>
              </div>
            </div>
            <div class="contenedor-seleccionadores">
              <label for="selectorColaboradores">Número de colaboradores:</label>
              <select id="selectorColaboradores" name="NoColab" class="entrada-selector selector-colaboradores">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3" selected>3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
              </select>

              <input type="submit" value="Publicar proyecto" class="btn-publicar">
            </div>
          </div>
        </form>
      </section>
<%
            
            
            
            Statement st=con.createStatement();
           
           
             stmt=con.prepareStatement("SELECT idProyectos, Nombre, Descripcion, Tecnologias, Progreso, Perfil, NoColab, Usuario_id_usuarios, Etiquetas_idEtiquetas FROM Proyectos WHERE Usuario_id_usuarios='" + sesion.getAttribute(prio) + "'");
             rs=stmt.executeQuery("SELECT idProyectos, Nombre, Descripcion, Tecnologias, Progreso, Perfil, NoColab, Usuario_id_usuarios, Etiquetas_idEtiquetas FROM Proyectos WHERE Usuario_id_usuarios='" + sesion.getAttribute(prio) + "'");
            
            while(rs.next()){
            String etiqueta="", empresa="";
            String ie = rs.getString("Etiquetas_idEtiquetas");
            String iu = rs.getString("Usuario_id_usuarios");
            String idp = rs.getString("idProyectos");
            PreparedStatement stmt2=con.prepareStatement("SELECT Nombre FROM Etiquetas WHERE idEtiquetas='" + ie + "'" );
            ResultSet rs2=stmt2.executeQuery("SELECT Nombre FROM Etiquetas WHERE idEtiquetas='" + ie + "'" );
            
            while(rs2.next()){
                etiqueta = rs2.getString("Nombre");
            }
            
            PreparedStatement stmt3=con.prepareStatement("SELECT Nombre FROM DatosEmpresa WHERE usuario_id_usuarios='" + iu + "'");
            ResultSet rs3=stmt3.executeQuery("SELECT Nombre FROM DatosEmpresa WHERE usuario_id_usuarios='" + iu + "'");
            
            while(rs3.next()){
                empresa = rs3.getString("Nombre");
            }
     
                
                out.println(
                        "<section class=\"proyectos\"> "+
                        "<form method=\"post\" action=\"EliminarProyecto\" id=\"form-crear-proyecto\">" +
                        "<div class=\"fieldset-form\">" +
                        "<div class=\"img-proyecto-fecha\">" +
                        "<img src=\"./images/logo.jpg\" alt=\"\" class=\"imagen-empresa\">" +
                        "<br><div class=\"titulo-descripcion\">" +
                        "<br><p class=\"visualizar-titulo-proyecto\">   Nombre:   " + rs.getString("Nombre") + "</p>" +
                        " <br><p class=\"visualizar-titulo-proyecto\"> Empresa:    " + empresa + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Etiquetas:    " + etiqueta + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\">  Descripcion:    " + rs.getString("Descripcion") + "</p>" +
                        "<div class=\"tecnologias-usadas-y-botones\">" +
                        "<div class=\"tecnologias-usadas\">"+
                        " <br><p class=\"tecnologia\"></p> Tecnologias:    " + rs.getString("Tecnologias") + "</p>" +
                        " </div><br><p class=\"visualizar-descripcion-proyecto\"> Progreso: " + rs.getString("Progreso") + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Perfil buscado:    " + rs.getString("Perfil") + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Numero de colaboradores:   " + rs.getString("NoColab") + "</p>" +
                        "<select id=\"generoUsuario\" class=\"entrada-formulario-registro form-control\" name=\"colab\">" +
                        "<option value=\""+ idp +"\">"+ idp +"</option>" +
                        "</select>" +
                        "<input type=\"submit\" class=\"btn-publicar\" value=\"Eliminar proyecto\">" +
                        "</div><br>" +
                        "</div>" +
                        "</div>" 
                        );
                        

                        
                i++;
            }                      
           if(i==0){
           out.println("<section class=\"proyectos\"> "
                   + "<form action=\"\" method=\"\" id=\"form-crear-proyecto\"> "
                   + "<div class=\"fieldset-form\"> "
                   + "<img src=\"./images/logo.jpg\" alt=\"\" class=\"imagen-empresa\"> "
                   + "<br><div class=\"titulo-descripcion\">"
                   + "<br><p class=\"visualizar-titulo-proyecto\">  No hay proyectos disponibles  </p>" 
                   + "</div>" +
                    "</div>" +
                    "</div>" +
                    "</form>" +
                    "</section>" 
                   );
           }
            
         
           
            con.close();
            st.close();
       %>

              
    </section>  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>