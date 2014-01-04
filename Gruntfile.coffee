module.exports = (grunt)->
  _ = require "underscore"
  init_config = grunt.config()

  # coffee
  _(init_config).extend
    coffee:
      dist:
        files: [
          {
            expand: true
            cwd: "src/"
            src: "*.coffee"
            dest: "tmp/lib/"
            ext: ".js"
          }
        ]

  # uglify
  _(init_config).extend
    uglify:
      dist:
        files: [
          {
            "lib/memory_storage.js": [
              "tmp/lib/memory_storage.js"
            ]
          }
        ]

  # mocha
  _(init_config).extend
    mochaTest:
      spec:
        options:
          reporter: "spec"
          colors: false
          require: [
            "coffee-script"
            "./test/spec_helper.coffee"
          ]
        src: [
          "./test/spec/**/*_spec.coffee"
        ]
    

  grunt.initConfig init_config

  # load npm tasks
  pkg = grunt.file.readJSON 'package.json'
  for task of pkg.devDependencies when /^grunt-/.test task
    grunt.loadNpmTasks task

  # generate tmp
  grunt.registerTask(
    "compile"
    [
      "coffee:dist"
    ]
  )

  # testing
  grunt.registerTask(
    "test"
    [
      "compile"
      "mochaTest:spec"
    ]
  )

  # build files
  grunt.registerTask(
    "build"
    [
      "compile"
      "uglify:dist"
    ]
  )

