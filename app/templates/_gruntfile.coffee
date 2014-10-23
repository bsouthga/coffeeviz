module.exports = (grunt) ->
  # Register configuration
  grunt.initConfig
    copy :
      main :
        files : [
          {
            expand: true
            cwd : "bower_components/bootstrap/dist/"
            src: ['**']
            dest: 'app/lib/vendor/bootstrap/'
          },
          {
            expand: true
            cwd : "bower_components/jquery/dist/"
            src: ['**']
            dest: 'app/lib/vendor/jquery/'
          },
          {
            expand: true
            cwd : "bower_components/d3/"
            src: ['*.js']
            dest: 'app/lib/vendor/d3/'
          }
        ]
    uglify:
      options:
        mangle: true
      js:
        files:
          './app/lib/main.min.js' : ['./app/lib/main.js']
    coffee:
      compile:
        options :
          join : true
        files:
          # Concatenate all components and compile
          './app/lib/main.js': [
            #
            # Main Coffeescript file
            #
            './app/src/main.coffee'
          ]
    watch:
      coffee :
        files: [
          './app/src/*.coffee'
        ],
        tasks: ['coffee', 'uglify:js']
      html :
        files : ['./app/index.html']
      css :
        files : ['./app/css/*.css']
      options :
        livereload : true
    browserSync:
      bsFiles:
        src : [
          './app/lib/main.js',
          './app/css/main.css',
          './app/index.html'
        ]
      options:
        watchTask: true
        server:
            baseDir: "./app/"

  libs = [
   'grunt-contrib-uglify'
   'grunt-contrib-watch'
   'grunt-browser-sync'
   'grunt-contrib-coffee'
   'grunt-contrib-copy'
  ]

  grunt.loadNpmTasks(pkg) for pkg in libs

  # Coffee compiling, uglifying and watching in order
  grunt.registerTask 'default', [
    'copy'
    'coffee'
    'uglify:js'
    'browserSync'
    'watch'
  ]

