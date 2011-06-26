// Copy all required files to tmp folder
// Override files from platform/ios etc
// Execute xcode builder

var compile = function() {
  compile.ios.apply(this, arguments);
};

compile.ios = function(path, options){
  
}

module.exports.compile = compile