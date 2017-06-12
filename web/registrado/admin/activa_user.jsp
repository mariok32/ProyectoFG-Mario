<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*"%>
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
        String id_user=request.getParameter("id_user");
        String desactivar=request.getParameter("desactivar");
        if (id_user==null)
        {
            %>
              <script language="JavaScript">
                 location.href="gestion_errores.jsp?codigo=XX"
              </script>
            <% 
        }   
        else
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
                  if (request.getParameter("desactivar").compareTo("1")==0){
                         sentencia.execute("update usuarios set activado=1 where id_usuario='"+id_user+"'");
                    }
                  if (request.getParameter("desactivar").compareTo("0")==0)
                    {   sentencia.execute("update usuarios set activado=0 where id_usuario='"+id_user+"'");}
                  //************************************
                  sentencia.close();
                }
                catch (ClassNotFoundException error1)
                {
                    //out.println("ClassNotFoundException: No se puede localizar el Controlador de ORACLE:" +error1.getMessage());
                }
                catch (SQLException error2)
                {
                   // out.println("update usuario set activo=1 where id_usuario='"+id_user+"'");
                 //   out.println("Error en la sentencia sql que se ha intentado ejecutar (Posible error léxico y/o sintáctico): "+error2.getMessage());
                }
                catch (Exception error3)
                {
                  //  out.println("Se ha producido un error indeterminado: "+error3.getMessage());
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
          }    
    %>
              <script language="JavaScript">
                 location.href="./index.jsp?option=23"
            </script>
