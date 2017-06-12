<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 
<%@ page import="org.apache.commons.io.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.lang.*,java.util.*,java.util.Properties,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.mail.Transport,java.net.*"%>


<%

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
   
ArrayList to=new ArrayList();
int indice=0;
String asunto=null;
String texto=null;
String adjunto=null;
int subido_fichero=-1;   
File archivo=null;

String dirUpload = getServletContext().getRealPath( getServletContext().getInitParameter("dirUploadEmail" ) );
// req es la HttpServletRequest que recibimos del formulario.
// Los items obtenidos serán cada uno de los campos del formulario,
// tanto campos normales como ficheros subidos.
List items = upload.parseRequest(request);


try
{
// Se recorren todos los items, que son de tipo FileItem
                for (Object item : items) 
                {
                   FileItem uploaded = (FileItem) item;
                   // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                   // subido donde nos interese
                   if (!uploaded.isFormField()) 
                   {
                       if(uploaded.getSize()>0)
                       {
                            // No es campo de formulario, guardamos el fichero en algún sitio
                             archivo = new File(dirUpload, uploaded.getName());
                             // No es campo de formulario, guardamos el fichero en algún sitio
                             uploaded.write(archivo);
                             subido_fichero=1;
                       }
                   } 
                   else 
                   {
                      // es un campo de formulario, podemos obtener clave y valor
                      String key = uploaded.getFieldName();
                      if (key.compareTo("to")==0)
                      {
                           to.add(indice++, uploaded.getString());
                      }
                      if (key.compareTo("asunto")==0)
                      {
                           asunto = uploaded.getString();
                      }
                      if (key.compareTo("texto")==0)
                      {
                           texto = uploaded.getString();
                      }
                   }
                   
                }
                //----------------------------------------------------------------------------------//
                //----------------------------------------------------------------------------------//
                try
                {      
                        if (subido_fichero==-1)
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
                                Address [] direcciones = new Address [to.size()];
                                for (int i=0;i<to.size();i++ )
                                {
                                        direcciones[i]=new InternetAddress ((String)to.get(i));
                                }
                                message.addRecipients(Message.RecipientType.TO, direcciones);
                                message.addRecipients(Message.RecipientType.TO, direcciones);
                                message.setFrom(new InternetAddress("primasir@gmail.com"));
                                message.setSubject(asunto);
                                message.setText(texto);
                                // Envio del mensaje de correo electrónico
                                Transport t = s.getTransport("smtp");
                                t.connect("primasir@gmail.com","vamosamorirtodos");
                                t.sendMessage(message,message.getAllRecipients());
                                //Cerramos la conexiÃ³n
                                t.close();
                                out.print("Correo enviado correctamente sin adjunto....");
                        }   
                        else
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
                                Address [] direcciones = new Address [to.size()];
                                for (int i=0;i<to.size();i++ )
                                {
                                        direcciones[i]=new InternetAddress ((String)to.get(i));
                                }
                                message.addRecipients(Message.RecipientType.TO, direcciones);
                                message.addRecipients(Message.RecipientType.TO, direcciones);
                                message.setFrom(new InternetAddress("primasir@gmail.com"));
                                message.setSubject(asunto);
                                message.setText(texto);
                                //*******************************************
                                Multipart mp = new MimeMultipart();
                                // Texto del mensaje
                                BodyPart c_texto = new MimeBodyPart ();
                                c_texto.setText (texto);
                                mp.addBodyPart (c_texto);
                                // Adjuntar el primer fichero
                                MimeBodyPart adjunto1 = new MimeBodyPart ();
                                adjunto1.attachFile(archivo.getAbsolutePath());
                                mp.addBodyPart(adjunto1);
                                /***********************************************/
                                message.setContent(mp);
                                // Envio del mensaje de correo electrónico
                                Transport t = s.getTransport("smtp");
                                t.connect("primasir@gmail.com","vamosamorirtodos");
                                t.sendMessage(message,message.getAllRecipients());
                                //Cerramos la conexiÃ³n
                                t.close();
                                out.print("Correo enviado correctamente sin adjunto....");
                                if (archivo.exists())
                                {    
                                    archivo.delete();
                                }
                        }   
   
                 }
                 catch (Exception la)
                 {
                     out.print("Error al enviar mensaje:" + la.getMessage());
                     la.printStackTrace();
                 }   
                //----------------------------------------------------------------------------------//
                //----------------------------------------------------------------------------------//
}
catch( FileUploadException e ) 
{
    e.printStackTrace();            
}
catch (Exception e)
{
    e.printStackTrace();
}            
        //----------------------------------------------------------------------------------//
        //----------------------------------------------------------------------------------//
%>

    <script language="JavaScript">
                sleep.
                location.href="./index_administrador.jsp?option=5"
            </script>