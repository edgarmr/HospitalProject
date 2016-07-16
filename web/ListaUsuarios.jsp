<%-- 
    Document   : ListaUsuarios
    Created on : Jul 13, 2016, 8:20:23 PM
    Author     : Daniel
--%>
<%@page import="Model.Classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%  Usuario[] listUsr = (Usuario[]) request.getAttribute("listaUsr");
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
        <link href="css/sweetalert.css" rel="stylesheet">
        <script src="js/sweetalert.min.js"></script>
        <script type="text/javascript" src="js/usuarios.js"></script>
        <style type="text/css">
            div.modal-header,div.modal-footer{
                background-color: #E74C3C;
                color: #FDFEFE;
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
                <a href="#menu-toggle" id="menu-toggle">
                    <button type="button" class="btn btn-danger">Abrir/Cerrar Menú</button>
                </a>
                <h1 id="titulo" class="text-center"> Lista de usuarios</h1>
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchUser" placeholder="Búsqueda de usuarios(por nombre, apellidos, etc...)">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover" style="margin-top: 20px;">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellido Paterno</th>
                                    <th>Apellido Materno</th>
                                    <th>Login</th>
                                    <th>Password</th>
                                    <th>Rol</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int id = 0;
                                    if (listUsr != null) {
                                        for (int i = 0; i < listUsr.length; i++) {
                                            id = listUsr[i].getId();
                                %>
                                <tr id="tr<%=id%>">
                                    <td id="nombre<%=id%>"> <%= listUsr[i].getName()%> </td>
                                    <td id="apep<%=id%>"> <%= listUsr[i].getApeP()%> </td>
                                    <td id="apem<%=id%>"> <%= listUsr[i].getApeM()%> </td>
                                    <td id="login<%=id%>"> <%= listUsr[i].getLogin()%> </td>
                                    <td id="pass<%=id%>"> <%= listUsr[i].getPass()%> </td>
                                    <td id="rol<%=id%>"> <%= listUsr[i].getRol()%> </td>
                                    <td>
                                        <button id="<%=id%>" class='btn btn-warning btn-sm update' type='button' data-toggle="modal" data-target="#myModal" onclick="updateRow('<%=id%>')">
                                            <span class='glyphicon glyphicon-refresh'></span>
                                        </button>
                                        <button id="<%=id%>" class='btn btn-danger btn-sm delete' type='button'>
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
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg">        
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3 class="modal-title text-center">Actualización</h3>
                            </div>
                            <div class="modal-body">
                                <form action="ActualizarUsuario" method="post">
                                    <input id="mid" name="id" type="hidden">
                                    <div class="form-group">
                                        <label for="">Nombre</label>
                                        <input type="text" class="form-control" id="mnombre" name="nombre">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Apellido Paterno</label>
                                        <input type="text" class="form-control" id="mapep" name="apep">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Apellido Materno</label>
                                        <input type="text" class="form-control" id="mapem" name="apem">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Login</label>
                                        <input type="text" class="form-control" id="mlogin" name="login">
                                    </div>
                                    <div class="form-group">
                                        <label for="">Rol</label>
                                        <select class="form-control" id="mrol" name="rol">
                                            <option value="Administrador">Administrador</option>
                                            <option value="Recepcionista">Recepcionista</option>
                                        </select>
                                    </div>
                                    <button id="save" type="submit" class="btn btn-success">Enviar</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
        <script>
            $(function () {
                $('.datepicker').datepicker();
            });
        </script>
    </body>
</html>