Bienvenido <%@page import="java.lang.*,java.util.*,java.sql.*"%>
<%
        HttpSession datossesion=request.getSession();
        
        //********************************
        String urljdbc; 
        String loginjdbc; 
        String passjdbc; 
        String nombre;
        //********************************
        Connection conexion=null;
        //*********************************
        Statement sentencia=null;
        //**********************************
        ResultSet sentencia_sql=null;
        //*********************************
        StringBuffer built_stmt=new StringBuffer();
        //*****************************************
        String login=request.getParameter("login");
        String pass=request.getParameter("pass");
        String rec=request.getParameter("rec"); 
        int error=-1;
        //**************************************************
            try
            {
              Class.forName("com.mysql.jdbc.Driver");
              urljdbc = getServletContext().getInitParameter("urljdbc"); 
              loginjdbc = getServletContext().getInitParameter("loginjdbc"); 
              passjdbc = getServletContext().getInitParameter("passjdbc"); 
              conexion = DriverManager.getConnection(urljdbc,loginjdbc,passjdbc);
              sentencia=conexion.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
              built_stmt.append("select * from usuarios where correo_electronico='"+login+"' and contraseña='"+pass+"' or id_usuario='"+login+"' and contraseña='"+pass+"' ");
              //out.print("select * from usuario where correo_usuario='"+login+"' and pass='"+pass+"'");
              sentencia_sql= sentencia.executeQuery(built_stmt.toString());
              if (sentencia_sql.next())
                  
              {  
                  
                               
                   if (Integer.valueOf(sentencia_sql.getString("activado")).intValue()==1)
                   {    
                       datossesion.setAttribute("login",sentencia_sql.getString("correo_electronico"));
                       datossesion.setAttribute("perfil",new Integer(sentencia_sql.getString("tipo_usuario"))); 
                       datossesion.setAttribute("nombre",sentencia_sql.getString("id_usuario"));
                       datossesion.setAttribute("nombre_usuarios",sentencia_sql.getString("nombre_usuario"));
                       datossesion.setAttribute("cuota",sentencia_sql.getString("cuota_MB"));
                       if(rec!=null)
                       {
                                   Cookie miCookie=new Cookie("correo_usuario",sentencia_sql.getString("correo_electronico"));
                                   miCookie.setMaxAge(60*60*24*31);
                                   miCookie.setPath("/");
                                   response.addCookie(miCookie);
                                   
                        }
                        if (Integer.valueOf(sentencia_sql.getString("tipo_usuario")).intValue()==1)
                        {
                                   
 

                                    %>
                                    <script language="JavaScript">
                                      location.href="../registrado/admin/index.jsp"
                                        
                                         
                                    </script>
                                    <%
                        }
                        else
                        {
                                String nombre_usuarios=(String)datossesion.getAttribute("nombre");
                               
                                String apellidos=(String)datossesion.getAttribute("apellidos");

                                    %>
                                    <script language="JavaScript">
                                        location.href="../registrado/usuarios/index.jsp?sort=1&dir=G%3A%5CCloudSpace%5C<%out.print(nombre_usuarios);%>"
                                        
                                    </script>
                                 <%
                        }
                    }
                    else
                    {
                       error=3;  // el usuario existe en el sistema activacion_usuario=0
                    }    
              }
              else
              {
                  error=2;  // el usuario no existe en el sistema
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
         location.href="./login.jsp?error=<%=error%>"
        </script>
