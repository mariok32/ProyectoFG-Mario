
<%@page import="java.lang.*,java.util.*,java.sql.*,java.io.*"%>
<%@page import="java.util.Properties,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.mail.Transport,java.net.*"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.*"%>
<%
        String urljdbc; 
        String loginjdbc; 
        String passjdbc; 
        
        //********************************
        Connection conexion=null;
        //*********************************
        Statement sentencia=null;
        Statement sentencia1=null;
        //**********************************
        ResultSet sentencia_sql=null;
        //*********************************
        StringBuffer built_stmt=new StringBuffer();
        StringBuffer built_stmt1=new StringBuffer();
        StringBuffer correo=new StringBuffer();
        //************************************************
        String c1=request.getParameter("nombre");
        String c2=request.getParameter("provincia");
        String c3=request.getParameter("interes");
        String c4=request.getParameter("recomendacion");
        String c5=request.getParameter("cif");
        String c6=request.getParameter("codigo_sector");
        String c7=request.getParameter("codigo_modalidad");


        //*************************************************
        int estado=0;
        //**************************************************   
            try
            {
              Class.forName("com.mysql.jdbc.Driver");
              urljdbc = getServletContext().getInitParameter("urljdbc"); 
               loginjdbc = getServletContext().getInitParameter("loginjdbc"); 
               passjdbc = getServletContext().getInitParameter("passjdbc"); 
               conexion = DriverManager.getConnection(urljdbc,loginjdbc,passjdbc);
               sentencia=conexion.createStatement();
               /**************************************************/
               /**************************************************/
               // Paso 1.- Insertar :  hexString.toString() - pass en md5
               //**************************************************/
               built_stmt.append("INSERT INTO `curso` (`codigo_curso`, `nombre_curso`, `fecha_registro_curso`, `provincia_curso`, `recomendacion_curso`, `interes_curso`, `codigo_modalidad`, `cif`, `codigo_sector`) VALUES (NULL, '"+c1+"',NOW(), '"+c2+"', '"+c4+"', '"+c3+"', '"+c7+"', '"+c5+"', '"+c6+"');");
               sentencia.execute(built_stmt.toString());
               sentencia.close();
               estado=0;
               /**************************************************  
                Paso 2.- Crear Carpeta Personal
                <context-param>
                <param-name>dir_user_registrados</param-name>
                <param-value>/jsp/registro_ajax/dir_users</param-value>
                </context-param>
                import java.io.*;
               **************************************************/  
               try
               {
                    String dirUpload = getServletContext().getRealPath( getServletContext().getInitParameter("dir_user_registrados" ) ); 
                    File directorio_raiz_user=new File(dirUpload+"/"+c1);
                   
                    
                    if (!directorio_raiz_user.exists())
                    {
                        
                        directorio_raiz_user.mkdir();
                     }
               }  
               catch (Exception error)
               {
                        out.print( error.getMessage());
               }
               //**************************************************  
               // Paso 3.- Enviar Correo de Activación
               //**************************************************  
              
               
               /***********************************/
            }
            catch (ClassNotFoundException error1)
            {
                out.println("ClassNotFoundException: No se puede localizar el Controlador de ORACLE:" +error1.getMessage());
            }
            catch (SQLException error2)
            {
                out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error léxico y/o sintáctico): "+error2.getMessage());
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
                out.println("Se ha producido una excepción finally "+ error3.getMessage());
                }
            }
    %>
         
            <script language="JavaScript">
                location.href="./index_administrador.jsp?option=11"
            </script>