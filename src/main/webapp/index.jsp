<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<%Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi Proyecto Web</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center mb-4">Formulario de Registro de Datos</h1>

            <form action="/Mi-app-wed/registroDatos" class="row g-3 needs-validation" method="post">
                <!-- Nombre -->
                <div class="col-md-6">
                    <label for="nombreusuario" class="form-label">Nombre Completo:</label>
                    <input type="text" name="nombreusuario" id="nombreusuario" class="form-control" value="${param.nombreusuario}" placeholder="Ingrese sus Nombres.">
                    <%
                        if (errores != null && errores.containsKey("nombre-usuario")) {
                    %>
                    <div class="text-danger small"><%= errores.get("nombre-usuario")%></div>
                    <% } %>
                </div>

                <!-- Apellidos -->
                <div class="col-md-6">
                    <label for="apellidosusuario" class="form-label">Apellidos:</label>
                    <input type="text" name="apellidosusuario" id="apellidosusuario" class="form-control" value="${param.apellidosusuario}" placeholder="Ingrese sus Apellidos.">
                    <%
                        if (errores != null && errores.containsKey("apellidos-usuario")) {
                    %>
                    <div class="text-danger small"><%= errores.get("apellidos-usuario")%></div>
                    <% } %>
                </div>

                <!-- Fecha de Nacimiento -->
                <div class="col-md-6">
                    <label for="fechanacimiento" class="form-label">Fecha de Nacimiento:</label>
                    <input type="date" name="fechanacimiento" id="fechanacimiento" class="form-control" value="${param.fechanacimiento}">
                    <%
                        if (errores != null && errores.containsKey("fecha-nacimiento")) {
                    %>
                    <div class="text-danger small"><%= errores.get("fecha-nacimiento")%></div>
                    <% } %>
                </div>

                <!-- Lugar de Nacimiento -->
                <div class="col-md-6">
                    <label for="lugarnacimiento" class="form-label">Lugar de Nacimiento:</label>
                    <select name="lugarnacimiento" id="lugarnacimiento" class="form-select">
                        <option value="">--SELECCIONAR--</option>
                        <option value="Piura"  ${param.lugarnacimiento == 'Piura' ? 'selected' : ''}>Piura</option>
                        <option value="Lima"  ${param.lugarnacimiento == 'Lima' ? 'selected' : ''}>Lima</option>
                        <option value="Arequipa"  ${param.lugarnacimiento == 'Arequipa' ? 'selected' : ''}>Arequipa</option>
                        <option value="Cuzco"  ${param.lugarnacimiento == 'Cuzco' ? 'selected' : ''}>Cuzco</option>
                        <option value="Otro"  ${param.lugarnacimiento == 'Otro' ? 'selected' : ''}>Otro</option>
                    </select>
                    <%
                        if (errores != null && errores.containsKey("lugar-nacimiento")) {
                    %>
                    <div class="text-danger small"><%= errores.get("lugar-nacimiento")%></div>
                    <% } %>
                </div>

                <!-- Género -->
                <div class="col-md-6">
                    <label class="form-label">Género:</label>
                    <div class="form-check">
                        <input type="radio" name="genero" value="M" class="form-check-input" ${param.genero == 'M' ? 'checked' : ''}>
                        <label class="form-check-label">Masculino</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="genero" value="F" class="form-check-input" ${param.genero == 'F' ? 'checked' : ''}>
                        <label class="form-check-label">Femenino</label>
                    </div>
                    <%
                        if (errores != null && errores.containsKey("genero")) {
                    %>
                    <div class="text-danger small"><%= errores.get("genero")%></div>
                    <% } %>
                </div>

                <!-- Estado Civil -->
                <div class="col-md-6">
                    <label for="estadocivil" class="form-label">Estado Civil:</label>
                    <select name="estadocivil" id="estadocivil" class="form-select">
                        <option value="">--SELECCIONAR--</option>
                        <option value="Casado" ${param.estadocivil == 'Casado' ? 'selected' : ''}>Casado</option>
                        <option value="Soltero" ${param.estadocivil == 'Soltero' ? 'selected' : ''}>Soltero</option>
                    </select>
                    <%
                        if (errores != null && errores.containsKey("estado-civil")) {
                    %>
                    <div class="text-danger small"><%= errores.get("estado-civil")%></div>
                    <% } %>
                </div>

                <!-- Nivel de estudios -->
                <div class="col-md-12">
                    <label class="form-label">Nivel de Estudios:</label>

                    <!-- Nivel Primario -->
                    <div class="form-check">
                        <input type="checkbox" name="nivelestudios" value="Nivel Primario" 
                               class="form-check-input" 
                               <%
                                   if (request.getParameterValues("nivelestudios") != null
                                           && Arrays.asList(request.getParameterValues("nivelestudios")).contains("Nivel Primario")) {
                                       out.print("checked");
                                   }
                               %>>
                        <label class="form-check-label">Nivel Primario</label>
                    </div>

                    <!-- Nivel Secundario -->
                    <div class="form-check">
                        <input type="checkbox" name="nivelestudios" value="Nivel Secundario" 
                               class="form-check-input" 
                               <%
                                   if (request.getParameterValues("nivelestudios") != null
                                           && Arrays.asList(request.getParameterValues("nivelestudios")).contains("Nivel Secundario")) {
                                       out.print("checked");
                                   }
                               %>>
                        <label class="form-check-label">Nivel Secundario</label>
                    </div>

                    <!-- Nivel Superior -->
                    <div class="form-check">
                        <input type="checkbox" name="nivelestudios" value="Nivel Superior" 
                               class="form-check-input" 
                               <%
                                   if (request.getParameterValues("nivelestudios") != null
                                           && Arrays.asList(request.getParameterValues("nivelestudios")).contains("Nivel Superior")) {
                                       out.print("checked");
                                   }
                               %>>
                        <label class="form-check-label">Nivel Superior</label>
                    </div>

                    <!-- Mensaje de error -->
                    <% if (request.getAttribute("errores") != null && ((Map<String, String>) request.getAttribute("errores")).containsKey("nivel-estudios")) {%>
                    <div class="text-danger small">
                        <%= ((Map<String, String>) request.getAttribute("errores")).get("nivel-estudios")%>
                    </div>
                    <% } %>
                </div>


                <!-- Teléfono -->
                <div class="col-md-6">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="tel" name="telefono" id="telefono" class="form-control" placeholder="Ingrese su numero de Telefono." value="${param.telefono}">
                    <%
                        if (errores != null && errores.containsKey("telefono")) {
                    %>
                    <div class="text-danger small"><%= errores.get("telefono")%></div>
                    <% } %>
                </div>

                <!-- Email -->
                <div class="col-md-6">
                    <label for="email" class="form-label">Email Personal:</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Ingrese su Email Personal." value="${param.email}">
                    <%
                        if (errores != null && errores.containsKey("email")) {
                    %>
                    <div class="text-danger small"><%= errores.get("email")%></div>
                    <% } %>
                </div>

                <!-- Dirección -->
                <div class="col-md-8 mx-auto">
                    <label for="direcciondomicilio" class="form-label">Dirección de Domicilio:</label>
                    <input type="text" name="direcciondomicilio" id="direcciondomicilio" 
                           class="form-control" placeholder="Ingrese su dirección" value="${param.direcciondomicilio}">
                    <% if (errores != null && errores.containsKey("direccion-domicilio")) {%>
                    <div class="text-danger small mt-1"><%= errores.get("direccion-domicilio")%></div>
                    <% }%>
                </div>

                <!-- Botón de Enviar -->
                <div class="col-12 text-center">
                    <input type="submit" value="Enviar" class="btn btn-primary">
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
