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
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Menú - Hospital México</title>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <script>
            function myFunction(page){
                $("#page-content-wrapper").load(page);
            }
        </script>
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
                            <li><a onclick="myFunction('AltaUsuarios.jsp')"> <span class="glyphicon glyphicon-plus" aria-hidden="true">Altas</span></a></li>
                            <li><a onclick="myFunction('ConsultarUsuario')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true">Consultas</span> </a></li>                             
                        </ul>
                    </li>
                    <%}%>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <span class="glyphicon glyphicon-tags"  aria-hidden="true"></span>  
                            Productos <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a onclick="myFunction('AltaProductos.jsp')"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                            <li><a onclick="myFunction('ConsultarProducto')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Consultas </span> </a></li>                             
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
                            <li><a href=""> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">No&nbsp;Patológicos</span></a></li>
                            <li><a href=""> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">Crónicas</span> </a></li>                             
                        </ul>
                    </li>
                    <li>
                        <a href="Logout"><span class="glyphicon glyphicon-log-out"  aria-hidden="true"></span>Cerrar Sesión</a>
                    </li>
                </ul>
            </div> 
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">                        
                            <a href="#menu-toggle" id="menu-toggle">
                                <button type="button"><img src="img/izquierda.jpg"></button>
                            </a>
                            <h1>Bienvenido <%=rol%></h1>
                            <p>Ahora que te has logueado correctamente a nuestro sistema, podrás ver y
                                controlar los datos del hospital, por lo que te pedimos que manejes los
                                datos con responsabilidad, y respeto ya que es información altamente importante.</p>
                                <br><br>
                            <h2>Estas son tus funciones:</h2>
                            <br>    
                            <div class="container-fluid">
                                <div class="row">
                                    <%if (rol.equals("Administrador")) {%>
                                    <div class="col-xs-12 col-sm-6 col-md-3">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Personal</div>
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
                                            <div class="panel-heading">Pacientes</div>
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
                                            <div class="panel-heading">Expedientes Clínicos</div>
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
                                            <div class="panel-heading">Antecedentes</div>
                                            <div class="panel-body">
                                                <p>Aquí podrás realizar modificaciones en los registros de antecedentes clínicos de los pacientes: </p>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-2.2.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>