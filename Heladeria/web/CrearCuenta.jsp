<%-- 
    Document   : CrearCuenta
    Created on : 1/05/2021, 02:33:23 AM
    Author     : 52554
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Crear Cuenta</title>
        <link rel="icon" href= "./images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = './Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <header>
            <div class = "container logo-nav-container">
    
                <span class="menu-icon"> <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick="javascript:Inicio();"><i></i>INICIO</li>
                        <li onclick="javascript:IniciarSesion()"><i></i>INICIAR SESION</li>
                    </ul>
                </nav>
            </div>
        </header>



        <section>
            <main>

                <form action="Prueba.jsp" name="" onsubmit="return validarRegistro(this)" id="formularioRegistro" class="formulario">

                    <h4 class="formulario__titulo">REGISTRO</h4>
                    <input id="inputXD" type="text" onkeypress="return validarLetras(event)" name = "usuario" class="formulario__input" placeholder="Usuario">
                    <input id="password" type="text" onkeypress="return validarAlfaNumericos(event)" name = "contraseña" class="formulario__input" placeholder="Contraseña">
                    <input id="password2" type="text" onkeypress="return validarAlfaNumericos(event)" name = "verificarContraseña" class="formulario__input" placeholder="Verificar Contraseña">
                    <div class="botones">
                        <button id="btnShow" class="boton" onclick="mostrarContrasena()">Ocultar contraseña</button>
                    </div>
                    <br>
                    <input id="inputXD" type="text" onkeypress="return validarLetras(event)" name = "nombre" class="formulario__input" placeholder="Nombre">
                    <input id="inputXD" type="text" onkeypress="return validarLetras(event)" name = "appat" class="formulario__input" placeholder="Apellido paterno">
                    <input id="inputXD" type="text" onkeypress="return validarLetras(event)" name = "apmat" class="formulario__input" placeholder="Apellido materno">
                    <input id="inputXD" type="date" onkeypress="return validarNumeros(event)" name = "fecha_de_nacimiento" class="formulario__input" placeholder="Fecha de nacimiento(dd / mm / aaaa)">




                    <div class="ventana" id = "vent">
                        <p class="centro">Aqui van los terminos y condiciones de nuestra pagina web :3</p>
                        <div class = "botones">
                            <div class="boton2" onclick="cerrar()"><i class="fas fa-ice-cream"></i> <div class="espacio"></div>Aceptar</div>
                        </div>
                    </div>
                    <div class="botones">
                        <input type="submit" class="boton" value="Registrarse">
                    </div>
                </form>

            </main>

        </section>
        <footer>
            <h4>Integrantes:</h4>
            <p>Gervasio Flores Isaac Antonio</p>
            <p>Robledo Rangel Juan Carlos</p>
            <p>Romero Tovar Adrian</p>
        </footer>

        <script src="./scripts/script.js"></script>
        <script src="./scripts/validarFormularios.js"></script>

    </body>
</html>