module.exports = (grunt) ->
  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    themeRoot: "wp-content/themes/solonquinn"
    concat:
      dist:
        #Libraries go Here
        src: [
          "<%= themeRoot %>/assets/components/lodash/dist/lodash.js",
          "<%= themeRoot %>/assets/components/jquery/jquery.js",
          "<%= themeRoot %>/assets/components/bootstrap/dist/js/bootstrap.js",
          "<%= themeRoot %>/assets/components/angular/angular.js",
          "<%= themeRoot %>/assets/components/angular-animate/angular-animate.js",
          "<%= themeRoot %>/assets/components/angular-resource/angular-resource.js",
          "<%= themeRoot %>/assets/components/afterResize.js/afterresize.js",
          "<%= themeRoot %>/assets/javascripts/<%= pkg.name %>.js"
        ]
        dest: "<%= themeRoot %>/assets/javascripts/application.js"
    uglify:
      options:
        banner: "/*! <%= pkg.name %> <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n"
        mangle: false
      build:
        src: "<%= themeRoot %>/assets/javascripts/application.js"
        dest: "<%= themeRoot %>/assets/javascripts/application.min.js"
    less:
      development:
        options:
          paths: ["<%= themeRoot %>/assets/stylesheets"]
        files:
          "<%= themeRoot %>/style.css": "<%= themeRoot %>/assets/stylesheets/<%= pkg.name %>.less"
      production:
        options:
          paths: ["<%= themeRoot %>/assets/stylesheets"]
          yuicompress: true
        files:
          "style.css": "<%= themeRoot %>/assets/stylesheets/<%= pkg.name %>.less"
    coffee:
      scripts:
        files:    
          #Extra app .coffee files go here
          "<%= themeRoot %>/assets/javascripts/sqs-admin.js": [
            "<%= themeRoot %>/assets/javascripts/sqs-admin.coffee"
          ] 
          "<%= themeRoot %>/assets/javascripts/<%= pkg.name %>.js": [
            "<%= themeRoot %>/assets/javascripts/<%= pkg.name %>.coffee"
            "<%= themeRoot %>/assets/javascripts/filters/**/*.coffee"
            "<%= themeRoot %>/assets/javascripts/services/**/*.coffee"
            "<%= themeRoot %>/assets/javascripts/directives/**/*.coffee"
            "<%= themeRoot %>/assets/javascripts/controllers/**/*.coffee"
          ]
      tests:
        files:
          "<%= themeRoot %>/assets/javascripts/tests/unit/main.js": "<%= themeRoot %>/assets/javascripts/tests/unit/**/*.coffee"
    karma:
      unit:
        configFile: "<%= themeRoot %>/assets/javascripts/tests/karma.conf.js"
        singleRun: false
    watch:
      scripts:
        files: "<%= themeRoot %>/assets/javascripts/**/*.coffee"
        tasks: ["coffee:scripts", "concat"]
      tests:
        files: ["<%= themeRoot %>/assets/javascripts/tests/**/*.coffee"]
        tasks: ["coffee:tests"]
      styles:
        files: "<%= themeRoot %>/assets/stylesheets/**/*.less"
        tasks: ["less:development"]
  
  # Load the plugins
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-karma"
  
  # Tasks
  grunt.registerTask "default", ["reset"]
  grunt.registerTask "reset", ["coffee", "concat", "less:development", "watch"]
  grunt.registerTask "production", ["uglify", "less:production"]