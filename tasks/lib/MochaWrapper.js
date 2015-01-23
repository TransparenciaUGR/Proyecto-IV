var domain = require('domain');
var fs = require('fs');
var path = require('path');
var Mocha = require('mocha');

function MochaWrapper(params) {
  
  var cwd = process.cwd();
  var join = path.join;
  var resolve = path.resolve;
  var exists = fs.existsSync;
  module.paths.push(cwd, join(cwd, 'node_modules'));
  if (params.options && params.options.require) {
    var mods = params.options.require instanceof Array ? params.options.require : [params.options.require];
    mods.forEach(function(mod) {
      if (typeof mod === 'string') {
        var abs = exists(mod) || exists(mod + '.js');
        if (abs) {
          mod = resolve(mod);
        }
        require(mod);
      } else if (typeof mod === 'function') {
        mod();
      }
    });
  }

  var mocha = new Mocha(params.options);

  if (params.options.clearRequireCache === true) {
    Object.keys(require.cache).forEach(function (key) {
      delete require.cache[key];
    });
  }

  params.files.forEach(function(file) {
    file.src.forEach(mocha.addFile.bind(mocha));
  });

  this.run = function(callback) {
    try {
     
      if (mocha.files.length) {
        mocha.loadFiles();
      }
      var mochaSuite = mocha.suite;
      var mochaOptions = mocha.options;
      var mochaRunner = new Mocha.Runner(mochaSuite);
      var mochaReporter = new mocha._reporter(mochaRunner, mochaOptions);
      mochaRunner.ignoreLeaks = false !== mochaOptions.ignoreLeaks;
      mochaRunner.asyncOnly = mochaOptions.asyncOnly;
      if (mochaOptions.grep) {
        mochaRunner.grep(mochaOptions.grep, mochaOptions.invert);
      }
      if (mochaOptions.globals) {
        mochaRunner.globals(mochaOptions.globals);
      }
      if (mochaOptions.growl) {
        mocha._growl(mochaRunner, mochaReporter);
      }
      if (mocha.options.colors != null) {
        Mocha.reporters.Base.useColors = mocha.options.colors;
      }

      var runDomain = domain.create();
      runDomain.on('error', mochaRunner.uncaught.bind(mochaRunner));
      runDomain.run(function() {
        mochaRunner.run(function(failureCount) {
          if (mochaReporter.done) {
            mochaReporter.done(failureCount, function(failureCount) {
               callback(null, failureCount);
            });
          } else {
            callback(null, failureCount);
          }
        });
      });
     
    } catch (error) {
     
      callback(error);
    }
  };
}
module.exports = MochaWrapper;
