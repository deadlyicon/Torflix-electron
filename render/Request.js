var jQuery = require('../bower_components/jquery/dist/jquery')
var Promise = require('promise')

export function Request(options){
  return new Promise(function(resolve, reject){
    jQuery.ajax(options).complete(function(jqXhr){
      jqXhr.status < 400 ? resolve(jqXhr) : reject(jqXhr);
    });
  });
}
