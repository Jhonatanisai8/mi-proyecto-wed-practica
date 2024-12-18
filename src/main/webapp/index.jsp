<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

            <form action="action" class="row g-3" method="post" >
                <!-- Nombre -->
                <div class="col-md-6">
                    <label for="nombreusuario" class="form-label">Nombre Completo:</label>
                    <input type="text" name="nombreusuario" id="nombreusuario" class="form-control">
                </div>

                <!-- Apellidos -->
                <div class="col-md-6">
                    <label for="apellidosusuario" class="form-label">Apellidos:</label>
                    <input type="text" name="apellidosusuario" id="apellidosusuario" class="form-control">
                </div>

                <!-- Fecha de Nacimiento -->
                <div class="col-md-6">
                    <label for="fechanacimiento" class="form-label">Fecha de Nacimiento:</label>
                    <input type="date" name="fechanacimiento" id="fechanacimiento" class="form-control">
                </div>

                <!-- Lugar de Nacimiento -->
                <div class="col-md-6">
                    <label for="lugar-nacimiento" class="form-label">Lugar de Nacimiento:</label>
                    <select name="lugar-nacimiento" id="lugar-nacimiento" class="form-select">
                        <option value="">--SELECCIONAR--</option>
                        <option value="Piura">Piura</option>
                        <option value="Lima">Lima</option>
                        <option value="Arequipa">Arequipa</option>
                        <option value="Cuzco">Cuzco</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>

                <!-- Género -->
                <div class="col-md-6">
                    <label class="form-label">Género:</label>
                    <div class="form-check">
                        <input type="radio"  name="genero" value="M" class="form-check-input">
                        <label class="form-check-label">Masculino</label>
                    </div>
                    <div class="form-check">
                        <input type="radio"  name="genero" value="F" class="form-check-input">
                        <label  class="form-check-label">Femenino</label>
                    </div>
                </div>

                <!-- Estado Civil -->
                <div class="col-md-6">
                    <label for="estado-civil" class="form-label">Estado Civil:</label>
                    <select name="estado-civil" id="estado-civil" class="form-select">
                        <option value="">--SELECCIONAR--</option>
                        <option value="Casado">Casado</option>
                        <option value="Soltero">Soltero</option>
                    </select>
                </div>

                <!-- Teléfono -->
                <div class="col-md-6">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="tel" name="telefono" id="telefono" class="form-control">
                </div>

                <!-- Email -->
                <div class="col-md-6">
                    <label for="email" class="form-label">Email Personal:</label>
                    <input type="email" name="email" id="email" class="form-control">
                </div>

                <!-- Dirección de Domicilio -->
                <div class="col-12">
                    <label for="direccion-domicilio" class="form-label">Dirección de Domicilio:</label>
                    <input type="text" name="direccion-domicilio" id="direccion-domicilio" class="form-control">
                </div>

                <!-- Botón de Enviar -->
                <div class="col-12 text-center">
                    <input type="submit" value = "Enviar" class="btn btn-primary">
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>