<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>


	

    
    <!-- Force latest IE rendering engine or ChromeFrame if installed -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->   

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
</head>
   
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
<%@page session="true"%>
</head>
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

    	//out.println("Total size : " + totalSpace /1024 /1024 /1024 + " GB");
    	//out.println("Space free : " + usableSpace /1024 /1024 /1024 + " GB");
    	//out.println("Space free : " + freeSpace /1024 /1024 /1024 + " GB");
        %>
    
    
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
                        <a href="./util.jsp"><i class="fa fa-edit "></i>Espacio disponible <span class="badge"><%out.println("" + freeSpace /1024 /1024 /1024 /2 + " GB");%></span></a>
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
                
                 <!-- /. ROW  -->
                  <hr />
                  <%
               String option;
               String line=null;
               option = request.getParameter("option");
               
             ////AREA DE ADMINISTRACIÓN////
               if (option==null || option=="null" )
               {
                %>

                   <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>Bienvenido <%out.print(nombre_usuarios);%> ! </strong>
                        </div>
                       
                    </div>
                    </div>
                  <!-- /. ROW  --> 
                            <div class="row text-center pad-top">
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=1" >
 <i class="fa fa-circle-o-notch fa-spin fa-5x fa-fw margin-bottom "></i>
                      <h4>Visor de cuotas</h4>
                      </a>
                      </div>
                     
                     
                  </div> 
                 
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=2" >
 <i class="fa fa-envelope-o fa-5x"></i>
                      <h4>Mailing</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=3" >
 <i class="fa fa-lightbulb-o fa-5x"></i>
                      <h4>FAQ</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=5" >
 <i class="fa fa-key fa-5x"></i>
                      <h4>Administración </h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
              </div>
                 <!-- /. ROW  --> 
                <div class="row text-center pad-top">
                 
                 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./Browser.jsp?sort=1&dir=G%3A%5CCloudSpace" >
 <i class="fa fa-clipboard fa-5x"></i>
                      <h4>Explorador</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=8" >
 <i class="fa fa-cog fa-spin fa-5x fa-fw margin-bottom "></i>
                      <h4>Ajustes</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
                 
    <form hidden class="formular2" id="formular2" action="/ProyectoFG/registrado/admin/Browser.jsp" method="POST">
		<input type="hidden" name="dir" value="G:\CloudSpace">
		<input type="hidden" name="sort" value="1">
		<input type="hidden" name="command" value="">
		<input title="Launch command in current directory" type="Submit" class="button" id="but_Lau" name="Submit" value="Ejecutar copias de seguridad">
	</form>                
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <href="javascript:{}" onclick="document.getElementById('formular2').submit();">
 <i class="fa fa-rocket fa-5x" style="color:grey !important"></i>
                      <h4>Empezar copias</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                     
              </div>   
                  <!-- /. ROW  -->    
                 <div class="row text-center pad-top">
                   
                 
 <%} 

 ////VISOR DE CUOTAS////
               if (option!=null && option.compareTo("1")==0)
               {%><H2>Visor de cuotas<H2/>
                   <div class="row">
        <div class="col-lg-6 col-md-6">
          
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                
                <th>Id Usuario</th>
                
                
                
                
                <th>Cuota</th>              
                <th>Espacio usado</th> 
                <th>Porcentaje</th>
                <th>Restante</th>
                          
              </tr>
            </thead>
            <tbody>
                <%
      
                                       
        String urljdbc2;       
        String loginjdbc2;
        String passjdbc2;
        String archivos;
        Integer conta =1;
        Integer contab=5;
        Long restante;
        Connection conexion2=null;
        Statement sentencia2=null;
        ResultSet sentencia_sql2=null;
        //************************************//
        try
        {
            /* Class.forName("oracle.jdbc.driver.OracleDriver");*/
            Class.forName("com.mysql.jdbc.Driver");
            urljdbc2 = getServletContext().getInitParameter("urljdbc"); 
            /*jdbc:mysql://localhost:3306/bbdd*/
            loginjdbc2 = getServletContext().getInitParameter("loginjdbc"); 
            passjdbc2 = getServletContext().getInitParameter("passjdbc");
            conexion2 = DriverManager.getConnection(urljdbc2,loginjdbc2,passjdbc2);
            sentencia2=conexion2.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            
            sentencia_sql2=sentencia2.executeQuery("SELECT * FROM usuarios ");            
            // Bucle para recorrer el resultado del select
            while(sentencia_sql2.next())
            {
                  File file2 = new File("G:/CloudSpace/"+sentencia_sql2.getString(1));
                  
                //out.println("Total size : " + totalSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + usableSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + freeSpace /1024 /1024 /1024 + " GB");
                restante= (sentencia_sql2.getInt("cuota_MB")-(FileUtils.sizeOfDirectory(file2) /1024 /1024 ));
               %>
               <tr>
                
                <td><%out.print(sentencia_sql2.getString(1));%></td>
     
                <td><%out.print(sentencia_sql2.getString(7));%></td>
                <td><%out.print(FileUtils.sizeOfDirectory(file2) /1024 /1024 +" MB");%></td>
                <td><%out.print(FileUtils.sizeOfDirectory(file2) /1024 /1024 *100/sentencia_sql2.getInt("cuota_mb")+" %");%></td>
                <td><%out.print(restante);%></td>
                
               </tr>
              <%
                  conta++;
                 file2=null;
            }
            
            sentencia_sql2.close();
            sentencia2.close();
        }
        
        catch (ClassNotFoundException error1)
        {
           
        }
        catch (SQLException error2)
        {
            out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error lÃ©xico y/o sintÃ¡ctico): "+error2.getMessage());
            
        }
        catch (Exception error3)
        {
            
        }
        finally
        {
            try
            {
                if (conexion2 != null)
                conexion2.close();
            }
            catch (Exception error3)
            {
                //out.println("Se ha producido una excepciÃ³n finally "+ error3.getMessage());
                  %>
              <script language="JavaScript">
                location.href="gestion_errores.jsp?codigo=5"
            </script>
            <% 
            }
        }
        %>   

              </tbody>
            </table>
              <%  }

 %> 
 
 <%
  ////Mailing////
               if (option!=null && option.compareTo("2")==0)
               {
                   
               
                    out.print("<caption><h3>Mailing</h3></caption>");
                    
                    
                    %>
                    <form method="POST" enctype="multipart/form-data" action="correo_fichero_adjunto.jsp" name="form" id="form">
    <fieldset style="width:50%">
        <legend><span>Datos del correo</span></legend>
        <p>Seleccione contacto: </p>
         <%
       
        String urljdbc;
        String loginjdbc;
        String passjdbc;
        Connection conexion=null;
        Statement sentencia=null;
        ResultSet sentencia_sql=null;
        //************************************//
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            urljdbc = getServletContext().getInitParameter("urljdbc"); 
            loginjdbc = getServletContext().getInitParameter("loginjdbc"); 
            passjdbc = getServletContext().getInitParameter("passjdbc"); 
            conexion = DriverManager.getConnection(urljdbc,loginjdbc,passjdbc);
            sentencia=conexion.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            sentencia_sql=sentencia.executeQuery("select * from usuarios");            
            while(sentencia_sql.next())
            {
                out.print(" "+sentencia_sql.getString("nombre_usuario")+" "+sentencia_sql.getString("id_usuario")+" <input type='checkbox' name='to' value='"+sentencia_sql.getString("correo_electronico")+"'/> </br>");
            }    
            sentencia_sql.close();
            sentencia.close();
        }
        catch (ClassNotFoundException error1)
        {
            out.println("ClassNotFoundException: No se puede localizar el Controlador de ORACLE:" +error1.getMessage());
        }
        catch (SQLException error2)
        {
            out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error lÃ©xico y/o sintÃ¡ctico): "+error2.getMessage());
            
        }
        catch (Exception error3)
        {
            out.println("Se ha producido un error indeterminado: "+error3.getMessage());
        }
        finally
        {
            try
            {
                if (conexion != null)
                conexion.close();
            }
            catch (Exception error3)
            {
                out.println("Se ha producido una excepciÃ³n finally "+ error3.getMessage());
            }
        }
        %>       
        <span style="display:block;">Asunto:</span>
        <input type="text" name="asunto"></input><br />
        <span style="display:block;">Cuerpo del correo:</span>
        <textarea cols="36" rows="6" name="texto"></textarea>
    </fieldset>
    <fieldset style="width:50%">
        <legend><span style="display:block;">Fichero Adjunto</span></legend>
        Adjunto: <input type="file" name="adjunto" ><br>
    </fieldset>
        <input type="submit" value="Enviar Correo">&nbsp;&nbsp;<input type="reset" value="Restablecer">
    </form>                      
 <%
 }
  ////F.A.Q////
               if (option!=null && option.compareTo("3")==0)
               {%><H2>F.A.Q<H2/>
                   <div class="row">
        <div class="col-lg-6 col-md-6">
          
         
                <%
      
                                       
        String urljdbc2;       
        String loginjdbc2;
        String passjdbc2;
        String archivos;
        Integer conta =1;
        Integer contab=5;
        Connection conexion2=null;
        Statement sentencia2=null;
        ResultSet sentencia_sql2=null;
        //************************************//
        try
        {
            /* Class.forName("oracle.jdbc.driver.OracleDriver");*/
            Class.forName("com.mysql.jdbc.Driver");
            urljdbc2 = getServletContext().getInitParameter("urljdbc"); 
            /*jdbc:mysql://localhost:3306/bbdd*/
            loginjdbc2 = getServletContext().getInitParameter("loginjdbc"); 
            passjdbc2 = getServletContext().getInitParameter("passjdbc");
            conexion2 = DriverManager.getConnection(urljdbc2,loginjdbc2,passjdbc2);
            sentencia2=conexion2.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            
            sentencia_sql2=sentencia2.executeQuery("SELECT * FROM faq ");            
            // Bucle para recorrer el resultado del select
            while(sentencia_sql2.next())
            {
                
               %>
                    <h2><%out.print(sentencia_sql2.getString(3));%></h2>  <br>              
                <p><%out.print(sentencia_sql2.getString(4));%></p><br>
                <br><br>
                
                
              
              <%
                  conta++;
                
            }
            
            sentencia_sql2.close();
            sentencia2.close();
        }
        
        catch (ClassNotFoundException error1)
        {
           
        }
        catch (SQLException error2)
        {
            out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error lÃ©xico y/o sintÃ¡ctico): "+error2.getMessage());
            
        }
        catch (Exception error3)
        {
            
        }
        finally
        {
            try
            {
                if (conexion2 != null)
                conexion2.close();
            }
            catch (Exception error3)
            {
                //out.println("Se ha producido una excepciÃ³n finally "+ error3.getMessage());
                  %>
              <script language="JavaScript">
                location.href="gestion_errores.jsp?codigo=5"
            </script>
            <% 
            }
        }
        %>   

        <form id="formular">
            <fieldset>
                <BR>
                 <legend>Crea FAQ:</legend>
                Pregunta: <input name="Pregunta" type="text" size="30"><br>
                   <br>
                Respuesta<textarea name="respuesta" rows="4" cols="50" name="comment" form="formular"></textarea>
                <button onclick="submit"></button>
                </fieldset>
