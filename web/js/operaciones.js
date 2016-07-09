//validacion Login
 $( document ).ready(function() {
    
  $('#enviar').click(function(){
      var user = $('.correo').val();
      var pass = $('.password').val();
   
      if(user != '' && pass != ''){
 
       $.ajax({
          url: '../controlador/login.php',
          method: 'POST',
          data: {correo: user, clave: pass},
          success: function(msg){

           if(msg=='1'){

          $('#mensaje').html('Datos incorrectos');
        }else{

          window.location = msg;
        }
      }

        });
    
      }else{
         $('#mensaje').html('Ingrese los datos');
      }
  });

});

//Registro de usuario

$( document ).ready(function() {
    
  $('#enviar').click(function(){
      
      var nombre = $('#nombre').val();
      var apellido = $('#apellido').val();
      var correo = $('#correo').val();
      var pass = $('#pass').val();
      var rol = $('#rol').val();
      var sexo = $('#sexo').val();
   
      if(nombre != '' && apellido != '' && correo != '' && pass != '' && rol != '' && sexo != ''){
 
       $.ajax({
          url: 'controlador/crear.php',
          method: 'POST',
          data: {nombre: nombre, apellido: apellido, correo: correo, pass: pass, rol: rol, sexo: sexo},
          success: function(msg){

           if(msg=='1'){

          $('#mensaje').html('El usuario ingresado ya existe');
        }else{
             window.location = msg;
        }
      }

        });
    
      }else{
         $('#mensaje').html('Ingrese los datos');
      }
  });

});





















