module.exports = function(grunt) {
  // Si queremos añadir tareas adicionales:
  grunt.loadTasks('../../../tasks');

  // Config. Proyecto
  grunt.initConfig({
    mochaTest: {
      options: {
        reporter: 'spec',
        timeout: 500
      },
      all: {
        src: ['*.js']
      }
    }
  });

  // Test por defecto
  grunt.registerTask('default', ['mochaTest']);
};
