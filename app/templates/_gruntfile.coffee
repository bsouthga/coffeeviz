#
# Build System for Modeler Project
# Ben Southgate
# 10/07/14
#


module.exports = (grunt) ->
  # Register configuration
  grunt.initConfig
    uglify:
      options:
        mangle: true
      js:
        files:
          './lib/main.min.js' : ['./lib/main.js']
    coffee:
      compile:
        options :
          join : true
        files:
          # Concatenate all components and compile
          './lib/main.js': [
            #
            # Main Coffeescript file
            #
            './src/main.coffee'
          ]
    watch:
      coffee :
        files: [
          './src/*.coffee'
        ],
        tasks: ['coffee', 'uglify:js']
      html :
        files : ['./index.html']
      css :
        files : ['./css/*.css']
      options :
        livereload : true
    browserSync:
      bsFiles:
        src : [
          './lib/main.js',
          './css/main.css',
          './index.html'
        ]
      options:
        watchTask: true
        server:
            baseDir: "./"

  libs = [
   'grunt-contrib-uglify'
   'grunt-contrib-watch'
   'grunt-browser-sync'
   'grunt-contrib-coffee'
  ]

  grunt.loadNpmTasks(pkg) for pkg in libs

  # Coffee compiling, uglifying and watching in order
  grunt.registerTask 'default', [
    'coffee',
    'uglify:js',
    'browserSync',
    'watch'
  ]