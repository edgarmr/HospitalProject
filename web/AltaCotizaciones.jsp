<%-- 
    Document   : AltaCotizaciones
    Created on : Jul 17, 2016, 12:56:41 PM
    Author     : Daniel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Cotizaciones</title>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <script src="js/jquery-2.2.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
    </head>
    <body>
        <%
            Conexion bd = new Conexion();
            Connection conn = bd.Conexion();
        %>
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
                <br>
                <div class="container-fluid">
                    <a href="#menu-toggle" id="menu-toggle">
                        <input type="image" src="img/flecha.png">
                    </a>
                    <br><br>

                    <fieldset>
                        <legend> Cotizaciones </legend>
                        <form role="form" action="RegistrarVenta" method="post">
                            <div class="row">                                                                                               
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Paciente</label>
                                    <select class="form-control" name="paciente">
                                        <option>---</option>
                                        <%
                                            String query = "SELECT * FROM pacientes WHERE pStatus='Activo'";
                                            PreparedStatement pstmt = conn.prepareStatement(query);
                                            ResultSet rs = pstmt.executeQuery();
                                            int i = 0;
                                            int paciente_id;
                                            String nombre;
                                            while (rs.next()) {
                                                paciente_id = rs.getInt(1);
                                                nombre = rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4);
                                        %>
                                        <option value="<%=paciente_id%>"><%=nombre%></option>
                                        <%
                                                i++;
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Lugar de expedición</label>
                                    <select class="form-control" name="lugar">
                                        <option>---</option>
                                        <option value="Leon">León</option>
                                        <option value="Monterrey">Monterrey</option>
                                        <option value="Queretaro">Querétaro</option>
                                        <option value="Ciudad de Mexico">Ciudad de México</option>
                                        <option value="Guadalajara">Guadalajara</option>
                                    </select>
                                </div>                    
                            </div>
                            <div class="row">                                                                                   
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Forma de pago</label>
                                    <select class="form-control" name="pago">
                                        <option>---</option>
                                        <option value="Efectivo">Efectivo</option>
                                        <option value="Cheque">Vales</option>
                                        <option value="Tarjeta de credito">Tarjeta de crédito</option>
                                        <option value="Tarjeta de debito">Tarjeta de débito</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>IVA</label>
                                    <select class="form-control" name="iva">
                                        <option selected value="1.16">16%</option>
                                    </select>
                                </div>                       
                            </div>
                            <div class="row">                                                                                   
                                <div class="form-group col-md-6 col-lg-6">
                                    <label>Producto</label>
                                    <select class="form-control" name="prod">
                                        <option>---</option>
                                        <%
                                            String query2 = "SELECT * FROM productos WHERE proStatus='Activo'";
                                            PreparedStatement pstmt2 = conn.prepareStatement(query2);
                                            ResultSet rs2 = pstmt2.executeQuery();
                                            int j = 0;
                                            int producto_id;
                                            String nombre_prod;
                                            while (rs2.next()) {
                                                producto_id = rs2.getInt(1);
                                                nombre_prod = rs2.getString(2);
                                        %>
                                        <option value="<%=producto_id%>"><%=nombre_prod%></option>
                                        <%
                                                j++;
                                            }
                                            conn.close();
                                        %>
                                    </select>                          
                                </div>
                                <div class="form-group col-md-6 col-lg-6">
                                    <label >Cantidad</label>
                                    <input type="number" class="form-control" name="cant" min="1" max="10" placeholder="Cantidad a comprar">
                                </div>                       
                            </div>
                            <div class="row">                                                                                   
                                <div class="form-group col-md-6 col-lg-6">
                                    <button name="enviar" type="submit" class="btn btn-success">Enviar</button>
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
