module.exports = (grunt) ->
  grunt.initConfig
    jade:
      # Compiles the static HTML
      html:
        files:
          'public': ['src/jade/*.jade']
        options:
          client: false
          pretty: true
    coffee:
      # Compiles the clientside coffeescript and merges it into one javascript file
      client:
        options:
          join: true
          bare: true
        files:
          "public/js/master.js": ["src/coffee/*.coffee"]
    # Compiles the CSS
    stylus:
      compile:
        options:
          'include css': true,
        files: 
          'public/css/index.css': 'src/stylus/index.styl'
    # Compiles images into inline css
    grunticon:
      # Compiles with the icon class
      icons:
        options: 
          src: "src/img/icons/",
          dest: "src/img/icon-css/"
          cssprefix: "icon."
          svgo: true
      # Compiles with the graphics class
      graphics:
        options: 
          src: "src/img/graphics/",
          dest: "src/img/graphic-css/"
          cssprefix: "graphic."
          svgo: true
    concat:
      # Merges inline image CSS into the main CSS file
      dist1:
        src: ['public/css/index.css', 'src/img/icon-css/icons.data.svg.css', 'src/img/graphic-css/icons.data.svg.css']
        dest: 'public/css/index.css'
      # Copies raw plugin javascript from src into public
      dist2:
        src: ['src/plugins.js']
        dest: 'public/js/plugins.js'
    watch:
      # Watch the coffeescript for changes
      coffee:
        files: 'src/coffee/*.coffee',
        tasks: 'coffee'
      # Watch the stylus and image folders for changes
      stylusgrunticon:
        files: ['src/stylus/**', 'src/img/icons/**', 'src/img/graphics/**']
        tasks: ['stylus', 'concat']
    # Start the app and monitor for changes
    nodemon:
      dev:
        options:
          file: 'app.js'
          watchedExtensions: ['jade']
          watchedFolders: ['src']
          legacyWatch: true
    # Start nodemon and watch at the same time
    concurrent:
      dev:
        tasks: ['nodemon', 'watch']
        options:
          logConcurrentOutput: true


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-grunticon'

  grunt.registerTask 'build', ['jade', 'coffee', 'stylus', 'concat']
  grunt.registerTask 'default', ['build', 'concurrent:dev']