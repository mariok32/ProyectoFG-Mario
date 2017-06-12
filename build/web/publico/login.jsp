<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>

<!DOCTYPE HTML>
<!--
	Hyperspace by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>CloudSpace</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="./assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	 <script language="javascript" type="text/javascript">  
            function Valida(formulario)
            { 
               if (formulario.login_valido.value == 'ok') 
               {
                  return true;
               } 
               else
               {
                  alert("Debes validar el código ó código no válido")
                  return false;
               }  
            }       
       </script>

       <script type="text/javascript">
        var READY_STATE_COMPLETE=4;
        var peticion_http = null;

        function inicializa_xhr() {
                if (window.XMLHttpRequest) {
                        return new XMLHttpRequest(); 
                } else if (window.ActiveXObject) {
                        return new ActiveXObject("Microsoft.XMLHTTP"); 
                } 
        }

        function comprobar() {
                var login = document.getElementById("login").value;
                peticion_http = inicializa_xhr();
                if(peticion_http) {
                        peticion_http.onreadystatechange = procesaRespuesta;
                        peticion_http.open("POST", "check_login.jsp", true);

                        peticion_http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        peticion_http.send("login="+login);
                       
                }
        }

        function procesaRespuesta() {
                if(peticion_http.readyState == READY_STATE_COMPLETE) {
                        if (peticion_http.status == 200) {
                                var login = document.getElementById("login").value;
                                var respuesta= peticion_http.responseText;
                                alert(respuesta);
                                
                                /*
                                out.println("si");
                                
                                devuleve 6 caracteres _ s i _ _ _
                                
                                */
                                
                                var estado_respuesta=respuesta.substring(1,3);

                                /*substring(inicio, final), extrae una porción de una cadena de texto. 
                                El segundo parámetro es opcional. Si solo se indica el parámetro inicio, 
                                la función devuelve la parte de la cadena original correspondiente desde esa posición hasta el final:*/
                                
                                /*Si se indica el inicio y el final, se devuelve la parte de la cadena original 
                                comprendida entre la posición inicial y la inmediatamente anterior a la posición final 
                                (es decir, la posición inicio está incluida y la posición final no):*/

                                if(estado_respuesta=="si") {
                                        document.getElementById("disponibilidad").innerHTML = "El nombre elegido ["+login+"] está disponible";
                                        document.getElementById("login_valido").value="ok";
                                }
                                else {
                                        document.getElementById("disponibilidad").innerHTML = "NO está disponible el nombre elegido ["+login+"]";
                                        document.getElementById("login_valido").value="no_ok";
                                }
                        }
                }
        }

        window.onload = function() {
                document.getElementById("comprobar").onclick = comprobar;
        }
        </script>
         

        </head>
	<body>
        <div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
        <div class="login-form">
            <form action="./comprobar.jsp" >
            <div class="sign-in-htm">
                
                <div class="group">
                    <label for="user" class="label">Nombre de usuario o correo</label>
                    <input name="login" type="text" class="input" value="">
                    
                </div>
                <div class="group">
                    <label for="pass" class="label">Contraseña</label>
                   <input name="pass" type="password" class="input" value="">
                </div>
                <div class="group">
                    
                    <input name="rec" id="check" type="checkbox" class="check" checked>
                    <label for="check"><span class="icon"></span> Mantenme conectado</label>
                </div>
                <div class="group">
                    <input type="submit" value="Registro" class="button" name="aceptar" />
                </div>
                <div class="hr"></div>
                
            </div>
            </form>
            <form action="insert_registro.jsp" >
            <div class="sign-up-htm">
                <div class="group">
                    <label for="user" class="label">Nombre de usuario</label>
                    <input name="login "id="user" type="text" class="input" required>
                </div>
                <div class="group">
                    <label for="pass" class="label">Contraseña</label>
                    <input  name="pass" id="pass" type="password" class="input" data-type="password" required>
                </div>
                <div class="group">
                    <label for="pass" class="label">Repite contraseña</label>
                    <input  id="pass" type="password" class="input" data-type="password" required>
                </div>
                <div class="group">
                    <label for="pass" class="label">Dirección de correo</label>
                    <input name="correo" id="pass" type="text" class="input" required>
                </div>
                <div class="group">
                    <input type="submit" value="Registro" name="aceptar" class="button"/>
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <label for="tab-1">¿Ya eres mienbro? Inicia sesión</a>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>


        </body>
</html>