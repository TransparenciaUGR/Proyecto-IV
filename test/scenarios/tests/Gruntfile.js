module.exports = function(grunt) {
  
  grunt.loadTasks('../../../tasks');

  grunt.initConfig({
    mochaTest: {
      options: {
        reporter: 'spec'
      },
      all: {
        src: ['*.js']
      }
    }
  });

  grunt.registerTask('default', ['mochaTest']);
};
