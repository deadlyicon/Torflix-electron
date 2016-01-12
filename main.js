var path = require('path');
var request = require('request');
var fs = require('fs');

var app = require('app');  // Module to control application life.
var BrowserWindow = require('browser-window');  // Module to create native browser window.
var mainWindow;

app.DOWNLOAD_DIRECTORY_PATH = '/Users/deadlyicon/Downloads/'

// var wget = require('wget');
// app.wget = function(url){
//   var name = path.basename(url) || 'unknown';
//   var destination = app.DOWNLOAD_DIRECTORY_PATH+name;
//   console.log('downloading', url, '->', destination);
//   var download = wget.download(url, destination);
//   download.on('error', function(err) {
//     console.log(err);
//   });
//   return download;
// };

app.wget = function(url){
  // url = url.replace('https://', 'http://');
  var name = path.basename(url) || 'unknown';
  var destination = app.DOWNLOAD_DIRECTORY_PATH+name;
  console.log('downloading', url, '->', destination);

  var file = fs.createWriteStream(destination);
  return request(url, function(error, response, body) {
    console.log('response', response);
    if (response.statusCode >= 400){
      throw new Error('response code: '+response.statusCode);
    }
    response.pipe(file);
  });
  // dialog.showSaveDialog(remote.getCurrentWindow(),{title: 'Download Transfer', defaultPath: 'ass.jpreg'})
};
// BrowserWindow.addDevToolsExtension('/some-directory/react-devtools/shells/chrome')

// Report crashes to our server.
require('crash-reporter').start();

// Quit when all windows are closed.
app.on('window-all-closed', function() {
  app.quit();
});


// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
app.on('ready', function() {
  // Create the browser window.
  mainWindow = new BrowserWindow({width: 800, height: 600});

  // and load the index.html of the app.
  mainWindow.loadUrl('file://' + __dirname + '/render.html');

  // Open the DevTools.
  mainWindow.openDevTools();

  // Emitted when the window is closed.
  mainWindow.on('closed', function() {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null;
  });
});
