package com.jhonatan.miappwed.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
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
        String nombres = request.getParameter("nombre-usuario");
        String apellidos = request.getParameter("apellidos-usuario");
        Date fechaNacimiento = new Date(request.getDateHeader("fecha-nacimiento"));
        String lugarNacimiento = request.getParameter("lugar-nacimiento");
        String genero = request.getParameter("genero");
        String edadCivil = request.getParameter("estado-civil");
        String nivelEstudios[] = request.getParameterValues("nivel-estudios");
        Integer numeroTelefono = Integer.parseInt(request.getParameter("telefono"));
        String email = request.getParameter("email");
        String direccionDomicilio = request.getParameter("direccion-domicilio");
        //creamos un mapa para agregar los errores
        Map<String, String> errores = new HashMap<>();
        //validacioens 
        if (nombres == null || nombres.isBlank()) {
            errores.put("nombre-usuario", "Los nombres son obligatorios.");
        }
        if (nombres == null || nombres.isBlank()) {
            errores.put("apellidos-usuario", "Los Apellidos son obligatorios.");
        }
        if (fechaNacimiento == null || fechaNacimiento.after(new Date())) {
            errores.put("fecha-nacimiento", "La fecha de nacimiento es obligatoria y debe ser antes a la fecha de hoy.");
        }
        if (genero == null || genero.isBlank()) {
            errores.put("genero", "El genero es requerido.");
        }
        if (edadCivil == null || edadCivil.isBlank()) {
            errores.put("estado-civil", "El estado civil es requerido.");
        }
        if (nivelEstudios == null || nivelEstudios.length == 0) {
            errores.put("nivel-estudios", "El email es requerido.");
        }
        if (numeroTelefono == null || numeroTelefono <= 999999999 || numeroTelefono <= 0) {
            errores.put("telefono", "El Telefono es requerido.");

        }
        if (email == null || !email.contains("@")) {
            errores.put("nivel-estudios", "El email es requerido.");
        }
        if (direccionDomicilio == null || direccionDomicilio.isBlank()) {
            errores.put("nivel-estudios", "La direccion es requerida.");
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
