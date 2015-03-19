var zombie = require('zombie')
  , HTML5  = require('html5')
  , should = require('should')
  , server = require('../../server');

exports.World = function(){
  this.browser = new zombie.Browser({runScripts:true, debug:false, htmlParser: HTML5});

  this.page = function(path){
   return "http://localhost:" + server.app.address().port + path
  };

  this.visit = function(path, callback){
    this.browser.visit( this.page(path), function(err, browser, status){
      callback(err, browser, status);
    });
  };
};