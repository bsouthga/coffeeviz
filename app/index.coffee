path = require 'path'
yeoman = require 'yeoman-generator'

module.exports = class CoffeeVizGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments
    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']
    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'
  scaffoldFolders: ->
      @mkdir "app"
      @mkdir "app/css"
      @mkdir "app/lib"
      @mkdir "app/lib/vendor"
      @mkdir "app/src"
  copyMainFiles: ->
      @copy "_index.html", "app/index.html"
      @copy "_main.coffee", "app/src/main.coffee"
      @copy "_gruntfile.coffee", "Gruntfile.coffee"
      @copy "_package.json", "package.json"
      @copy "_bower.json", "bower.json"
      @copy "_main.css", "app/css/main.css"

