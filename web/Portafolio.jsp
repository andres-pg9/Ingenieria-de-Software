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
            <form method="post" action="Buscar" class="d-flex w-50 justify-content-center" role="search" id="form-buscar">
                <div class="input-group w-75">
                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                    <input name="buscar" class="form-control" type="search" placeholder="Buscar empresa o proyecto" aria-label="Search" aria-describedby="basic-addon1">
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
        <form method="post" action="AltaArch" id="form-crear-proyecto">
          <div class="fieldset-form">
            <div class="titulo-botones">
              <input type="text" class="entrada-texto-principal" placeholder="Agregar nombre del cambio" id="tituloProyecto"
                     name="Cambio" required maxlength="45" minlength="1" autofocus
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
            </div>
            <div class="contexto-y-entrada mb-3">
                <label for="documentoValidacionEmpresa" class="form-label"><i class="bi bi-file-pdf"></i> Archivo*</label>
                <input type="file" class="entrada-formulario-registro form-control" id="archivoValidarEmpresa" name="Archivo" required>
                <span class="mensaje-error">Proporciona un archivo valido</span>
              </div>
            <div class="contenedor-seleccionadores">

              <input type="submit" value="Subir cambio" class="btn-publicar">
            </div>
          </div>
        </form>
      </section>
<%
            
            int i = 0;
            
            Connection con=BD.iniciar();
            
            Statement st=con.createStatement();
           
           
            PreparedStatement stmt=con.prepareStatement("SELECT Nombre, Archivos, Fecha FROM Portafolio WHERE Colaboracion_idColaboracion='" + sesion.getAttribute("Portafolio") + "'");
            ResultSet rs=stmt.executeQuery("SELECT Nombre, Archivos, Fecha FROM Portafolio WHERE Colaboracion_idColaboracion='" + sesion.getAttribute("Portafolio") + "'");

            
            
            
            while(rs.next()){
     
                
                out.println(
                        "<form method=\"post\" action=\"EliminarColab\" id=\"form-crear-proyecto\">" +
                        "<div class=\"fieldset-form\">" +
                        "<div class=\"img-proyecto-fecha\">" +
                        "<img src=\"./images/logo.jpg\" alt=\"\" class=\"imagen-empresa\">" +
                        "<br><div class=\"titulo-descripcion\">" +
                        "<br><p class=\"visualizar-titulo-proyecto\">  Cambio:   " + rs.getString("Nombre") + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Archivo:    " + rs.getString("Archivos") + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Fecha de publicacion:    " + rs.getString("Fecha") + "</p>" +
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
                   + "<br><p class=\"visualizar-titulo-proyecto\">  No hay archivos  </p>" 
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

              
            

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>