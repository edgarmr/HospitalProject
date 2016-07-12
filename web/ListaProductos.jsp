<%-- 
    Document   : ListaProductos
    Created on : 10/07/2016, 06:40:17 PM
    Author     : Edgar
--%>

<%@page import="Model.Clasess.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Producto []listPro = (Producto[]) request.getAttribute("listaPro"); %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="shortcut icon" href="img\\logo.png">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Consulta de Productos</title>

        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/datepicker.css">
        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <script src="js/jquery-2.2.2.min.js"></script>
        <script>
            $(document).ready(function(){
                $("#save").on('click',function(){
                    $.post('ActualizarProducto',
                    {
                        id: $("#mid").val(),
                        nombre: $("#mnombre").val(),
                        descrip: $("#mdescrip").val(),
                        costo: $("#mcosto").val(),
                        precio: $("#mprecio").val(),
                        prove: $("#mprove").val(),
                        exist: $("#mexist").val(),
                        tipo: $("#mtipo").val(),
                        unidad: $("#munidad").val()
                    },
                    function(response){
                        $("#titulo").html(response);
                    });  
            });
            
            (function($) {
                $("#searchProduct").on('keyup', function() {
                    var rex = new RegExp($(this).val(), 'i');
                    $("tr").hide();
                    $("tr").filter(function() {
                        return rex.test($(this).text());
                    }).show();
                });
            }(jQuery));
        });
            function updateRow(id){
                $("#mnombre").val($("#nombre"+id).html());
                $("#mdescrip").val($("#descrip"+id).html());
                $("#mcosto").val($("#costo"+id).html());
                $("#mprecio").val($("#precio"+id).html());
                $("#mprove").val($("#prove"+id).html());
                $("#mexist").val(parseInt($("#exist"+id).html()));
                $("#mtipo").val($("#tipo"+id).html());
                $("#munidad").val($("#unidad"+id).html());  
                $("#mid").val(id);
            }
            
            function deleteRow(id){
                $.post('BorrarProducto',{id: id},function(response){
                    $("#"+id).hide();
                    
                });
            }
        </script>
    </head>

    <body>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-center">Actualización</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <input id="mid" type="hidden">
                            <div class="form-group">
                                <label for="">Nombre</label>
                                <input type="text" class="form-control" id="mnombre">
                            </div>
                            <div class="form-group">
                                <label for="">Descripción</label>
                                <input type="text" class="form-control" id="mdescrip">
                            </div>
                            <div class="form-group">
                                <label for="">Costo</label>
                                <input type="text" class="form-control" id="mcosto">
                            </div>
                            <div class="form-group">
                                <label for="">Precio</label>
                                <input type="text" class="form-control" id="mprecio">
                            </div>
                            <div class="form-group">
                                <label for="">Proveedor</label>
                                <input type="text" class="form-control" id="mprove">
                            </div>
                            <div class="form-group">
                                <label for="">Existencia</label>
                                <input type="number" class="form-control" id="mexist">
                            </div>
                            <div class="form-group">
                                <label for="">Tipo</label>
                                <input type="text" class="form-control" id="mtipo">
                            </div>
                            <div class="form-group">
                                <label for="">Unidad</label>
                                <input type="text" class="form-control" id="munidad">
                            </div>
                            <button id="save" type="button" class="btn btn-success" data-dismiss="modal">Enviar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a>
                            Bienvenido Administrador !
                        </a>
                    </li>
                    <li>
                        <a href="admin.php" cl><span class="glyphicon glyphicon-home"  aria-hidden="true"></span> Inicio </a>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-user"  aria-hidden="true"></span>  
                            Registro de Usuarios <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="altaspersonal.php"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                            <li><a href="cambiospersonal.php"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-tags"  aria-hidden="true"></span>  
                            Registro de Productos <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="AltaProductos.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                            <li><a href="ListaProductos.jsp"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-th-list"  aria-hidden="true"></span>  
                            Registro de Pacientes <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="altaspacientes.php"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                            <li><a href="#"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-list-alt"  aria-hidden="true"></span>  
                            Cotizaciones <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="altascotizaciones.php"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                            <li><a href="#"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-time"  aria-hidden="true"></span>  
                            Antecedentes <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="hereditarios.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">    Hereditarios </span></a></li>
                            <li><a href="patologicos.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">    Patol&oacute;gicos</span> </a></li>
                            <li><a href="nopatologicos.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> No Patol&oacute;gicos</span> </a></li>
                            <li><a href="cronicas.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> Cr&oacute;nicas</span> </a></li>                             
                        </ul>
                    </li>

                    <li>
                        <a href="index.php" cl><span class="glyphicon glyphicon-log-out"  aria-hidden="true"></span>  Cerrar Sesi&oacute;n </a>
                    </li>

                    <!-- Boton Cerrar Menu -->
                    <div id="page-content-wrapper">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <a href="#menu-toggle2" id="menu-toggle2"> 
                                        <button type="button" class="btn btn-primary">Cerrar Menu</button> 
                                    </a>             
                                </div>
                            </div>
                        </div>
                    </div>

                </ul>



            </div> <!-- Fin Div de Barra Lateral-->
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <a href="#menu-toggle" id="menu-toggle">
                    <button type="button" class="btn btn-danger">Abrir/Cerrar Menu</button>
                </a>
                <h1 id="titulo" class="text-center"> Lista de productos </h1>
                
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchProduct" placeholder="Búsqueda de productos (por nombre, descripción etc...)">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
                    </div>
                </div>
                
                <div class="table-responsive">
                <table class="table table-hover" style="margin-top: 20px;">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Costo</th>
                            <th>Precio</th>
                            <th>Proveedor</th>
                            <th>Existencia</th>
                            <th>Tipo</th>
                            <th>Unidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(listPro!=null){
                                for(int i=0; i<listPro.length; i++){
                        %>
                        <tr id="<%=listPro[i].getProducto_id()%>">
                            <td id="nombre<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getNombre() %> </td>
                            <td id="descrip<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getDescripcion() %> </td>
                            <td id="costo<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getCosto() %> </td>
                            <td id="precio<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getPrecio() %> </td>
                            <td id="prove<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getProveedor() %> </td>
                            <td id="exist<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getExistencia() %> </td>
                            <td id="tipo<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getTipo() %> </td>
                            <td id="unidad<%=listPro[i].getProducto_id()%>"> <%= listPro[i].getUnidad() %> </td>
                            <td>
                                <button id="update" class='btn btn-warning btn-xs' type='button' data-toggle="modal" data-target="#myModal" onclick="updateRow('<%=listPro[i].getProducto_id()%>')">
                                    <span class='glyphicon glyphicon-refresh'></span>
                                </button>
                                    <button class='btn btn-danger btn-xs' type='button' onclick="deleteRow('<%=listPro[i].getProducto_id()%>')">
                                    <span class='glyphicon glyphicon-trash'></span>
                                </button>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                </div>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        
        <script src="js/main.js"></script>
        

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>

        <script>
            $(function () {
                $('.datepicker').datepicker();
            });
        </script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>

        <!-- Menu Toggle2 Script 2 -->
        <script>
            $("#menu-toggle2").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>

    </body>
</html>
