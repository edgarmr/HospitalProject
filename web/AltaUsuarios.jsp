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
        <script type="text/javascript">
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
            $(document).ready(function () {
                $("#send").click(function () {
                    var name = document.getElementById("name").value;
                    var apeP = document.getElementById("apeP").value;
                    var apeM = document.getElementById("apeM").value;
                    var user = document.getElementById("user").value;
                    var contra = document.getElementById("pass").value;
                    var rol = document.getElementById("rol").value;
                    var codif = btoa(contra);
                    $.post('RegistrarUsuario', {nname: name, napeP: apeP, napeM: apeM, nuser: user, ncodif: codif, nrol: rol});
                }
                );
            }
            );
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
                <div class="container-fluid">
                    <a href="#menu-toggle" id="menu-toggle">
                        <button type="button" class="btn btn-danger">Abrir/Cerrar Menu</button>
                    </a>
                    <br><br>
                    <fieldset>
                        <legend>Alta de Usuarios</legend>
                        <form role="form"  method="post">
                            <div class="row">                                                                                               
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Nombre </label>
                                    <input id="name" type="text" class="form-control" name="nombre" placeholder="Nombre(s)">
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Apellido Paterno</label>
                                    <input id="apeP" type="text" class="form-control" name="apeP"
                                           placeholder="Apellido Paterno">
                                </div>                       
                            </div>
                            <div class="row">                                                                                               
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Apellido Materno</label>
                                    <input id="apeM" type="text" class="form-control" name="apeM"
                                           placeholder="Apellido Materno">
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Nombre de usuario</label>
                                    <input id="user" type="text" class="form-control" name="user"
                                           placeholder="Username" required>
                                </div>                       
                            </div>
                            <div class="row">                                                                                   
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Contraseña </label>
                                    <input id="pass" type="password" class="form-control" name="password"
                                           placeholder="Introduce tu contraseña" required>
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Rol </label>
                                    <select id="rol" class="form-control" name="rol" required>
                                        <option>---</option>
                                        <option value="Administrador">Administrador</option>
                                        <option value="Recepcionista">Recepcionista</option>
                                    </select>
                                </div>                       
                            </div>                                                                                                                                             
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <button id="send" name="enviar" type="submit" class="btn btn-success">Enviar</button>
                                    <button type="reset" class="btn btn-primary">Limpiar</button>
                                </div>                        
                            </div>
                        </form>
                    </fieldset>      
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