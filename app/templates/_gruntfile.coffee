module.exports = (grunt) ->
 
  grunt.registerTask 'default', ['browserSync', 'watch', 'coffee']
 
  grunt.initConfig
    coffee:
      compile:
        files: 
          'main.js' : 'main.coffee'
    watch:
      js: 
        files: ['./app/*']
        tasks: ['coffee']
        options: 
          livereload: true
    browserSync:
      bsFiles:
        src : './app/*'
      options: 
        watchTask : 
          true
        server: 
          baseDir: "./app/"
            
 
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-browser-sync'
