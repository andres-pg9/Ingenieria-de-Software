<%-- 
    Document   : index
    Created on : 15/06/2024, 03:19:14 PM
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
<html lang="es-MX">
    <%
        String co="\"";
        String usr="id", prio="prioridad", nom="usuario";
        HttpSession sesion=request.getSession();
    %>
    <% 
        if(sesion.getAttribute(prio)=="2" || sesion.getAttribute(prio)=="1" ){
            sesion.setAttribute("id","");
            sesion.setAttribute("usuario","");
            sesion.setAttribute("prioridad","");
        }
    %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./images/logo.jpg">
    <link rel="stylesheet" href="./styles/main.css">
    <link rel="stylesheet" href="./styles/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <title>SoftIdea: Inicia sesión</title>
</head>
<body class="contenedor-principal">
  <section class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow rounded p-4" style="max-width: 400px;">
    <!-- Logo del proyecto y el titulo -->
    <div class="logo-y-titulo">
      <img src="./images/logo.jpg" alt="" class="logo">
      <h1>Iniciar sesión</h1>
    </div>

    <!-- Formulario de inicio de sesión -->
     <form method="post" action="Login" class="form-login" id="form-login">
      <div class="mb-3">
        <label for="correoUsuario" class="form-label">Correo electrónico*</label>
        <input type="text" class="entrada-form form-control" id="correoUsuario" name="correo" aria-describedby="emailHelp" placeholder="email@example.com" autofocus required>
        <span class="mensaje-error">Ingresa un correo electrónico valido.</span>
      </div>

      <div class="mb-3">
        <label for="contraseniaUsuario" class="form-label">Contraseña*</label>
        <input type="password" class="entrada-form form-control" id="contraseniaUsuario" name="contra" placeholder="Contraseña" required>
        <span class="mensaje-error">Ingresa una contraseña valida.</span>
      </div>

        <input type="submit" class="boton-enviar btn btn-primary" value="Acceder">

      
     </form>
    <div class="enlaces">
        <a href="registroDesarrollador.html">¿No tienes cuenta? Registrate</a>
        <a href="#">Olvidé mi contraseña</a>
      </div>

      <span class="mensaje-error">Correo electrónico o contraseña no validos</span>
    </div>
  </section>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>