/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Task configuration.
     jasmine: {
      components: {
        src: [
        'components/*js'
        ],
        options: {
          specs: 'spec/*Spec.js',
          keepRunner : true,
          //helpers: 'test/spec/*.js'
        }
      }
    }

  });
  // Default task.
  grunt.registerTask('default', ['jasmine']);

};
