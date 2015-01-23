/*jshint loopfunc: true */

var expect = require('chai').expect;
var path = require('path');
var fs = require('fs');
var ChildProcess = require('cover-child-process').ChildProcess;
var Blanket = require('cover-child-process').Blanket;
var childProcess = new ChildProcess(new Blanket());
var gruntExec = 'node ' + path.resolve('node_modules/grunt-cli/bin/grunt');
var rimrafSync = require('rimraf').sync;

var execScenario = function(command, scenario, callback) {
  var scenarioDir = __dirname + '/../scenarios/' + scenario;
  childProcess.exec(command, {cwd: scenarioDir}, callback);
};

describe('grunt-mocha-test', function() {
  it('should run tests from the supplied files', function(done) {
    execScenario(gruntExec, 'tests', function(error, stdout, stderr) {
      expect(stdout).to.match(/test1/);
      expect(stdout).to.match(/test2/);
      expect(stdout).to.match(/2 passing/);
      expect(stdout).to.match(/Done, without errors./);
      expect(stderr).to.equal('');
      done();
    });
  });

  it('should report the number of test failures and exit grunt with an error on failed tests', function(done) {
    execScenario(gruntExec, 'testFailure', function(error, stdout, stderr) {
      expect(stdout).to.match(/test/);
      expect(stdout).to.match(/Aborted due to warnings./);
      expect(stdout).to.match(/1 failing/);
      expect(stderr).to.equal('');
      done();
    });
  });
