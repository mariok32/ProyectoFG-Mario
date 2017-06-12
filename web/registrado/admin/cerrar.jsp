<%@page import="java.lang.*,java.util.*"%>
<%
     HttpSession repositorio=request.getSession();
     repositorio.setAttribute("cursor",null);
 %>
 <script language="JavaScript">
                location.href="../../index.jsp"
            </script>