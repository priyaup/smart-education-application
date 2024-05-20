// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import "google-map";
import "jquery.min";
import "main";
import "style";

import Rails from '@rails/ujs'

// app/javascript/packs/application.js

import "./app";

Rails.start()