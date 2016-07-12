<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="img\\logo.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Menú - Hospital México</title>
        <!-- Bootstrap Core CSS -->
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
    </head>
    <body>
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a>
                            <%
                                HttpSession sesion = request.getSession(true);
                                String rol = sesion.getAttribute("rolSesion").toString();
                            %>
                            Bienvenido <%=rol%>
                        </a>
                    </li>
                    <li>
                        <a href="Menu.jsp" cl><span class="glyphicon glyphicon-home"  aria-hidden="true"></span> Inicio </a>
                    </li>
                    <%if (rol.equals("Administrador")) {%>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-user"  aria-hidden="true"></span>  
                            Usuarios <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href=""> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
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
                            <li><a href=""> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-list-alt"  aria-hidden="true"></span>  
                            Cotizaciones <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href=""> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-time"  aria-hidden="true"></span>  
                            Antecedentes <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href=""> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">Hereditarios </span></a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">Patológicos</span> </a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> No Patológicos</span> </a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> Crónicas</span> </a></li>                             
                        </ul>
                    </li>
                    <li>
                        <a href="Logout"><span class="glyphicon glyphicon-log-out"  aria-hidden="true"></span>Cerrar Sesión</a>
                    </li>
                    <!-- Boton Cerrar Menu -->
                    <div id="page-content-wrapper">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <a href="#menu-toggle2" id="menu-toggle2"> 
                                        <button type="button" class="btn btn-primary">Cerrar Menú</button> 
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
                <br>
                <div class="container-fluid">
                    <a href="#menu-toggle" id="menu-toggle">
                        <button type="button" class="btn btn-danger">Abrir/Cerrar Menu</button>
                    </a>
                    <br><br>


                    <legend> Alta de Productos</legend>

                    <form role="form" action="RegistrarProducto" method="post">
                        <fieldset>
                            <div class="row">
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Nombre</label>
                                    <input type="text" class="form-control" name="nombrep" placeholder="Introduce el nombre del producto">
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Descripcion </label>
                                    <input type="text" class="form-control" name="descrip" placeholder="Introduce una Descripcion">
                                </div>
                            </div>
                            <div class="row">                                                                                               
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Proveedor</label>
                                    <input type="text" class="form-control" name="provedorp" placeholder="Nombre provedor(es)">
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Costo</label>
                                    <input type="text" class="form-control" name="costop" placeholder="Introduce Costo del Producto">
                                </div>                       
                            </div>

                            <div class="row">                                                                                               
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Precio </label>
                                    <input type="text" class="form-control" name="preciop" placeholder="Introduce el Precio">
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Existencia </label>
                                    <input type="text" class="form-control" name="existenciap" placeholder="Existencia del Producto" required>
                                </div>                       
                            </div>

                            <div class="row">                                                                                   

                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Tipo </label>
                                    <select class="form-control" name="tipop">
                                        <option value="1">Punto Venta</option>
                                        <option value="2">Otro</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Unidad </label>
                                    <input type="text" class="form-control" name="unidadp"
                                           placeholder="Unidades">
                                </div>                       
                            </div>                                                                                                                                             
                            <div class="row" >
                                <div class="form-group col-lg-6">
                                    <button name="enviar" type="submit" class="btn btn-success">Enviar</button>
                                    <button type="reset" class="btn btn-primary">Limpiar</button>
                                </div>                        
                            </div>
                        </fieldset> 
                    </form> <!-- Fin Formulario -->  

                </div> <!-- Div class container-fluid -->

            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery-2.2.2.min.js"></script>
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
