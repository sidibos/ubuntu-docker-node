'use strict';
module.exports = function(grunt){
    //Setting Init Config from package.json
    grunt.initConfig({
        //Read package.json and assign it to 'pkg'
        pkg: grunt.file.readJSON('package.json')
    });
};