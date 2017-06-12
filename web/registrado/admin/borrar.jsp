<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>
<%
        String urljdbc; 
        String loginjdbc; 
        String passjdbc; 
        //********************************
        Connection conexion=null;
        //*********************************
        Statement sentencia=null;
        //*********************************
        String codigo_login=request.getParameter("eliminar");
        String codigo_cif=request.getParameter("cif");
        String codigo_curso=request.getParameter("codigo_curso");
        
     
        if (codigo_login!=null)
        {
            try
            {
		  Class.forName("com.mysql.jdbc.Driver");
		  urljdbc = getServletContext().getInitParameter("urljdbc"); 
		  loginjdbc = getServletContext().getInitParameter("loginjdbc"); 
		  passjdbc = getServletContext().getInitParameter("passjdbc"); 
                  conexion = DriverManager.getConnection(urljdbc,loginjdbc,passjdbc);
                  //************************************
                  sentencia=conexion.createStatement();
                  sentencia.execute("delete from usuarios where id_usuario='"+codigo_login+"'");
                  //************************************
                  out.println("el borrado se ha realizado correctamente......");
                  File Archivo = new File("G:/CloudSpace"+"/"+codigo_login);
                  out.print(Archivo);
                  FileUtils.deleteDirectory(Archivo); 
                  sentencia.close();
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
                        {
                            conexion.close();
                             %>
                
                        <script language="JavaScript">
            
                             location.href="./index.jsp?option=22"
           
                        </script>

                        

                              
                   
        <%                
                        } 
                        
                    }
                    catch (Exception error3)
                    {
                    out.println("Se ha producido una excepción finally "+ error3.getMessage());
                    }
                }
               
        }
%>
