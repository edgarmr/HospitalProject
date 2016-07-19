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
    <head>
        <link rel="shortcut icon" href="img/logo.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Menú - Hospital México</title>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <script src="js/jquery-2.2.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
        <link href="css/sweetalert.css" rel="stylesheet">
        <script src="js/sweetalert.min.js"></script>
        <script type="text/javascript" src="js/productos.js"></script>
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                $("#expPDF").click(function () {
                    var dataSource = shield.DataSource.create({
                        data: "#tableSales",
                        schema: {
                            type: "table",
                            fields: {
                                Folio: { type: String },
                                Producto: { type: Number },
                                Precio: { type: String },
                                Cantidad: { type: String },
                                Subtotal: { type: String },
                                Total: { type: String },
                                Lugar: { type: String },
                                FormaPago: { type: String },
                                FechaVenta: { type: String }

                            }
                        }
                    });

                    // when parsing is done, export the data to PDF
                    dataSource.read().then(function (data) {
                        var pdf = new shield.exp.PDFDocument({
                            author: "Edgar Mendoza",
                            created: new Date(),
                        });

                        pdf.addPage("a3", "portrait");

                        pdf.table(
                            50,
                            50,
                            data,
                            [
                                { field: "Folio", title: "Folio", width: 50 },
                                { field: "Producto", title: "Producto", width: 100 },
                                { field: "Precio", title: "Precio", width: 50 },
                                { field: "Cantidad", title: "Cantidad", width: 60 },
                                { field: "Subtotal", title: "Subtotal", width: 50 },
                                { field: "Total", title: "Total", width: 50 },
                                { field: "Lugar", title: "Lugar", width: 100 },
                                { field: "FormaPago", title: "Forma de pago", width: 100 },
                                { field: "FechaVenta", title: "Fecha de venta", width: 150 }
                            ],
                            {
                                margins: {
                                    top: 50,
                                    left: 50
                                }

                            }
                        );
                        pdf.saveAs({
                            fileName: "Ventas"
                        });
                    });
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function(){
                
                $("#filterByYear").on('click',function(){
                    $.post('FiltrarVenta',
                        {firstDate: $("#firstDate").val(),
                         lastDate: $("#lastDate").val()
                        },
                    function(response){
                        $("#innerTable").html(response);
                    }
                    );
                });
                
            });
        </script>
        <style type="text/css">
            div.modal-header,div.modal-footer{
                background-color: #E74C3C;
                color: #FDFEFE;
            }
            
            input[type="image"]{
                width: 5%;
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <div align="center"><a>Bienvenido</a></div>
                    </li>
                    <li>
                        <a href="Menu.jsp"><span class="glyphicon glyphicon-home"  aria-hidden="true"></span> Inicio </a>
                    </li>
                    <%if (rol.equals("Administrador")) {%>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-user"  aria-hidden="true"></span>  
                            Personal <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="AltaUsuarios.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true">Altas</span></a></li>
                            <li><a href="ConsultarUsuario"> <span class="glyphicon glyphicon-pencil" aria-hidden="true">Consultas</span> </a></li>                             
                        </ul>
                    </li>
                    <%}%>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-tags"  aria-hidden="true"></span>  
                            Productos <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="AltaProductos.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                            <li><a href="ConsultarProducto"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-th-list"  aria-hidden="true"></span>  
                            Pacientes <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="AltaPacientes.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                            <li><a href="ConsultarPaciente"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-list-alt"  aria-hidden="true"></span>  
                            Cotizaciones <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="AltaCotizaciones.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                            <li><a href="ConsultarVenta"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
                        </ul>
                    </li>
                    <li>
                        <a href="Logout"><span class="glyphicon glyphicon-log-out"  aria-hidden="true"></span>Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="modal-title text-center">Actualización</h3>
                        </div>
                        <div class="modal-body">
                            <form action="ActualizarProducto" method="post">
                                <input id="mid" name="id" type="hidden">
                                <div class="form-group">
                                    <label for="">Nombre</label>
                                    <input type="text" class="form-control" id="mnombre" name="nombre">
                                </div>
                                <div class="form-group">
                                    <label for="">Descripción</label>
                                    <input type="text" class="form-control" id="mdescrip" name="descrip">
                                </div>
                                <div class="form-group">
                                    <label for="">Costo</label>
                                    <input type="text" class="form-control" id="mcosto" name="costo">
                                </div>
                                <div class="form-group">
                                    <label for="">Precio</label>
                                    <input type="text" class="form-control" id="mprecio" name="precio">
                                </div>
                                <div class="form-group">
                                    <label for="">Proveedor</label>
                                    <input type="text" class="form-control" id="mprove" name="prove">
                                </div>
                                <div class="form-group">
                                    <label for="">Existencia</label>
                                    <input type="number" class="form-control" id="mexist" name="exist">
                                </div>
                                <div class="form-group">
                                    <label for="">Tipo</label>
                                    <input type="text" class="form-control" id="mtipo" name="tipo">
                                </div>
                                <div class="form-group">
                                    <label for="">Unidad</label>
                                    <input type="text" class="form-control" id="munidad" name="unidad">
                                </div>
                                <button id="save" type="submit" class="btn btn-success">Enviar</button>
                            </form>
                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>
            </div>
            <div id="page-content-wrapper">
                <a href="#menu-toggle" id="menu-toggle">
                    <input type="image" src="img/flecha.png">
                </a>
                
                
                <div class="form-inline" style="margin-top: 10px;">
                    <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon"> <span class="glyphicon glyphicon-calendar"> </span> </div>
                                    <input type="date" class="form-control" id="firstDate" placeholder="Año Inicial">
                            </div>
                            <div class="input-group">
                                    <input type="date" class="form-control" id="lastDate" placeholder="Año Final">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"> </span></div>
                            </div>
                    </div>
                    <button id="filterByYear" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-filter"></span></button>
                </div>
                
                
                <h1 id="titulo" class="text-center text-primary"> Listado de Ventas </h1>
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchProduct" placeholder="Búsqueda de productos (por nombre, descripción etc...)">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
                    </div>
                    <div id="innerTable" class="table-responsive" style="height: 60%;">
                        <table id="tableSales" class="table table-hover" style="margin-top: 20px;">
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
                                    }
                                %>
                            </tbody>
                        </table>
                            <div id="editor"></div>
                    </div>
                    <div class="row text-center">
                        <input id="expPDF" type="image" src="img/pdf.png">
                        <input type="image" src="img/excel.png" onclick="ExportToExcel()">
                        <a href="Chart">
                          <input type="image" src="img/graph.png">  
                        </a>
                        
                    </div>
                            
                </div>
            </div>
        </div>
        <script>
            
            function ExportToExcel(){
                var table = document.getElementById("tableSales");
                var html = table.outerHTML;
                window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
                
            }
        </script>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
