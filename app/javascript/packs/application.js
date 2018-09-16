/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import $ from 'jquery';

window.jQuery = $;
window.$ = $;console.log('Hello World from Webpacker')

import 'bootstrap'
import 'moment/moment'
import 'bootstrap4-datetimepicker/src/js/bootstrap-datetimepicker'
import 'moment/locale/ja'
import Rails from 'rails-ujs';


Rails.start();

// scss , css
import '../src/application.scss'
import 'bootstrap/scss/bootstrap.scss'
import 'font-awesome/scss/font-awesome.scss'
import 'bootstrap4-datetimepicker/src/sass/bootstrap-datetimepicker-build.scss';
import 'bootstrap/dist/css/bootstrap.css'