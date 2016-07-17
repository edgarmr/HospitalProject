<%-- 
    Document   : AltaPacientes
    Created on : 15/07/2016, 08:16:16 AM
    Author     : Edgar
--%>

<%@page import="Model.Classes.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Paciente paciente = (Paciente) request.getAttribute("paciente"); %>
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
    <link href="css/sweetalert.css" rel="stylesheet">
    <script src="js/sweetalert.min.js"></script>

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
                             <li><a href="#"> <span class="glyphicon glyphicon-plus" aria-hidden="true"> Altas </span> </a></li>
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
              <% if(paciente != null){ %>
              <h1 class="text-center text-info">¡Expediente de <%= paciente.getNombre()+" "+paciente.getApPaterno() %>!</h1>
              <form role="form" action="ActualizarPaciente" method="post">
              
               <fieldset>
               <legend> Datos personales</legend>
                              
               
               <div class="row">                                                                                               
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Nombre </label>
                        <input type="text" class="form-control" name="nombre" value="<%=paciente.getNombre()%>" placeholder="Introduce tu Nombre" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                    <label >Apellido Paterno</label>
                        <input type="text" class="form-control" name="apellidop" value="<%=paciente.getApPaterno()%>" placeholder="Introduce tu Apellido Paterno" readonly>
                   </div>                       
                </div>
                
                <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label >Apellido Materno</label>
                        <input type="text" class="form-control" name="apellidom" value="<%=paciente.getApMaterno()%>" placeholder="Introduce tu Apellido Materno" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                                <label >Fecha de Nacimiento </label>
                                <input type="text" class="form-control datepicker" name="fechaNac" value="<%=paciente.getFechNac()%>" placeholder="Elige la fecha en que naciste" readonly>
                          </div>                       
                </div>
                
               <div class="row">                                                                                   
                          
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Telefono</label>
                        <input type="text" class="form-control" name="telefono" value="<%=paciente.getTelefono()%>" placeholder="Introduce tu numero de telefono" readonly>
                          </div>                     
                </div>
            

                <div class="row">                                                                                   
                          
                          <div class="form-group col-md-6 col-lg-6">
                                <label >Direccion </label>
                                <input type="text" class="form-control" name="direccion" value="<%=paciente.getDireccion()%>" placeholder="Calle / Numero / Colonia" readonly>
                          </div>                
                          <div class="form-group col-md-6 col-lg-6">
                            <label >Correo</label>
                                <input type="text" class="form-control" name="correo" value="<%=paciente.getCorreo()%>" placeholder="Introduce Correo Electronico" readonly>
                           </div>   
                </div>
                
               
            <div class="row">
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Estado </label>
                                <select  id="jmr_contacto_estado" class="form-control" name="estado" readonly>
                                    <option> <%=paciente.getEstado()%> </option>
                                </select>
                          </div>                                                                                   
                          <div class="form-group col-md-6 col-lg-6">
                                <label>Municipio </label>
                                <select  id="jmr_contacto_municipio" class="form-control" name="municipio" readonly>
                                    <option><%=paciente.getMunicipio()%></option>
                                </select>
                          </div>                       
                </div>                                                                
    </fieldset>
    <br><br>
     <fieldset>
            <legend>Antecedentes Hereditarios </legend>
                             
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6" class="form-control">
                        <label>Diabetes</label><br>
                        <input type="text" name="diabetes" value="<%= paciente.getDiabetes() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>HAS</label><br>
                        <input type="text" name="has" value="<%= paciente.getHas() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Cancer</label><br>
                        <input type="text" name="cancer" value="<%= paciente.getCancer() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Cardiopat&iacute;as</label><br>
                        <input type="text" name="cardiopatia" value="<%= paciente.getCardiopatias() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Enfermedades Renales</label><br>
                        <input type="text" name="enf_renales" value="<%= paciente.getRenales() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Tiroides</label><br>
                        <input type="text" name="tiroides" value="<%= paciente.getTiroides() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Enfermedades Autoinmunes</label><br>
                        <input type="text" name="enf_autoinmunes" value="<%= paciente.getAutoinmunes() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Embolias</label><br>
                        <input type="text" name="embolias" value="<%= paciente.getEmbolias() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Musculo-Esqueleticas</label><br>
                        <input type="text" name="musculoesqueleticas" value="<%= paciente.getMuscEsq() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Otras</label><br>
                        <input type="text" name="otras" class="form-control" value="<%= paciente.getOtros() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>                                                          
          
    </fieldset>
    <br><br>
    <fieldset>
               <legend>Antecedentes Patol&oacute;gicos</legend>                              
                               
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Cirug&iacute;as</label><br>
                        <input type="text" name="cirugias" value="<%= paciente.getCirujias() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Fracturas</label><br>
                        <input type="text" name="fracturas" value="<%= paciente.getFract() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Transfusiones</label><br>
                        <input type="text" name="transfusiones" value="<%= paciente.getTransfu() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>           
            </div>            
    </fieldset>
    <br><br>
    <fieldset>
           <legend>Antecedentes No Patol&oacute;gicos</legend>

            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Tabaquismo</label><br>
                        <input type="text" name="tabaquismo" value="<%= paciente.getTabaqu() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                        <label>Alergias</label><br>
                        <input type="text" name="alergias" value="<%= paciente.getAlergias() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>
                                                         
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                        <label>Toxicoman&iacute;as</label><br>
                        <input type="text" name="toxicomanias" value="<%= paciente.getTaxicom() %>" placeholder="Si/No" class="form-control" readonly> 
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                   <label>Alcoholismo</label><br>
                        <input type="text" name="alcoholismo" value="<%= paciente.getAlcohol() %>" placeholder="Si/No" class="form-control" readonly>
                   </div>
                                   
            </div>             
               
    </fieldset>
    <br><br>
    <fieldset>
               <legend>Enfermedades Cr&oacute;nicas</legend>
               
               <div class="row">                   
                   <div class="form-group col-md-6 col-lg-6">
                   <label>A&ntilde;o DX</label><br>
                        <select class="form-control" name="aniodx" readonly>
                                    <option value="1">1940</option>
                                    <option value="2">1941</option>
                                    <option value="3">1942</option>
                                    <option value="4">1943</option>
                                </select>
                   </div>
                   <div class="form-group col-md-6 col-lg-6">
                       <label>Enfermedad</label><br>
                        <input type="text" name="enf_cro" class="form-control" value="<%= paciente.getNombreEnfCro() %>" readonly>
                   </div>                       
                </div>
                
            <div class="row">                                                                                               
                    <div class="form-group col-md-6 col-lg-6">
                    <label>Tratamiento Actual</label><br> 
                    <input type="text" name="tratamiento" class="form-control" value="<%=paciente.getTratamiento()%>" readonly>
                   </div>                      
            </div>
                                                          
               <div class="row" >
                    <div class="form-group col-lg-6">
                        <button id="enable" type="button" class="btn btn-info">
                            <span style="font-size: 2em;" class="glyphicon glyphicon-edit"> </span>
                        </button>
                        <button id="update" type="submit" class="btn btn-success">
                            <span style="font-size: 2em;" class="glyphicon glyphicon-floppy-save"> </span>
                        </button>
                        <button id="delete" type="button" class="btn btn-danger">
                            <span style="font-size: 2em;" class="glyphicon glyphicon-trash"> </span>
                        </button>
                        <input id="key" name="id" type="hidden" value="<%= paciente.getPaciente_id() %>">
                    </div>
                   
               </div>          
               
    </fieldset>
    <br><br><br>
    </form>
    <% } %>
    </div> <!-- Div class container-fluid -->
            
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    
    <script src="js/jquery-2.2.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    
    <script> 
        $(document).ready(function(){
            
            $("#enable").on('click',function(){
                $("input[type='text'], select").attr('readonly',false);
            });
            
            $("#delete").on('click',function(){
                swal({
                    title: "¿Seguro de eliminar el registro?",
                    text: "No podras recuperar este registro posteriormente",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "¡Sí, borrar!",
                    closeOnConfirm: false
                },
                    function(){
                        $.post('BorrarPaciente', {id: $("#key").val()},function(data,status){
                            if(status==="success"){
                                window.location = "ConsultarPaciente";
                            }
                            
                        });
                        swal("Registro eliminado","","success");
                });
               
            });
        });
    </script>

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
