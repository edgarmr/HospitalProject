<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String rol = sesion.getAttribute("rolSesion").toString();
%>
<!DOCTYPE html>
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
            <div id="page-content-wrapper">

                <div class="container-fluid">
                    <a href="#menu-toggle" id="menu-toggle">
                        <input type="image" src="img/flecha.png">
                    </a>
                    <br><br>
                    <legend>Alta de Productos</legend>
                    <form role="form" action="RegistrarProducto" method="post">
                        <fieldset>
                            <div class="row">
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Nombre</label>
                                    <input type="text" class="form-control" name="nombrep" placeholder="Introduce el nombre del producto">
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Descripción </label>
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
                                    <input type="number" step="any" class="form-control" name="costop" placeholder="Introduce Costo del Producto">
                                </div>                       
                            </div>
                            <div class="row">                                                                                               
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Precio </label>
                                    <input type="number" step="any" class="form-control" name="preciop" placeholder="Introduce el Precio">
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
                                        <option>---</option>
                                        <option value="Servicio">Servicio</option>
                                        <option value="Producto">Producto</option>
                                        <option value="Insumo">Insumo</option>
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
                    </form>
                </div>
            </div>
        </div>
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