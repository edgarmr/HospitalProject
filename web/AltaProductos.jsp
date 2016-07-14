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
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar.css" rel="stylesheet">
    </head>
    <body>
        <!-- <div id="wrapper">-->
        <div id="page-content-wrapper">
            <br>
            <div class="container-fluid">
                <a href="#menu-toggle" id="menu-toggle">
                    <button type="button" class="btn btn-danger">Abrir/Cerrar Menú</button>
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
                                    <option>---</option>
                                    <option value="1">Servicio</option>
                                    <option value="2">Producto</option>
                                    <option value="3">Insumo</option>
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
        <!--</div>-->
        <script src="js/jquery-2.2.2.min.js"></script>
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
