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
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">                        
                            <a href="#menu-toggle" id="menu-toggle">
                                <button type="button" class="btn btn-danger">Abrir/Cerrar Menú</button>
                            </a>
                            <h1>Bienvenido</h1>
                            <p>Ahora que te has logueado correctamente a nuestro sistema, podras ver y controlar los datos del hospital, por lo que te pedimos que manejes los datos con responsabilidad, y respeto ya que es información altamente importante.
                                <br><br>
                            <h2>Estas son tus funciones:</h2>
                            <br>    
                            <div class="container-fluid">
                                <div class="row">
                                    <%if (rol.equals("Administrador")) {%>
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Control de Personal</div>
                                            <div class="panel-body">
                                                <p>Aquí podrás realizar modificaciones en los registros del personal del hospital: </p>
                                                <ul >
                                                    <li>Altas</li>
                                                    <li>Bajas</li>
                                                    <li>Cambios</li>
                                                </ul>
                                            </div>
                                        </div>             
                                    </div>
                                    <%}%>
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Catálogo de Pacientes</div>
                                            <div class="panel-body">
                                                <p>Aquí podrás realizar modificaciones en los registros de los pacientes del hospital: </p>
                                                <ul >
                                                    <li>Altas</li>
                                                    <li>Bajas</li>
                                                    <li>Cambios</li>
                                                </ul>
                                            </div>
                                        </div>             
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Catálogo de Expedientes Clínicos</div>
                                            <div class="panel-body">
                                                <p>Aquí podrás realizar modificaciones en los registros de expedientes clínicos de los pacientes: </p>
                                                <ul >
                                                    <li>Altas</li>
                                                    <li>Bajas</li>
                                                    <li>Cambios</li>
                                                </ul>
                                            </div>
                                        </div>             
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Catálogo de Antecedentes</div>
                                            <div class="panel-body">
                                                <p>Aquí podrás hacer las siguientes modificaciones en los registros de antecedentes clínicos de los pacientes: </p>
                                                <ul>
                                                    <li>Hereditarios</li>
                                                    <li>Patológicos</li>
                                                    <li>No Patológicos</li>
                                                    <li>Crónicas</li>
                                                </ul>
                                            </div>
                                        </div>             
                                    </div>
                                </div>
                            </div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- jQuery -->
        <script src="js/jquery-2.2.2.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
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