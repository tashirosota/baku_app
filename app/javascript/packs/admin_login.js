import $ from 'jquery';

window.jQuery = $;
window.$ = $;
console.log('Hello World from Webpacker')

import '../../../self_node_modules/bootstrap'
import Rails from 'rails-ujs';
Rails.start();

// scss , css
import '../src/admin_login.scss'
import '../../../self_node_modules/bootstrap/scss/bootstrap.scss'


$(document).ready(function () {
    $(document).on("click", ".btn-info", function (e) {
        e.preventDefault();
        //little validation just to check username
        if ($("#username").val() != "") {
            //ajax通信
            $.ajax({
                type: 'POST',
                url: $(this).get(0).action,
                data: $('#login-form').serializeArray(),

            }).fail(function () {
                //失敗時の処置
                $("#output").addClass("alert alert-danger animated fadeInUp").html("通信に失敗しました。");
            }).done(function (data) {
                if (data['authenticate'] == 'false') {
                    $("#output").addClass("alert alert-danger animated fadeInUp").html("名前またはパスワードが間違っています");
                    $("input").css({
                        "height": "0",
                        "padding": "0",
                        "margin": "0",
                        "opacity": "0"
                    });
                    $('button[type="submit"]').html("続ける")
                        .removeClass("btn-info")
                        .addClass("btn-primary")
                }
            });
        } else {
            $("#output").removeClass(' alert alert-success');
            $("#output").addClass("alert alert-danger animated fadeInUp").html("値を入力してください");
        }
    });

    $(document).on("click", ".btn-primary", function (e) {
        $("input").css({
            "height": "auto",
            "padding": "10px",
            "opacity": "1"
        }).val("");
        e.preventDefault();
        $("#output").removeClass("alert alert-danger animated fadeInUp").html("")
        $('button[type="submit"]').html("Login")
            .removeClass("btn-default")
            .addClass("btn-info")
    });
});
