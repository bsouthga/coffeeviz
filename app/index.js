// Generated by CoffeeScript 1.7.1
var CoffeeVizGenerator, path, yeoman,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

path = require('path');

yeoman = require('yeoman-generator');

module.exports = CoffeeVizGenerator = (function(_super) {
  __extends(CoffeeVizGenerator, _super);

  function CoffeeVizGenerator(args, options, config) {
    yeoman.generators.Base.apply(this, arguments);
    this.on('end', function() {
      return this.installDependencies({
        skipInstall: options['skip-install']
      });
    });
    this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
  }

  CoffeeVizGenerator.prototype.scaffoldFolders = function() {
    this.mkdir("app");
    this.mkdir("app/css");
    this.mkdir("app/lib");
    this.mkdir("app/lib/vendor");
    return this.mkdir("app/src");
  };

  CoffeeVizGenerator.prototype.copyMainFiles = function() {
    this.copy("_index.html", "app/index.html");
    this.copy("_main.coffee", "app/src/main.coffee");
    this.copy("_gruntfile.coffee", "Gruntfile.coffee");
    this.copy("_package.json", "package.json");
    this.copy("_bower.json", "bower.json");
    return this.copy("_main.css", "app/css/main.css");
  };

  return CoffeeVizGenerator;

})(yeoman.generators.Base);
