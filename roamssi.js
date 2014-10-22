var fs = require('fs'),
    path = require('path'),
    swig = require('swig'),
    minify = require('html-minifier').minify,
    uglify = require('uglify-js'),
    cleancss = require('clean-css');


var exec = require('child_process').exec;


var sys = {
    cssurl: './static/release/main.css',
    jsurl: './static/release/pcroam_main.js'
};

var CMD = process.argv[2];


var filefolder = path.join(__dirname, '.');


var css = fs.readFileSync(path.join(filefolder, sys.cssurl)).toString();
var js = fs.readFileSync(path.join(filefolder, sys.jsurl)).toString();
js = uglify.minify(js, {
    fromString: true
}).code;
css = new cleancss({
    keepSpecialComments: 0,
    noAdvanced: 1
}).minify(css);


if (!fs.existsSync(path.join(__dirname, 'landing'))) {
    fs.mkdirSync(path.join(__dirname, 'landing'));
}

fs.writeFileSync(path.join(__dirname, 'landing', 'roam_common.js'), js);
fs.writeFileSync(path.join(__dirname, 'landing', 'common.css'), css);



if (/^(pub|online|dist)$/i.test(CMD)) {
    exec("sshpass -p 'noSafeNoWork@2014' scp -r landing root@10.11.201.212:/search/wan/webapp/static;sshpass -p 'noSafeNoWork@2014' ssh root@10.11.201.212 'sh /search/script/publishscript/rsync_static2m1_new.sh'", function() {
        exec('rm -rf landing')
    });
} else {
    exec("sshpass -p 'Sogou-RD@2008' rsync -avz landing root@10.12.143.85:/search/wan/webapp/static/", function() {
        exec('rm -rf landing');
    });
}