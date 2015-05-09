BANNER = '/*! qrijs <%= grunt.template.today("yyyy-mm-dd") %> */\n'


module.exports = (grunt) ->

    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        concat:
            options:
                banner: BANNER

            dist:
                src: ['contrib/*.js', 'dist/qri.js']
                dest: 'dist/qri.js'

        uglify:
            options:
                enclose: true
                banner: BANNER

            build:
                src: ['dist/qri.js']
                dest: 'dist/qri.min.js'

        coffee:
            compile:
                files:
                    'dist/qri.js': ['src/*.coffee']

    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-concat')
