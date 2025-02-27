package com.jhonatan.miappwed.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registroDatos")
public class RegistroServlet
        extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //parametros 
        String nombres = request.getParameter("nombreusuario");
        String apellidos = request.getParameter("apellidosusuario");
        Date fechaNacimiento = new Date(request.getDateHeader("fechanacimiento"));
        String lugarNacimiento = request.getParameter("lugarnacimiento");
        String genero = request.getParameter("genero");
        String edadCivil = request.getParameter("estadocivil");
        List<String> nivelEstudios = (List<String>) (request.getParameterValues("nivelestudios") != null
                ? Arrays.asList(request.getParameterValues("nivelestudios"))
                : new ArrayList<>());
        Integer numeroTelefono = null;
        String email = request.getParameter("email");
        String direccionDomicilio = request.getParameter("direcciondomicilio");
        //creamos un mapa para agregar los errores
        Map<String, String> errores = new HashMap<>();
        //validacioens 
        if (nombres == null || nombres.isBlank()) {
            errores.put("nombre-usuario", "Los nombres son obligatorios.");
        }
        if (apellidos == null || apellidos.isBlank()) {
            errores.put("apellidos-usuario", "Los Apellidos son obligatorios.");
        }
        if (fechaNacimiento == null || fechaNacimiento.after(new Date())) {
            errores.put("fecha-nacimiento", "La fecha de nacimiento es obligatoria y debe ser antes a la fecha de hoy.");
        }
        if (lugarNacimiento == null || lugarNacimiento.isBlank()) {
            errores.put("lugar-nacimiento", "El lugar de nacimiento es requerido.");
        }
        if (genero == null || genero.isBlank()) {
            errores.put("genero", "El genero es requerido.");
        }
        if (edadCivil == null || edadCivil.isBlank()) {
            errores.put("estado-civil", "El estado civil es requerido.");
        }
        if (nivelEstudios == null || nivelEstudios.size() == 0) {
            errores.put("nivel-estudios", "Los niveles de estudio son requeridos.");
        }
        boolean convertirNumeroExcepcion = false;
        try {
            numeroTelefono = Integer.valueOf(request.getParameter("telefono"));
        } catch (Exception e) {
            convertirNumeroExcepcion = true;
        }
        if (convertirNumeroExcepcion == true || numeroTelefono == null || String.valueOf(numeroTelefono).length() != 9 || numeroTelefono <= 0) {
            errores.put("telefono", "El Telefono es requerido. y debe ser de 9 digitos");
        }
        if (email == null || !email.contains("@")) {
            errores.put("email", "El email es requerido.");
        }
        if (direccionDomicilio == null || direccionDomicilio.isBlank()) {
            errores.put("direccion-domicilio", "La direccion es requerida.");
        }

        if (errores.isEmpty()) {
            try ( PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("       <title>Resultado del formulario.</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("   <h1>Resultado del formulario.</h1>");
                out.println("   <ul>");

                out.println("       <li> Nombre: " + nombres + "</li>");
                out.println("       <li> Apellidos: " + apellidos + "</li>");
                out.println("       <li> Fecha Nacimiento:   " + fechaNacimiento + "</li>");
                out.println("       <li> Lugar de Nacimiento:   " + lugarNacimiento + "</li>");
                out.println("       <li> Género:   " + genero + "</li>");
                out.println("       <li> Edad Civil:   " + edadCivil + "</li>");
                out.print("         <li>Nivel de Estudios: <ul>");

                for (String nivelEstudio : nivelEstudios) {
                    out.println("       <li> Lenguaje:   " + nivelEstudio + "</li>");
                }
                out.print("         </ul></li>");

                out.println("       <li> Numero Telefono: " + numeroTelefono + "</li>");
                out.println("       <li> Email:   " + email + "</li>");
                out.println("       <li> Dirección:   " + direccionDomicilio + "</li>");
                out.println("   </ul>");
                out.println("</body>");
                out.println("</html>");
            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
            }
        } else {
            request.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}
