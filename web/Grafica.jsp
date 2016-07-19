<%-- 
    Document   : Grafica
    Created on : Jul 18, 2016, 8:36:06 PM
    Author     : Daniel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%
        HttpSession sesion = request.getSession();
        String rol = sesion.getAttribute("rolSesion").toString();
    %>
    <html>
        <head>
            <link rel="shortcut icon" href="img/logo.png">
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Gráfica</title>
            <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="css/simple-sidebar.css" rel="stylesheet">
            <script src="js/jquery-2.2.2.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/bootstrap-datepicker.js"></script>
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
                    <div class="row text-center">
                        <img src="img/grafica.png" alt="Grafica">
                    </div>
                </div>
            </div>
            <script>
                $("#menu-toggle").click(function (e) {
                    e.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                });
            </script>
        </body>
    </html>