</form>
              <%  }

 %> 
 

   <%
  ////Admnistración de usuarios////
               if (option!=null && option.compareTo("5")==0)
               {
 %>
 
 <div class="row text-center pad-top">
                
 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=20">
 <i class="fa fa-users fa-5x"></i>
                      <h4>Ver usuarios</h4>
                      </a>
                      </div>
                     
                     
                  </div>
 
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=21">
 <i class="fa fa-user-plus fa-5x"></i>
                      <h4>Añadir usuarios</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=22">
 <i class="fa fa-user-times fa-5x"></i>
                      <h4>Eliminar usuarios</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="./index.jsp?option=23">
 <i class="fa fa-key fa-5x"></i>
                      <h4>Activar/Desactivar usuarios </h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
              </div>
 
 
 
 

 <%
 }
 
 
 %>
 
 
 
 
 
 
 
 
  <%
  ////Opciones////
               if (option!=null && option.compareTo("8")==0)
               {
 %>

 <%
 }
 
 
 %>
 
 
 
 
<%

 ////VISOR DE USUARIOS////
               if (option!=null && option.compareTo("20")==0)
               {
%><H2>Visor de <H2/>
                   <div class="row">
        <div class="col-lg-6 col-md-6">
          
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>#</th>
                <th>Id Usuario</th>
                <th>Correo</th>
                <th>Tipo</th>
                <th>Fecha de registro</th>
                <th>Activado</th>
                <th>Cuota</th>              
                <th>Espacio usado</th> 
                <th>Porcentaje</th>
                <th>Nombre completo</th>               
              </tr>
            </thead>
            <tbody>
                <%
      
                                       
        String urljdbc2;       
        String loginjdbc2;
        String passjdbc2;
        String archivos;
        Integer conta =1;
        Integer contab=5;
        Connection conexion2=null;
        Statement sentencia2=null;
        ResultSet sentencia_sql2=null;
        //************************************//
        try
        {
            /* Class.forName("oracle.jdbc.driver.OracleDriver");*/
            Class.forName("com.mysql.jdbc.Driver");
            urljdbc2 = getServletContext().getInitParameter("urljdbc"); 
            /*jdbc:mysql://localhost:3306/bbdd*/
            loginjdbc2 = getServletContext().getInitParameter("loginjdbc"); 
            passjdbc2 = getServletContext().getInitParameter("passjdbc");
            conexion2 = DriverManager.getConnection(urljdbc2,loginjdbc2,passjdbc2);
            sentencia2=conexion2.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            
            sentencia_sql2=sentencia2.executeQuery("SELECT * FROM usuarios order by id_usuario  ");            
            // Bucle para recorrer el resultado del select
            while(sentencia_sql2.next())
            {
                  File file2 = new File("G:/CloudSpace/"+sentencia_sql2.getString(1));
                  
                //out.println("Total size : " + totalSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + usableSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + freeSpace /1024 /1024 /1024 + " GB");
               %>
               <tr>
                <td><%out.print(conta);%></td>
                <td><%out.print(sentencia_sql2.getString(1));%></td>
                <td><%out.print(sentencia_sql2.getString(2));%></td>
                <td><%
                    
                    if (sentencia_sql2.getString(3).compareTo("1")==0)
                    
                    {out.print("Administrador");}
                
                    else
                
                    {out.print("Usuario");}
                    
                
                
                
                %></td>
                <td><%out.print(sentencia_sql2.getString(4));%></td>
                <td><%
                    
                    if (sentencia_sql2.getString(6).compareTo("1")==0)
                    
                    {out.print("Activado");}
                
                    else
                
                    {out.print("No activado");}
                    
                
                
                
                %></td>
                <td><%out.print(sentencia_sql2.getString(7));%></td>
                <td><%out.print(FileUtils.sizeOfDirectory(file2) /1024 /1024 +" MB");%></td>
                <td><%out.print(FileUtils.sizeOfDirectory(file2) /1024 /1024 *100/sentencia_sql2.getInt("cuota_mb")+" %");%></td>
                <td><%out.print(sentencia_sql2.getString(9));%></td>
                
               </tr>
              <%
                  conta++;
                 file2=null;
            }
            
            sentencia_sql2.close();
            sentencia2.close();
        }
        
        catch (ClassNotFoundException error1)
        {
           
        }
        catch (SQLException error2)
        {
            out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error lÃ©xico y/o sintÃ¡ctico): "+error2.getMessage());
            
        }
        catch (Exception error3)
        {
            
        }
        finally
        {
            try
            {
                if (conexion2 != null)
                conexion2.close();
            }
            catch (Exception error3)
            {
                //out.println("Se ha producido una excepciÃ³n finally "+ error3.getMessage());
                  %>
              <script language="JavaScript">
                location.href="gestion_errores.jsp?codigo=5"
            </script>
            <% 
            }
        }
        %>   

              </tbody>
            </table>
              <%  }

 %> 
 
 
 
  <%
  ////Añadir usuarios////
               if (option!=null && option.compareTo("21")==0)
               {
 %>

 
 <form action="./insert_user.jsp">
     <label for="exampleInputPassword1">Correo electronico</label>
  <input name="correo" type="email" class="form-control" id="correo" aria-describedby="emailHelp" placeholder="Introduce email">
  
      <label for="exampleInputPassword1">Contraseña</label>
    <input name="pass" type="password" class="form-control" id="pass" placeholder="Contraseña">
     <label for="exampleInputEmail1">Nombre de usuario</label>
    <input name="login" type="user" class="form-control" id="login" aria-describedby="emailHelp" placeholder="Introduce nombre de usuario ">
    <label for="exampleInputEmail1">Nombre de usuario</label>
    <input name="nombre_completo" type="user" class="form-control" id="nombre_completo" aria-describedby="emailHelp" placeholder="Introduce nombre de usuario ">    
        <br>
 <button type="submit" class="btn btn-primary">Dar de alta</button>
      
</form>
 <%
 }
 
 
 %>
 
 
   <%
  ////ELIMINAR USUARIOS ////
               if (option!=null && option.compareTo("22")==0)
               {
 %><H2>Activar nombre usuario<H2/>
                   <div class="row">
        <div class="col-lg-6 col-md-6">
          
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>#</th>
                <th>Id Usuario</th>
                <th>Correo</th>
                <th>Eliminar</th> 
                
              </tr>
            </thead>
            
          
                <%
                      
                                       
        String urljdbc2;       
        String loginjdbc2;
        String passjdbc2;
        String archivos;
        Integer conta =1;
        Integer contab=5;
        Connection conexion2=null;
        Statement sentencia2=null;
        ResultSet sentencia_sql2=null;
        //************************************//
        try
        {
            /* Class.forName("oracle.jdbc.driver.OracleDriver");*/
            Class.forName("com.mysql.jdbc.Driver");
            urljdbc2 = getServletContext().getInitParameter("urljdbc"); 
            /*jdbc:mysql://localhost:3306/bbdd*/
            loginjdbc2 = getServletContext().getInitParameter("loginjdbc"); 
            passjdbc2 = getServletContext().getInitParameter("passjdbc");
            conexion2 = DriverManager.getConnection(urljdbc2,loginjdbc2,passjdbc2);
            sentencia2=conexion2.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            
            sentencia_sql2=sentencia2.executeQuery("SELECT * FROM usuarios ");            
            // Bucle para recorrer el resultado del select
            while(sentencia_sql2.next())
            {
                  File file2 = new File("G:/CloudSpace/"+sentencia_sql2.getString(1));
                  
                //out.println("Total size : " + totalSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + usableSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + freeSpace /1024 /1024 /1024 + " GB");
               %>
               <tr>
                   <form action="./borrar.jsp" method="post">
                <td><%out.print(conta);%></td>    
                <td><%out.print(sentencia_sql2.getString(1));%></td>    
                <td><%out.print(sentencia_sql2.getString(2));%></td> 
                <td><button type="submit" value="<%out.print(sentencia_sql2.getString(1));%>" name="eliminar">Eliminar</button></td>    
                   </form>
               </tr>
             
                <%
                  conta++;
                 file2=null;
            }
            
            sentencia_sql2.close();
            sentencia2.close();
        }
        
        catch (ClassNotFoundException error1)
        {
           
        }
        catch (SQLException error2)
        {
            out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error lÃ©xico y/o sintÃ¡ctico): "+error2.getMessage());
            
        }
        catch (Exception error3)
        {
            
        }
        finally
        {
            try
            {
                if (conexion2 != null)
                conexion2.close();
            }
            catch (Exception error3)
            {
                //out.println("Se ha producido una excepciÃ³n finally "+ error3.getMessage());
                  %>
              <script language="JavaScript">
                location.href="gestion_errores.jsp?codigo=5"
            </script>
            <% 
            }
        }
                   
         %>          
 </table>                  

 <%
  }
 %>
 
 
 
 
 
 
   <%
  ////ACTIVAR/DESACTIVAR USUARIOS  ////
               if (option!=null && option.compareTo("23")==0)
               {
 %><H2>Activar nombre usuario<H2/>
                   <div class="row">
        <div class="col-lg-6 col-md-6">
          
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>#</th>
                <th>Id Usuario</th>
                <th>Correo</th>
                <th>Estado</th> 
                
              </tr>
            </thead>
            
          
                <%
                      
                                       
        String urljdbc2;       
        String loginjdbc2;
        String passjdbc2;
        String archivos;
        Integer conta =1;
        Integer contab=5;
        Connection conexion2=null;
        Statement sentencia2=null;
        ResultSet sentencia_sql2=null;
        //************************************//
        try
        {
            /* Class.forName("oracle.jdbc.driver.OracleDriver");*/
            Class.forName("com.mysql.jdbc.Driver");
            urljdbc2 = getServletContext().getInitParameter("urljdbc"); 
            /*jdbc:mysql://localhost:3306/bbdd*/
            loginjdbc2 = getServletContext().getInitParameter("loginjdbc"); 
            passjdbc2 = getServletContext().getInitParameter("passjdbc");
            conexion2 = DriverManager.getConnection(urljdbc2,loginjdbc2,passjdbc2);
            sentencia2=conexion2.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            
            sentencia_sql2=sentencia2.executeQuery("SELECT * FROM usuarios ");            
            // Bucle para recorrer el resultado del select
            while(sentencia_sql2.next())
            {
                  File file2 = new File("G:/CloudSpace/"+sentencia_sql2.getString(1));
                  
                //out.println("Total size : " + totalSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + usableSpace /1024 /1024 /1024 + " GB");
                //out.println("Space free : " + freeSpace /1024 /1024 /1024 + " GB");
               %>
               <tr>
                   <form action="./activa_user.jsp" method="GET">
                <td><%out.print(conta);%></td>    
                <td><input value="<%out.print(sentencia_sql2.getString(1));%>" readonly name="id_user"></td>    
                <td><%out.print(sentencia_sql2.getString(2));%></td> 
                <td><% if (sentencia_sql2.getString(6).compareTo("1")==0)
                    
                    {%><button type="submit" value="0" name="desactivar">Desactivar</button><%}
                
                    else
                
                     {%><button type="submit" value="1" name="desactivar">Activar</button><%}
                %>
                </td>    
                   </form>
               </tr>
              <%
                  conta++;
                 file2=null;
            }
            
            sentencia_sql2.close();
            sentencia2.close();
        }
        
        catch (ClassNotFoundException error1)
        {
           
        }
        catch (SQLException error2)
        {
            out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error lÃ©xico y/o sintÃ¡ctico): "+error2.getMessage());
            
        }
        catch (Exception error3)
        {
            
        }
        finally
        {
            try
            {
                if (conexion2 != null)
                conexion2.close();
            }
            catch (Exception error3)
            {
                //out.println("Se ha producido una excepciÃ³n finally "+ error3.getMessage());
                  %>
              <script language="JavaScript">
                location.href="gestion_errores.jsp?codigo=5"
            </script>
            <% 
            }
        }
                   
         %>          
 </table>                  

 <%
  }
 %>
 
 
   <%
  ////WORKGROUPS?  ////
               if (option!=null && option.compareTo("90")==0)
               {
 %>

 <%
  }
 %>
 
 

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
