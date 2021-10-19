'use strict';
module.exports = function(grunt){
    //Setting Init Config from package.json
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        critical: {
          extract: {
            options: {
              base: './',
              width: 1024,
              height: 768,
              minify: true
            },
            files: [
                {src: ['./index.html'], dest: './generated_index.html'},
                {src: ['./blog.html'], dest: './generated_blog.html'}        
            ]
            //src: 'path/to/initial.html',
            //dest: 'path/to/final.html'
          }
        }
      });
    
      grunt.loadNpmTasks('grunt-critical');
      grunt.registerTask('default', ['critical:extract']);

};