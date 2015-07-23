jasmine: {
        components: {
          src: [
          'components/*js'
          ],
          options: {
            specs: 'tests/spec/*Spec.js',
            keepRunner : true,
            //helpers: 'test/spec/*.js'
          }
        },
        grunt.registerTask('travis', [
        'jshint','jasmine'
    ]);
}