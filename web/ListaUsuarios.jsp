<%-- 
    Document   : ListaUsuarios
    Created on : Jul 13, 2016, 8:20:23 PM
    Author     : Daniel
--%>

<%@page import="Model.Classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario[] listUsr = (Usuario[]) request.getAttribute("listaUsr"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="img\\logo.png">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Consulta de Usuarios</title>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/datepicker.css">
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/sweetalert.css" rel="stylesheet">
        <script src="js/sweetalert.min.js"></script>
        <script src="js/jquery-2.2.2.min.js"></script>
        <script type="text/javascript" src="js/productos.js"></script>
        <style type="text/css">
            div.modal-header,div.modal-footer{
                background-color: #E74C3C;
                color: #FDFEFE;
            }
        </style>
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
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
                <button type="button" class="btn btn-danger">Abrir/Cerrar Menú</button>
            </a>
            <h1 id="titulo" class="text-center"> Lista de productos </h1>

            <div class="form-group">
                <div class="input-group">
                    <input type="text" class="form-control" id="searchProduct" placeholder="Búsqueda de productos (por nombre, descripción etc...)">
                    <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
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
                                int id = 0;
                                if (listPro != null) {
                                    for (int i = 0; i < listPro.length; i++) {
                                        id = listPro[i].getProducto_id();
                            %>
                            <tr id="tr<%=id%>">
                                <td id="nombre<%=id%>"> <%= listPro[i].getNombre()%> </td>
                                <td id="descrip<%=id%>"> <%= listPro[i].getDescripcion()%> </td>
                                <td id="costo<%=id%>"> <%= listPro[i].getCosto()%> </td>
                                <td id="precio<%=id%>"> <%= listPro[i].getPrecio()%> </td>
                                <td id="prove<%=id%>"> <%= listPro[i].getProveedor()%> </td>
                                <td id="exist<%=id%>"> <%= listPro[i].getExistencia()%> </td>
                                <td id="tipo<%=id%>"> <%= listPro[i].getTipo()%> </td>
                                <td id="unidad<%=id%>"> <%= listPro[i].getUnidad()%> </td>
                                <td>
                                    <button id="<%=id%>" class='btn btn-warning btn-xs update' type='button' data-toggle="modal" data-target="#myModal" onclick="updateRow('<%=id%>')">
                                        <span class='glyphicon glyphicon-refresh'></span>
                                    </button>
                                    <button id="<%=id%>" class='btn btn-danger btn-xs delete' type='button'>
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
            <script src="js/main.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/bootstrap-datepicker.js"></script>
            <script>
                                            $(function () {
                                                $('.datepicker').datepicker();
                                            });
            </script>
            <script>
                $("#menu-toggle").click(function (e) {
                    e.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                });
            </script>
    </body>
</html>