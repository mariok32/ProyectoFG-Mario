<!DOCTYPE html>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>
<html lang="en">
<head>
    

      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple Responsive Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


   
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/jquery.circliful.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                                        document.getElementById("login_valido").value="ok";
                                }
                        }
                }
        }

        window.onload = function() {
                //document.getElementById("comprobar").onclick =comprobar;
        }
        </script>
        <%
        HttpSession datossesion=request.getSession();
        String nombre_usuarios=(String)datossesion.getAttribute("nombre");
        String nombre=(String)datossesion.getAttribute("nombre");
        String apellidos=(String)datossesion.getAttribute("apellidos");
        
        
       


        if (nombre==null) {
    %>
        <script language="JavaScript">
           location.href="../../index.jsp?error=4"
        </script> 
    <%
        }
    %>

        <%
        File file = new File("G:");
    	long totalSpace = file.getTotalSpace(); //total disk space in bytes.
    	long usableSpace = file.getUsableSpace(); ///unallocated / free disk space in bytes.
    	long freeSpace = file.getFreeSpace(); //unallocated / free disk space in bytes.
        long resulset= ((freeSpace/1024/1024/1024/2)*100)/(totalSpace /1024 /1024 /1024 /2);//PORCENTAJE DE DISCO USADO 
    	//out.println("Total size : " + totalSpace /1024 /1024 /1024 /2+ " GB");
    	//out.println("Space free : " + freeSpace /1024 /1024 /1024 + " GB");
    	//out.println(resulset+"%");
        %>
    
</head>
<body>
     <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="assets/img/ico.jpg" width="70px" height="70px"/>

                    </a>
                    
                </div>
              
                <span class="logout-spn" >
                  <a href="./cerrar.jsp" style="color:#fff;">LOGOUT</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 


                    <li class="active-link">
                        <a href="./#" ><i class="fa fa-desktop "></i>Dashboard <span class="badge"></span></a>
                    </li>
                   

                    
                    <li>
                        <a  href="./subirv2.jsp?sort=1&dir=G%3A%5CCloudSpace%5C<%out.print(nombre);%>"><i class="fa fa-upload"></i>Subir ficheros <span class="badge"></span></a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-edit "></i>Espacio disponible <span class="badge"><%out.println("" + freeSpace /1024 /1024 /1024 /2 + " GB");%></span></a>
                    </li>


                    
                    
                </ul>
                            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>ADMIN DASHBOARD</h2>   
                    </div>
                </div>
                
                <hr>  
                <h2>Estadisticas</h2>
         
        
    <div class="row">
        
        <div class="col-lg-2">
            <div id="test-circle5"></div>
        </div>
    </div>

                <%out.println("Espacio total : " + totalSpace /1024 /1024 /1024 /2+ " GB");%>
                <br>
                <%out.println("Espaciob libre : " + freeSpace /1024 /1024 /1024 /2+ " GB");%>
                <br>
                <%
    final long RAM_TOTAL = Runtime.getRuntime().totalMemory();
    final long RAM_FREE = Runtime.getRuntime().freeMemory();
    final long RAM_USED = RAM_TOTAL - RAM_FREE;
    final long RAM_TOTAL_MB = RAM_TOTAL / 8 / 1024;
    final long RAM_FREE_MB = RAM_FREE / 8 / 1024;
    final long RAM_USED_MB = RAM_USED / 8 / 1024;
    final long RAM_USED_PERCENTAGE = (RAM_USED * 100 )/RAM_TOTAL;
    final int  CELL_NUMBER = Runtime.getRuntime().availableProcessors();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/jquery.circliful.js"></script>
  <div class="row">
        
        <div class="col-lg-2">
            <div id="test-circle6"></div>
        </div>
    </div>
<script>
    $( document ).ready(function() { // 6,32 5,38 2,34
        $("#test-circle").circliful({
            animation: 1,
            animationStep: 5,
            foregroundBorderWidth: 15,
            backgroundBorderWidth: 15,
            percent: 38,
            textSize: 28,
            textStyle: 'font-size: 12px;',
            textColor: '#666',
            multiPercentage: 1,
            percentages: [10, 20, 30]
        });

        $("#test-circle2").circliful({
            animation: 0,
            animationStep: 6,
            foregroundBorderWidth: 5,
            backgroundColor: "none",
            fillColor: '#eee',
            percent: 50,
            iconColor: '#3498DB',
            icon: 'f206',
            iconSize: '40',
            iconPosition: 'middle'
        });

        $("#test-circle3").circliful({
            animation: 1,
            animationStep: 6,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 1,
            percent: 88,
            iconColor: '#3498DB',
            icon: 'f004',
            iconSize: '40',
            iconPosition: 'middle'
        });

        $("#test-circle6").circliful({
            animationStep: 6,
            foregroundBorderWidth: 20,
            backgroundBorderWidth:30,         
            percent: <%out.print(RAM_USED_PERCENTAGE);%>,            
            icon: 'f2db',
            iconPosition: 'middle',
            text: 'Porcentaje uso ram',            
            textBelow: true
        });

        $("#test-circle5").circliful({
            animationStep: 6,
            foregroundBorderWidth: 20,
            backgroundBorderWidth:30,         
            percent: <%out.print(resulset);%>,            
            icon: 'f0a0',
            iconPosition: 'middle',
            text: 'Espacio restante',            
            textBelow: true
        });
    });

</script>
 
                <%out.println("TOTAL RAM(FÍSICA + PAGINADO):"+RAM_TOTAL/1024/1024/10+"GB");%>
                <br>
                <%out.println("RAM LIBRE : " +RAM_FREE/ 1024/1024/10+"GB");%>
                <br>
                 <%out.println("Numero de Hilos del procesador : " +CELL_NUMBER);%>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  CloudSpace | Design by: <a href="http://binarytheme.com" style="color:#red;" target="_blank">www.binarytheme.com</a>
                </div>
            </div>
        </div>
          
</body>
</html>
