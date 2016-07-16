<%-- 
    Document   : AltaPacientes
    Created on : 15/07/2016, 08:16:16 AM
    Author     : Edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <link rel="shortcut icon" href="img\\logo.png">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Altas de Pacientes</title>
    
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/datepicker.css">

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
                        Bienvenido Administrador !
                    </a>
                </li>
                <li>
                    <a href="" cl><span class="glyphicon glyphicon-home"  aria-hidden="true"></span> Inicio </a>
                </li>
                <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-user"  aria-hidden="true"></span>  
                        Registro de Usuarios <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href=""> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                             <li><a href=""> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                 
                 <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-tags"  aria-hidden="true"></span>  
                         Registro de Productos <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="altasproductos.php"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                             <li><a href=""> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                 
                  <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-th-list"  aria-hidden="true"></span>  
                        Registro de Pacientes <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="altaspacientes.php"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                             <li><a href="#"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-list-alt"  aria-hidden="true"></span>  
                        Cotizaciones <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="altascotizaciones.php"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                             <li><a href="#"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                
                <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-time"  aria-hidden="true"></span>  
                        Antecedentes <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="hereditarios.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">    Hereditarios </span></a></li>
                             <li><a href="patologicos.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">    Patol&oacute;gicos</span> </a></li>
                             <li><a href="nopatologicos.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> No Patol&oacute;gicos</span> </a></li>
                             <li><a href="cronicas.php"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> Cr&oacute;nicas</span> </a></li>                             
                    </ul>
                </li>
                
                <li>
                    <a href="index.php" cl><span class="glyphicon glyphicon-log-out"  aria-hidden="true"></span>  Cerrar Sesi&oacute;n </a>
                </li>
                
                <!-- Boton Cerrar Menu -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                 <a href="#menu-toggle2" id="menu-toggle2"> 
                                     <button type="button" class="btn btn-primary">Cerrar Menu</button> 
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
               
               <input type="image" id="hacky-input" src="img/izquierda.jpg">             
              
              <br><br>
              
              <form role="form" action="atasproductos.php" method="post">
              
               <fieldset>
               <legend> Alta de Pacientes</legend>
                              
               
               <div class="row">                                                                                               
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Nombre </label>
                        <input type="text" class="form-control" name="nombre"
                                   placeholder="Introduce tu Nombre">
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Apellido Paterno</label>
                        <input type="text" class="form-control" name="apellido"
                                   placeholder="Introduce tu Apellido Paterno">
                   </div>                       
                </div>
                
                <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label >Apellido Materno</label>
                        <input type="text" class="form-control" name="apellido"
                                   placeholder="Introduce tu Apellido Materno">
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                                <label >Fecha de Nacimiento </label>
                                <input type="text" class="form-control datepicker" name="date"
                                   placeholder="Elige la fecha en que naciste">
                          </div>                       
                </div>
                
               <div class="row">                                                                                   
                          
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Telefono</label>
                        <input type="text" class="form-control" name="apellido"
                                   placeholder="Introduce tu numero de telefono">
                          </div>
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Telefono de Emergencia</label>
                        <input type="text" class="form-control" name="apellido"
                                   placeholder="Introduce un telefono de Emergencia">
                          </div>                       
                </div>
            

                <div class="row">                                                                                   
                          
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Direccion </label>
                                <input type="text" class="form-control" name="date"
                                   placeholder="Calle / Numero / Colonia">
                          </div>
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Religion </label>
                                <select class="form-control" name="rol">
                                    <option value="1">una</option>
                                    <option value="2">dos</option>
                                    <option value="3">tres</option>
                                    <option value="4">cuatro</option>
                                </select>
                          </div>                       
                </div>
                
               
            <div class="row">
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Estado </label>
                                <select  id="jmr_contacto_estado" class="form-control" name="rol"> 
                                </select>
                          </div>                                                                                   
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Municipio </label>
                                <select  id="jmr_contacto_municipio" class="form-control" name="rol"> 
                                </select>
                          </div>                       
                </div>

                <div class="row">                                                                                               
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Recomendado </label>
                        <input type="text" class="form-control" name="nombre"
                                   placeholder="Si/No">
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Correo</label>
                        <input type="text" class="form-control" name="apellido"
                                   placeholder="Introduce Correo Electronico">
                   </div>                       
                </div>                                                                    
    </fieldset>
    <br><br>
     <fieldset>
            <legend>Antecedentes Hereditarios </legend>
                             
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Diabetes</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="diabetes" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="diabetes" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>HAS</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="has" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="has" value="no">No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Cancer</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="cancer" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="cancer" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Cardiopat&iacute;as</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="cardiopatia" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="cardiopatia" value="no">No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Enfermedades Renales</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="enf_renales" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="enf_renales" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Tiroides</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="tiroides" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="tiroides" value="no">No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Enfermedades Autoinmunes</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="enf_autoinmunes" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="enf_autoinmunes" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Embolias</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="embolias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="embolias" value="no">No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Musculo-Esqueleticas</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="musculoesqueleticas" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="musculoesqueleticas" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Otras</label><br>
                        <input type="text" name="otras" class="form-control">
                   </div>
                                   
            </div>                                                          
          
    </fieldset>
    <br><br>
    <fieldset>
               <legend>Antecedentes Patol&oacute;gicos</legend>                              
                               
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Cirug&iacute;as</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="cirugias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="cirugias" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Fracturas</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="fracturas" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="fracturas" value="no">No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Transfusiones</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="transfusiones" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="transfusiones" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                   </div>
                                   
            </div>            
    </fieldset>
    <br><br>
    <fieldset>
           <legend>Antecedentes No Patol&oacute;gicos</legend>

            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Tabaquismo</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="tabaquismo" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="tabaquismo" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Alergias / Uso de Anticoagulantes</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="alergias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="alergias" value="no">No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Toxicoman&iacute;as</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="toxicomanias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="toxicomanias" value="no">No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                   <label>Alcoholismo</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="alcoholismo" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="alcoholismo" value="no">No</label>
                   </div>
                                   
            </div>             
               
    </fieldset>
    <br><br>
    <fieldset>
               <legend>Enfermedades Cr&oacute;nicas</legend>
               
               <div class="row">                   
                   <div class="form-group col-md-6 col-lg-6">
                   <label>A&ntilde;o DX</label><br>
                        <select class="form-control" name="aniodx">
                                    <option value="1">1940</option>
                                    <option value="2">1941</option>
                                    <option value="3">1942</option>
                                    <option value="4">1943</option>
                                </select>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                       <label>Enfermedad</label><br>
                        <input type="text" name="otras" class="form-control">
                   </div>                       
                </div>
                
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                    <label>Tratamiento Actual</label><br>
                        <input type="text" name="tratamiento" class="form-control">
                   </div>
                   <div class="form-group col-md-6 col-lg-6">                        
                   </div>
                                   
            </div>
                                                          
               <div class="row" >
                         <div class="form-group col-lg-6">
                             <button name="enviar" type="submit" class="btn btn-success">Enviar</button>
                             <button type="reset" class="btn btn-primary">Limpiar</button>
                         </div>                        
               </div>          
               
    </fieldset>
    <br><br><br>
    </form>
    </div> <!-- Div class container-fluid -->
            
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    
    <script src="js/jquery-2.2.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->

    <script src="js/bootstrap-datepicker.js"></script>
    
    <script>
    $(function(){
        $('.datepicker').datepicker() ;
    }); 
    </script>
    

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
    
    <!-- Menu Toggle2 Script 2 -->
    <script>
    $("#menu-toggle2").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
    

</body>

</html>
