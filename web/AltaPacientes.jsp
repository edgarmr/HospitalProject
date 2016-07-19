<%-- 
    Document   : AltaPacientes
    Created on : 15/07/2016, 08:16:16 AM
    Author     : Edgar
--%>

<%@page import="Model.Classes.Paciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
    <link href="css/simple-sidebar.css" rel="stylesheet">
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
                    <a href="Menu.jsp" cl><span class="glyphicon glyphicon-home"  aria-hidden="true"></span> Inicio </a>
                </li>
                <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-user"  aria-hidden="true"></span>  
                        Registro de Usuarios <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="AltaUsuarios.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                             <li><a href="ConsultarUsuario"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                 
                 <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-tags"  aria-hidden="true"></span>  
                         Registro de Productos <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="AltaProductos.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span></a></li>
                             <li><a href="ConsultarProducto"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                 
                  <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-th-list"  aria-hidden="true"></span>  
                        Registro de Pacientes <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="AltaPacientes.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                             <li><a href="ConsultarPaciente"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                <li class="dropdown">
                   <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button">
                        <span class="glyphicon glyphicon-list-alt"  aria-hidden="true"></span>  
                        Cotizaciones <span class="caret"></span>
                   </a>
                    <ul class="dropdown-menu">
                             <li><a href="AltaCotizaciones.jsp"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
                             <li><a href="ConsultarVenta"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"> Modificaciones </span> </a></li>                             
                    </ul>
                </li>
                
                <li>
                    <a href="Logout"><span class="glyphicon glyphicon-log-out"  aria-hidden="true"></span>  Cerrar Sesi&oacute;n </a>
                </li>
                
            </ul>
            

            
        </div> <!-- Fin Div de Barra Lateral-->
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
           <br>
            <div class="container-fluid">
               
               <a href="#menu-toggle" id="menu-toggle">
                <input type="image" src="img/flecha.png">
               </a>             
              
              <br><br>
              
              <form role="form" action="RegistrarPaciente" method="post">
              
               <fieldset>
               <legend> Alta de Pacientes</legend>
                              
               
               <div class="row">                                                                                               
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Nombre </label>
                    <input type="text" class="form-control" name="nombre"  placeholder="Introduce tu Nombre">
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Apellido Paterno</label>
                        <input type="text" class="form-control" name="apellidop"  placeholder="Introduce tu Apellido Paterno">
                   </div>                       
                </div>
                
                <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label >Apellido Materno</label>
                        <input type="text" class="form-control" name="apellidom"  placeholder="Introduce tu Apellido Materno">
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                                <label >Fecha de Nacimiento </label>
                                <input type="text" class="form-control datepicker" name="fechaNac" placeholder="Elige la fecha en que naciste">
                          </div>                       
                </div>
                
               <div class="row">                                                                                   
                          
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Telefono</label>
                        <input type="text" class="form-control" name="telefono"
                                   placeholder="Introduce tu numero de telefono">
                          </div>                     
                </div>
            

                <div class="row">                                                                                   
                          
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Direccion </label>
                                <input type="text" class="form-control" name="direccion"
                                   placeholder="Calle / Numero / Colonia">
                          </div>                
                          <div class="form-group col-md-6 col-lg-6">
                            <label >Correo</label>
                                <input type="text" class="form-control" name="correo"
                                           placeholder="Introduce Correo Electronico">
                           </div>   
                </div>
                
               
            <div class="row">
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Estado </label>
                                <select name="estado" class="form-control">
                                    <option >--- ---</option>
                                    <option >Aguascalientes</option>
                                    <option >Baja California</option>
                                    <option >Baja California Sur</option>
                                    <option >Campeche</option>
                                    <option >Coahuila de Zaragoza</option>
                                    <option >Colima</option>
                                    <option >Chiapas</option>
                                    <option >Chihuahua</option>
                                    <option >Distrito Federal</option>
                                    <option >Durango</option>
                                    <option >Guanajuato</option>
                                    <option >Guerrero</option>
                                    <option >Hidalgo</option>
                                    <option >Jalisco</option>
                                    <option >México</option>
                                    <option >Michoacán de Ocampo</option>
                                    <option >Morelos</option>
                                    <option >Nayarit</option>
                                    <option >Nuevo León</option>
                                    <option >Oaxaca</option>
                                    <option >Puebla</option>
                                    <option >Querétaro</option>
                                    <option >Quintana Roo</option>
                                    <option >San Luis Potosí</option>
                                    <option >Sinaloa</option>
                                    <option >Sonora</option>
                                    <option >Tabasco</option>
                                    <option >Tamaulipas</option>
                                    <option >Tlaxcala</option>
                                    <option >Veracruz de Ignacio de la Llave</option>
                                    <option >Yucatán</option>
                                    <option >Zacatecas</option>
                                </select>
                          </div>                                                                                   
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Municipio </label>
                                <select name="municipio" class="form-control">
                                    <option >--- ---</option>
                                    <option >Abasolo</option>
                                    <option >Acambaro</option>
                                    <option >San Miguel de Allende</option>
                                    <option >Apaseo el Alto</option>
                                    <option >Apaseo el Grande</option>
                                    <option >Atarjea</option>
                                    <option >Celaya</option>
                                    <option >Manuel Doblado</option>
                                    <option >Comonfort</option>
                                    <option >Coroneo</option>
                                    <option >Cortazar</option>
                                    <option >Cueramaro</option>
                                    <option >Doctor Mora</option>
                                    <option >Dolores Hidalgo Cuna de la Independencia Nacional</option>
                                    <option >Guanajuato</option>
                                    <option >Huanimaro</option>
                                    <option >Irapuato</option>
                                    <option >Jaral del Progreso</option>
                                    <option >Jerecuaro</option>
                                    <option >Leon</option>
                                    <option >Moroleon</option>
                                    <option >Ocampo</option>
                                    <option >Penjamo</option>
                                    <option >Pueblo Nuevo</option>
                                    <option >Purisima del Rincon</option>
                                    <option >Romita</option>
                                    <option >Salamanca</option>
                                    <option >Salvatierra</option>
                                    <option >San Diego de la Union</option>
                                    <option >San Felipe</option>
                                    <option >San Francisco del Rincon</option>
                                    <option >San Jose Iturbide</option>
                                    <option >San Luis de la Paz</option>
                                    <option >Santa Catarina</option>
                                    <option >Santa Cruz de Juventino Rosas</option>
                                    <option >Santiago Maravatio</option>
                                    <option >Silao</option>
                                    <option >Tarandacuao</option>
                                    <option >Tarimoro</option>
                                    <option >Tierra Blanca</option>
                                    <option >Uriangato</option>
                                    <option >Valle de Santiago</option>
                                    <option >Victoria</option>
                                    <option >Villagran</option>
                                    <option >Xichu</option>
                                    <option >Yuriria</option>
                                </select>
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
                        <input type="radio" name="diabetes" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>HAS</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="has" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="has" value="no" checked>No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Cancer</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="cancer" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="cancer" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Cardiopat&iacute;as</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="cardiopatia" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="cardiopatia" value="no" checked>No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Enfermedades Renales</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="enf_renales" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="enf_renales" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Tiroides</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="tiroides" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="tiroides" value="no" checked>No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Enfermedades Autoinmunes</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="enf_autoinmunes" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="enf_autoinmunes" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Embolias</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="embolias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="embolias" value="no" checked>No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Musculo-Esqueleticas</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="musculoesqueleticas" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="musculoesqueleticas" value="no" checked>No</label>
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
                        <input type="radio" name="cirugias" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Fracturas</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="fracturas" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="fracturas" value="no" checked>No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Transfusiones</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="transfusiones" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="transfusiones" value="no" checked>No</label>
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
                        <input type="radio" name="tabaquismo" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Alergias / Uso de Anticoagulantes</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="alergias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="alergias" value="no" checked>No</label>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Toxicoman&iacute;as</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="toxicomanias" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="toxicomanias" value="no" checked>No</label>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                   <label>Alcoholismo</label><br>
                        <label class="radio-inline">
                        <input type="radio" name="alcoholismo" value="si">Si</label>
                        <label class="radio-inline">
                        <input type="radio" name="alcoholismo" value="no" checked>No</label>
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
                        <input type="text" name="enf_cro" class="form-control">
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
    
    <script src="js/jquery-2.2.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script src="js/bootstrap-datepicker.js"></script>
    
    <script>
    $(function(){
        $('.datepicker').datepicker() ;
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
