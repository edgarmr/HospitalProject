<%-- 
    Document   : ListaProductos
    Created on : 10/07/2016, 06:40:17 PM
    Author     : Edgar
--%>
<%@page import="Model.Classes.Venta" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Venta[] listVenta = (Venta[]) request.getAttribute("listaVentas");
    HttpSession sesion = request.getSession();
    String rol = sesion.getAttribute("rolSesion").toString();
%>
<html lang="en">

    <body>


                        <table id="tableSales" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Folio</th>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th>Total</th>
                                    <th>Lugar</th>
                                    <th>FormaPago</th>
                                    <th>FechaVenta</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int id = 0;
                                    if (listVenta != null) {
                                        for (int i = 0; i < listVenta.length; i++) {
                                            
                                %>
                                <tr>
                                    <td> #00<%= listVenta[i].getVenta_id() %> </td>
                                    <td> <%= listVenta[i].getNombre() %> </td>
                                    <td> <%= listVenta[i].getPrecio() %> </td>
                                    <td> <%= listVenta[i].getCantidad() %> </td>
                                    <td> <%= listVenta[i].getSubtotal() %> </td>
                                    <td> <%= listVenta[i].getTotal() %> </td>
                                    <td> <%= listVenta[i].getLugar()  %> </td>
                                    <td> <%= listVenta[i].getForma_pago() %> </td>
                                    <td> <%= listVenta[i].getFecha() %> </td>
                                </tr>
                                <%

                                        }
                                    }else{
                                    
                                        out.println("NO SE ENCONTRARON RESULTADOS");
                                    }
                                %>
                            </tbody>
                        </table>
                            <div id="editor"></div>
                            
    </body>
</html>