import $ from 'jquery';

window.jQuery = $;
window.$ = $;console.log('Hello World from Webpacker')

import 'bootstrap'
import Rails from 'rails-ujs';


Rails.start();

// scss , css
import '../src/admin_login.scss'
import 'bootstrap/scss/bootstrap.scss'


$(document).ready(function() {
    $(document).on("click", ".btn-info", function(e){
        e.preventDefault();
        console.log('info')
        //little validation just to check username
        if ($("#username").val() != "") {
            //ajax通信
            $.ajax({
                type: 'POST',
                url: $(this).get(0).action,
                data: $('#login-form').serializeArray()
            }).fail(function(){
                //失敗時の処置
                $("#output").addClass("alert alert-danger animated fadeInUp").html("通信に失敗しました。");
            }).done(function(data){
                $("#output").addClass("alert alert-danger animated fadeInUp").html("メールアドレスまたはパスワードが間違っています");
                $("input").css({
                    "height":"0",
                    "padding":"0",
                    "margin":"0",
                    "opacity":"0"
                });
                $('button[type="submit"]').html("続ける")
                    .removeClass("btn-info")
                    .addClass("btn-primary")
            });
            //change button text


            //show avatar
            $(".avatar").css({
                // "background-image": "url('http://api.randomuser.me/0.3.2/portraits/women/35.jpg')" bakuのアイコン
            });
        } else {
            $("#output").removeClass(' alert alert-success');
            $("#output").addClass("alert alert-danger animated fadeInUp").html("値を入力してください");
        }
    });

    $(document).on("click", ".btn-primary", function(e){
        $("input").css({
            "height":"auto",
            "padding":"10px",
            "opacity":"1"
        }).val("");
        e.preventDefault();
        $("#output").removeClass("alert alert-danger animated fadeInUp").html("")
        $('button[type="submit"]').html("Login")
            .removeClass("btn-default")
            .addClass("btn-info")
    });
});
