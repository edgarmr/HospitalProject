$(document).ready(function () {
    (function ($) {
        $("#searchProduct").on('keyup', function () {
            var rex = new RegExp($(this).val(), 'i');
            $("tr").hide();
            $("tr").filter(function () {
                return rex.test($(this).text());
            }).show();
        });
    }(jQuery));

    $(document).on('click','.delete',function(){
        var id = $(this).attr("id");
        swal({
            title: "¿Seguro de eliminar el registro?",
            text: "No podras recuperar este registro posteriormente",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "¡Sí borrar!",
            closeOnConfirm: false
        },
        function(){
            $.post('BorrarProducto', {id: id}, function (response) {
                $("#tr"+id).hide();
            });
            swal("Registro eliminado","","success");
        }
        );
    });

    $(document).on('click','.update',function(){
        var id = $(this).attr("id");
        $("#mnombre").val($("#nombre" + id).html());
        $("#mdescrip").val($("#descrip" + id).html());
        $("#mcosto").val($("#costo" + id).html());
        $("#mprecio").val($("#precio" + id).html());
        $("#mprove").val($("#prove" + id).html());
        $("#mexist").val(parseInt($("#exist" + id).html()));
        $("#mtipo").val($("#tipo" + id).html());
        $("#munidad").val($("#unidad" + id).html());
        $("#mid").val(id);
    });
});


