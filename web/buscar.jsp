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
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%
            
            int i = 0;
            
            Connection con=BD.iniciar();
            
            Statement st=con.createStatement();
           
            PreparedStatement stmt=con.prepareStatement("SELECT id_usuarios, Nombres, Apellido, Correo, FechaDeNac, NombreUsuario, TipoUsuario_idTipousuario FROM Usuario WHERE NombreUsuario='" + sesion.getAttribute("Buscar") + "'");
            ResultSet rs=stmt.executeQuery("SELECT id_usuarios, Nombres, Apellido, Correo, FechaDeNac, NombreUsuario, TipoUsuario_idTipousuario FROM Usuario WHERE NombreUsuario='" + sesion.getAttribute("Buscar") + "'");
                
                while(rs.next()){
                    if(rs.getString("TipoUsuario_idTipousuario")=="1"){
                        int j = 0;
                        PreparedStatement stmt2=con.prepareStatement("SELECT Antecedentes, Descripcion FROM DatosDev WHERE usuario_id_usuarios='" + rs.getString("id_usuarios") + "'");
                        ResultSet rs2=stmt2.executeQuery("SELECT Antecedentes, Descripcion FROM DatosDev WHERE usuario_id_usuarios='" + rs.getString("id_usuarios") + "'");
                
                        while(rs2.next()){
                            if(j==0){
                                out.println(
                                "<section class=\"proyectos\"> "+
                                "<form method=\"post\" action=\"EditarPerfil\" id=\"form-crear-proyecto\">" +
                                "<div class=\"fieldset-form\">" +
                                "<div class=\"img-proyecto-fecha\">" +
                                "<img src=\"./images/logo.jpg\" alt=\"\" class=\"imagen-empresa\">" +
                                "<br><div class=\"titulo-descripcion\">" +
                                "<br><p class=\"visualizar-titulo-proyecto\">@" + rs.getString("NombreUsuario") + "</p>" +
                                " <br><p class=\"visualizar-titulo-proyecto\"> Nombre: " + rs.getString("Nombres") + "</p>" +
                                " <br><p class=\"visualizar-titulo-proyecto\"> Apellido: " + rs.getString("Apellido") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\"> Correo: " + rs.getString("Correo") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\">  Fecha de Nacimiento: " + rs.getString("FechaDeNac") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\">  Antecedentes: " + rs2.getString("Antecedentes") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\">  Descripcion " + rs2.getString("Descripcion") + "</p>" +
                                "<div class=\"tecnologias-usadas-y-botones\">" +
                                "<div class=\"tecnologias-usadas\">"+
                                "</div><br>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div></form>"  +
                        "</section><br>"
                                );
                            }
                            j++;
                        }
                    }else{
                        int j = 0;
                        PreparedStatement stmt2=con.prepareStatement("SELECT Nombre, Localizacion, TipoDeEmpreza FROM DatosEmpresa WHERE usuario_id_usuarios='" + rs.getString("id_usuarios") + "'");
                        ResultSet rs2=stmt2.executeQuery("SELECT Nombre, Localizacion, TipoDeEmpreza FROM DatosEmpresa WHERE usuario_id_usuarios='" + rs.getString("id_usuarios") + "'");
                        while(rs2.next()){
                            if(j==0){
                                out.println(
                                "<section class=\"proyectos\"> "+
                                "<form method=\"post\" action=\"EditarPerfil\" id=\"form-crear-proyecto\">" +
                                "<div class=\"fieldset-form\">" +
                                "<div class=\"img-proyecto-fecha\">" +
                                "<img src=\"./images/logo.jpg\" alt=\"\" class=\"imagen-empresa\">" +
                                "<br><div class=\"titulo-descripcion\">" +
                                "<br><p class=\"visualizar-titulo-proyecto\">@" + rs.getString("NombreUsuario") + "</p>" +
                                " <br><p class=\"visualizar-titulo-proyecto\">  Empresa: " + rs2.getString("Nombre") + "</p>" +
                                " <br><p class=\"visualizar-titulo-proyecto\"> Nombre del encargado de la cuenta: " + rs.getString("Nombres") + "</p>" +
                                " <br><p class=\"visualizar-titulo-proyecto\"> Apellido: " + rs.getString("Apellido") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\"> Correo: " + rs.getString("Correo") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\">  Fecha de Nacimiento: " + rs.getString("FechaDeNac") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\">  Localizacion: " + rs2.getString("Localizacion") + "</p>" +
                                " <br><p class=\"visualizar-descripcion-proyecto\">  Tipo de empresa: " + rs2.getString("TipoDeEmpreza") + "</p>" +
                                "<div class=\"tecnologias-usadas-y-botones\">" +
                                "<div class=\"tecnologias-usadas\">"+
                                "</div><br>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div></form>" +
                        "</section><br>"
                                );
                            }
                            j++;
                        }
                    }
                    i++;
                }
           
                
                //Proyectos
                
            i=0;
            stmt=con.prepareStatement("SELECT idProyectos, Proyectos.Nombre, Descripcion, Tecnologias, Progreso, Perfil, NoColab, Usuario_id_usuarios, Etiquetas_idEtiquetas FROM Proyectos NATURAL JOIN Usuario WHERE Usuario.NombreUsuario='" + sesion.getAttribute("Buscar") + "' or Proyectos.Nombre='" + sesion.getAttribute("Buscar") +"'");
            rs=stmt.executeQuery("SELECT idProyectos, Proyectos.Nombre, Descripcion, Tecnologias, Progreso, Perfil, NoColab, Usuario_id_usuarios, Etiquetas_idEtiquetas FROM Proyectos NATURAL JOIN Usuario WHERE Usuario.NombreUsuario='" + sesion.getAttribute("Buscar") + "' or Proyectos.Nombre='" + sesion.getAttribute("Buscar") +"'");
            
            
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
                        "<form method=\"post\" action=\"Colaborar\" id=\"form-crear-proyecto\">" +
                        "<div class=\"fieldset-form\">" +
                        "<div class=\"img-proyecto-fecha\">" +
                        "<img src=\"./images/logo.jpg\" alt=\"\" class=\"imagen-empresa\">" +
                        "<br><div class=\"titulo-descripcion\">" +
                        "<br><p class=\"visualizar-titulo-proyecto\">Nombre: " + rs.getString("Nombre") + "</p>" +
                        " <br><p class=\"visualizar-titulo-proyecto\"> Empresa: " + empresa + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Etiquetas: " + etiqueta + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\">  Descripcion: " + rs.getString("Descripcion") + "</p>" +
                        "<div class=\"tecnologias-usadas-y-botones\">" +
                        "<div class=\"tecnologias-usadas\">"+
                        " <br><p class=\"tecnologia\"></p> Tecnologias: " + rs.getString("Tecnologias") + "</p>" +
                        " </div><br><p class=\"visualizar-descripcion-proyecto\"> Progreso: " + rs.getString("Progreso") + "%</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Perfil buscado: " + rs.getString("Perfil") + "</p>" +
                        " <br><p class=\"visualizar-descripcion-proyecto\"> Numero de colaboradores: " + rs.getString("NoColab") + "</p>" +
                        "</div><br>" +
                        "</div>" +
                        "</div>" +
                        "</div><br>" 
                        );
                        if(sesion.getAttribute(prio)=="1"){
                            out.println(
                                "<select id=\"generoUsuario\" class=\"entrada-formulario-registro form-control\" name=\"colab\">" +
                                "<option value=\""+ idp +"\">"+ idp +"</option>" +
                                "</select>" +
                                "<input type=\"submit\" class=\"btn-publicar\" value=\"Colaborar\">" +
                                "</form>" +
                        "</section><br>"
                            );
                        }else{
                            out.println(
                                "</form>" +
                        "</section><br>"
                            );
                        }

                        
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

              
            

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>