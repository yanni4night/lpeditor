var fs = require('fs'),
    path = require('path'),
    swig = require('swig'),
    minify = require('html-minifier').minify,
    uglify = require('uglify-js'),
    cleancss = require('clean-css');


var exec = require('child_process').exec;


var sys={
    cssurl : './static/release/main.css',
    jsurl : './static/release/pcroam_main.js'
};
    

var filefolder = path.join(__dirname , '.');

    
var css = fs.readFileSync(path.join(filefolder , sys.cssurl)).toString();
var js = fs.readFileSync(path.join(filefolder, sys.jsurl)).toString();
js = uglify.minify(js , {fromString:true}).code;
css= new cleancss({keepSpecialComments:0,noAdvanced:1}).minify(css);


if(!fs.existsSync(path.join(__dirname,'landing'))){
    fs.mkdirSync(path.join(__dirname,'landing'));
}

fs.writeFileSync(path.join(__dirname,'landing' , 'roam_common.js') , js);
fs.writeFileSync(path.join(__dirname,'landing' , 'common.css') , css);



exec("rsync -avz landing root@10.12.143.85:/search/wan/webapp/static/");
