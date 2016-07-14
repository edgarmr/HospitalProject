<%-- 
    Document   : AltaUsuarios
    Created on : Jul 13, 2016, 7:36:13 PM
    Author     : Daniel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="img/logo.png">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Menú - Hospital México</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <script type="text/javascript">
            $(document).ready(function () {
                $("#send").click(function () {
                    var name = document.getElementById("name").value;
                    var apeP = document.getElementById("apeP").value;
                    var apeM = document.getElementById("apeM").value;
                    var user = document.getElementById("user").value;
                    var contra = document.getElementById("pass").value;
                    var rol = document.getElementById("rol").value;
                    var codif = btoa(contra);
                    //alert(name+" "+apeP+" "+apeM+" "+user+" "+contra+" "+rol+" "+codif);
                    $.post('RegistrarUsuario', {nname: name, napeP: apeP, napeM: apeM, nuser: user, ncodif: codif, nrol: rol});//, function (responsetext) {
                    //$("#response").text(responsetext);
                    //var text = $("#response").text();
                    //if (text === "Correcto") {
                    //    window.location = "Menu.jsp";
                    //}
                }
                );
            }
            );
        </script>
    </head>
    <body>
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
                                <label >Nombre </label>
                                <input id="name" type="text" class="form-control" name="nombre" placeholder="Nombre(s)">
                            </div>
                            <div class="form-group col-md-6 col-lg-6">
                                <label >Apellido Paterno</label>
                                <input id="apeP" type="text" class="form-control" name="apeP"
                                       placeholder="Apellido Paterno">
                            </div>                       
                        </div>
                        <div class="row">                                                                                               
                            <div class="form-group col-md-6 col-lg-6">
                                <label >Apellido Materno</label>
                                <input id="apeM" type="text" class="form-control" name="apeM"
                                       placeholder="Apellido Materno">
                            </div>
                            <div class="form-group col-md-6 col-lg-6">
                                <label >Nombre de usuario</label>
                                <input id="user" type="text" class="form-control" name="user"
                                       placeholder="Username" required>
                            </div>                       
                        </div>
                        <div class="row">                                                                                   
                            <div class="form-group col-md-6 col-lg-6">
                                <label >Contraseña </label>
                                <input id="pass" type="password" class="form-control" name="password"
                                       placeholder="Introduce tu contraseña" required>
                            </div>
                            <div class="form-group col-md-6 col-lg-6">
                                <label >Rol </label>
                                <select id="rol" class="form-control" name="rol" required>
                                    <option>---</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Recepcionista">Recepcionista</option>
                                </select>
                            </div>                       
                        </div>                                                                                                                                             
                        <div class="row" >
                            <div class="form-group col-lg-6">
                                <button id="send" name="enviar" type="submit" class="btn btn-success">Enviar</button>
                                <button type="reset" class="btn btn-primary">Limpiar</button>
                            </div>                        
                        </div>
                    </form>
                </fieldset>      
            </div>
        </div>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>

    </body>

</html>

