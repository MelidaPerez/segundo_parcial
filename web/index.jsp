<%-- 
    Document   : index
    Created on : 20/09/2020, 08:47:30 PM
    Author     : Mélida Pérez
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Marca"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCTOS</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>FORMULARIO PRODUCTOS</h1>
        </div>
        <div class="container"> 
            <form action="sr_producto" method="post" class="formg-roup">
                
                <label for="lbl_id">ID:</label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <br>
                <label for="lbl_producto">Producto:</label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: computadora" required>
                <br>
                <label for="lbl_marca">Marca:</label>
                <select name="drop_marca" id="drop_marca" class="form-control">
                   
                    
                    <%
                        Marca marca = new Marca();
                        HashMap<String,String> drop = marca.drop_marca();
                        for(String i: drop.keySet()){
                            out.println("<option value='"+ i +"'>"+ drop.get(i) +" </option>");
                        }

                     %>   
                    
                </select>
                <br>
                <label for="lbl_descripcion">Descripcion:</label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder=" Ejemplo: Laptop" required>
                <br>
                <label for="lbl_precio_costo">Precio Costo:</label>
                <input type="number" step="0.01" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo: 4000" required>
                <br>
                <label for="lbl_precio_venta">Precio Venta:</label>
                <input type="number" step="0.01" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 4100" required>
                <br>
                <label for="lbl_existencia">Existencia:</label>
                <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: 6" required>
                <br>
              
               
            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary" >Agregar</button>  
            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success" >Modificar</button>  
            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" >Eliminar</button> 
            </br>
            </form> 
            </br>

            <table class="table table-striped">
    <thead>
      <tr>
        <th>Producto</th>
        <th>Descripcion</th>
        <th>Precio Costo</th>
        <th>Precio Venta</th>
        <th>Existencia</th>
        <th>Marca</th>
      </tr>
    </thead>
    <tbody id="tbl_productos">
        <% 
        Producto producto = new Producto();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = producto.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_m=" + tabla.getValueAt(t,7) + ">");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("</tr>");
        }
        %>
      
    </tbody>
    </table>    
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
      
        <script>
           $('#tbl_productos').on('click','tr td', function(evt){
   var target,id,id_m,producto,descripcion,precio_costo,precio_venta,existencia,marca;
   
   target = $(event.target);
   id= target.parent().data('id');
   id_m=target.parent().data('id_m');
   producto = target.parents("tr").find("td").eq(1).html();
   descripcion= target.parents("tr").find("td").eq(2).html();
   precio_costo= target.parents("tr").find("td").eq(3).html();
   precio_venta= target.parents("tr").find("td").eq(4).html();
   existencia= target.parents("tr").find("td").eq(5).html();
   marca= target.parents("tr").find("td").eq(6).html();
   
   $("#txt_id").val(id);
   $("#txt_producto").val(producto);
   $("#txt_descripcion").val(descripcion);
   $("#txt_precio_costo").val(precio_costo);
   $("#txt_precio_venta").val(precio_venta);
   $("#txt_existencia").val(existencia);
   $("#drop_marca").val(id_m);
   
});
</script>
   
    </body>
</html>
