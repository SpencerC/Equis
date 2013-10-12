module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        options:
          join: true
          bare: true
        files:
          "public/js/master.js": ["src/coffee/*.coffee"]
    stylus:
      compile:
        options:
          'include css': true,
        files: 
          'public/css/index.css': 'src/stylus/index.styl'
    grunticon:
      icons:
        options: 
          src: "src/img/icons/",
          dest: "src/img/icon-css/"
          cssprefix: "icon."
          svgo: true
      graphics:
        options: 
          src: "src/img/graphics/",
          dest: "src/img/graphic-css/"
          cssprefix: "graphic."
          svgo: true
    concat:
      dist1:
        src: ['public/css/index.css', 'src/img/icon-css/icons.data.svg.css', 'src/img/graphic-css/icons.data.svg.css']
        dest: 'public/css/index.css'
      dist2:
        src: ['src/plugins.js']
        dest: 'public/js/plugins.js'
    watch:
      coffee:
        files: 'src/coffee/*.coffee',
        tasks: 'coffee'
      stylusgrunticon:
        files: ['src/stylus/**', 'src/img/icons/**', 'src/img/graphics/**']
        tasks: ['stylus', 'concat']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-grunticon'

  grunt.registerTask 'default', ['coffee', 'stylus', 'concat', 'watch']