var fs = require('fs'),
    path = require('path');

var items = fs.readdirSync(__dirname + '/math-ml');

items.sort().forEach(function(name) {
  var base = path.basename(name, '.mp4'),
      ext = path.extname(name);
  console.log('./ffmpeg -i '+  name +' -strict experimental -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]"  ./2x/' + base + '-x2' + ext);
});

// http://ffmpeg.gusari.org/static/64bit/ffmpeg.static.64bit.2013-10-23.tar.gz



