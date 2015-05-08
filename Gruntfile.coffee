module.exports = (grunt) ->

    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        uglify:
            options:
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'

            build:
                src: 'src/<%= pkg.name %>.js'
                dest: 'build/<%= pkg.name %>.min.js'

        coffee:
            compile:
                files:
                    'build/qri.js': ['src/*.coffee']

    grunt.loadNpmTasks('grunt-contrib-uglify')

    grunt.loadNpmTasks('grunt-contrib-coffee')

    grunt.registerTask('default', ['uglify'])
