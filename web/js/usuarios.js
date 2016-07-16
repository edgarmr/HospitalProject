$(document).ready(function () {
    (function ($) {
        $("#searchUser").on('keyup', function () {
            var rex = new RegExp($(this).val(), 'i');
            $("tr").hide();
            $("tr").filter(function () {
                return rex.test($(this).text());
            }).show();
        });
    }(jQuery));

    $(document).on('click', '.delete', function () {
        var id = $(this).attr("id");
        swal({
            title: "Seguro de eliminar el registro?",
            text: "No podras recuperar este registro posteriormente",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Si borrar!",
            closeOnConfirm: false
        },
                function () {
                    $.post('BorrarUsuario', {id: id}, function (response) {
                        $("#tr" + id).hide();
                    });
                    swal("Registro eliminado", "", "success");
                }
        );
    });

    $(document).on('click', '.update', function () {
        var id = $(this).attr("id");
        $("#mnombre").val($("#nombre" + id).html());
        $("#mapep").val($("#apep" + id).html());
        $("#mapem").val($("#apem" + id).html());
        $("#mlogin").val($("#login" + id).html());
        $("#mrol").val($("#rol" + id).html());
        $("#mid").val(id);
    });
});