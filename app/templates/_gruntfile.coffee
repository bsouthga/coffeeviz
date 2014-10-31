module.exports = (grunt) ->

  #
  # folder to copy distribution files to
  # when running 'grunt deploy'
  #
  deploy_path = '<deploy path>'

  #
  # Full build system steps
  #
  full_build = [
    'coffee'        # 1 : compile coffeescript
    'copy:main'     # 2 : copy vanilla js source to lib
    'uglify:js'     # 3 : uglify urban js files
    'cssmin'        # 4 : uglify urban css files
    'concat'        # 5 : concatenate urban js and css with vendor
    'processhtml'   # 6 : replace development <script> tags with dist
    'htmlmin'       # 7 : minify html
  ]

  # Register configuration
  grunt.initConfig
    copy :
      setup :
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
      main :
        files : [
          # main files to copy
        ]
      deploy :
        files : [
          {
            expand: true
            cwd : "dist/"
            src: ['**']
            dest: deploy_path
          }
        ]
    concat :
      dist :
        files :
          './dist/app.min.js' : [
            "./app/lib/vendor/d3/d3.min.js"
            "./app/lib/vendor/jquery/jquery.min.js"
            "./app/lib/vendor/bootstrap/js/bootstrap.min.js"
            './app/lib/deploy_scripts.min.js'
          ]
          './dist/app.min.css' : [
            "./app/lib/vendor/bootstrap/css/bootstrap.min.css"
            "./app/css/deploy_styles.min.css"
          ]
    uglify:
      options:
        mangle: true
      js:
        files:
          './app/lib/deploy_scripts.min.js' : [
            #scripts for deployment
            './app/lib/main.js'
          ]
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
        tasks : full_build
      html :
        files : ['./app/index.html']
        tasks : full_build
      css :
        files : ['./app/css/main.css']
        tasks : full_build
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
    processhtml :
      dist :
        files :
          './app/index_dist.html' : ['./app/index.html']
    htmlmin :
      dist :
        options :
          collapseWhitespace: true
        files :
          './dist/index.html' : './app/index_dist.html'
    cssmin :
      dist :
        files :
          './app/css/deploy_styles.min.css' : [
            # user css files for deployment
            "./app/css/main.css"
          ]

  libs = [
   'grunt-contrib-uglify'
   'grunt-contrib-watch'
   'grunt-contrib-coffee'
   'grunt-contrib-concat'
   'grunt-contrib-copy'
   'grunt-contrib-htmlmin'
   'grunt-contrib-cssmin'
   'grunt-browser-sync'
   'grunt-processhtml'
  ]

  grunt.loadNpmTasks(pkg) for pkg in libs

  # Coffee compiling, uglifying and watching in order
  grunt.registerTask 'default', [
    'copy:main'
    'coffee'
    'uglify:js'
    'cssmin'
    'concat'
    'processhtml'
    'htmlmin'
    'browserSync'
    'watch'
  ]

  # copy bower dependencies
  grunt.registerTask 'setup', [
    'copy:setup'
  ]

  # deploy distribution code
  grunt.registerTask 'deploy', [
    'copy:deploy'
  ]