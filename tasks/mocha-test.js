'use strict';
 
var MochaWrapper = require('./lib/MochaWrapper');
var fs = require('fs');
var path = require('path');
var hooker = require('hooker');
var mkdirpSync = require('mkdirp').sync;
 
module.exports = function(grunt) {
 
  var capture = function(captureFile, quiet, run, done) {
    var fd;
    if (captureFile) {
      mkdirpSync(path.dirname(captureFile));
      fd = fs.openSync(captureFile, 'w');
    }
    hooker.hook(process.stdout, 'write', {
      pre: function(result) {
        if (fd) {
          fs.writeSync(fd, result);
        }
        if (quiet) {
          return hooker.preempt();
        }
      }
    });
    run(function(error, failureCount) {
      if (fd) {
        fs.closeSync(fd);
      }
      hooker.unhook(process.stdout, 'write');
      done(error, failureCount);
    });
  };
 
  grunt.registerMultiTask('mochaTest', 'Run node unit tests with Mocha', function() {
    var done = this.async();
    var options = this.options();
    var files = this.files;
 
    var params = ['grep', 'ui', 'reporter', 'timeout', 'invert', 'ignoreLeaks', 'growl', 'globals', 'require', 'colors', 'slow'];
 
    params.forEach(function(param) {
      options[param] = grunt.option(param) || options[param];
    });
 
    if (this.filesSrc.length === 0) {
      grunt.log.write('No files to check...');
      grunt.log.ok();
      done(true);
      return;
    }
 
    var uncaughtExceptionHandlers = process.listeners('uncaughtException');
    process.removeAllListeners('uncaughtException');
    var unmanageExceptions = function() {
      uncaughtExceptionHandlers.forEach(
        process.on.bind(process, 'uncaughtException'));
    };
    var restore = function() {
      unmanageExceptions();
    };
 
    capture(options.captureFile, options.quiet, function(complete) {
      var mochaWrapper = new MochaWrapper({
        files: files,
        options: options
      });
      mochaWrapper.run(function(error, failureCount) {
        if (error) {
          grunt.log.error('Mocha exploded!');
          grunt.log.error(error.stack);
          complete(error);
        } else {
          complete(null, failureCount);
        }
      });
    }, function(error, failureCount) {
      restore();
      if (error) {
        done(false);
      } else {
        done(failureCount === 0);
      }
    });
  });
};
