
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
        String login=request.getParameter("correo");
        String pass=request.getParameter("pass");
        String id=request.getParameter("login");
        String nombre=request.getParameter("nombre_completo");
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
               built_stmt.append("insert into usuarios values ('"+id+"','"+login+"','0',now(),'"+pass+"','0','5000','0','"+nombre+"')");
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
                    File directorio_raiz_user=new File("G:/CloudSpace"+"/"+id);
                   
                    
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
              
               try
                    {
                        Properties props = System.getProperties();
                        // Definir las características del servidor de correo
                        props.put("mail.smtp.host", "smtp.gmail.com");
                        props.setProperty("mail.smtp.starttls.enable", "true");
                        props.setProperty("mail.smtp.port","587");
                        props.setProperty("mail.smtp.auth", "true");
                        // Obtener la sesión
                        Session s = Session.getDefaultInstance(props);
                        // Creación del mensaje
                        MimeMessage message = new MimeMessage(s);
                        message.setFrom(new InternetAddress("primasir@gmail.com"));
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(login));
                        message.setSubject("Proceso de Activación");
                        StringBuffer texto=new StringBuffer();
                        texto.append("Realiza la activación...");
                        texto.append("Copia la siguiente dirección: http://localhost:8084/proyectomario/Publico/registro_ajax/activa_user.jsp?login="+login);
                        texto.append(" Te aparecerá un formulario de validación (login/password) que deberás rellenar");
                        message.setText(texto.toString());
                        // Envio del mensaje de correo electrónico
                        Transport t = s.getTransport("smtp");
                        t.connect("primasir@gmail.com","vamosamorirtodos");
                        t.sendMessage(message,message.getAllRecipients());
                        //Cerramos la conexiÃ³n
                        t.close();
                    }
                    catch (Exception la)
                    {
                        out.print("Error al enviar mensaje:" + la.getMessage());
                        la.printStackTrace();
                    }
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
            //    location.href="registro_usuario.jsp"
            </script>