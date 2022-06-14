// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require('jquery')

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// $(document).on('turbolinks:load', function() {
//  $(document).on('change', '#category', function() {
//   let categoryVal = $('#category').val();
//   if (categoryVal !== "") {
//   let selectedTemplate = $(`#sub-category-of-category${categoryVal}`);
//   $('#category').after(selectedTemplate.html());
//   };
//  });
// });