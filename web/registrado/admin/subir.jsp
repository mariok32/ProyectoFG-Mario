<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 
<%@ page import="org.apache.commons.io.*" %> 
<%@ page import="java.io.*" %> 
<%

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
String cif=null;
upload.setSizeMax(0);
 
String dirUpload = getServletContext().getRealPath( getServletContext().getInitParameter("dirFileEmpresas" ) );

// req es la HttpServletRequest que recibimos del formulario.
// Los items obtenidos serán cada uno de los campos del formulario,
// tanto campos normales como ficheros subidos.
List items = upload.parseRequest(request);

// Se recorren todos los items, que son de tipo FileItem
for (Object item : items) {
   FileItem uploaded = (FileItem) item;

   // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
   // subido donde nos interese
   if (!uploaded.isFormField()) {
      // No es campo de formulario, guardamos el fichero en algún sitio
       if(uploaded.getSize()>0 && cif!=null)
       {    
 
            File directorio = new File(dirUpload);

            String extension = uploaded.getName().substring( uploaded.getName().lastIndexOf( "." ) );
            File fichero = new File(dirUpload, uploaded.getName());
            File renombrar = new File(dirUpload+"/"+cif+extension);
            // Si existe un avatar se eleimina para subir el nuevo
            if (renombrar.exists())
            {
                     renombrar.delete();
            }
            // No es campo de formulario, guardamos el fichero en algún sitio
            uploaded.write(fichero);
            fichero.renameTo(renombrar);
            %>
                <script language="JavaScript">
                    alert("Subido tu nuevo avatar el avatar!!!!!")
                </script>
            <%
       }
       else
       {
                %>
        <script language="JavaScript">
            alert("No se ha seleccionado el avatar!!!!!")
        </script>
                <%
       }    
   } 
   else 
   {
      // es un campo de formulario, podemos obtener clave y valor
      String key = uploaded.getFieldName();
      if (key.compareTo("cif")==0)
      {
           cif = uploaded.getString();
      }
   }
}
%>
