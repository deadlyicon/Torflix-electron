// require('./environment');
var Webpack = require('webpack');
var path = require('path');


var processEnv = {};
for (var key in process.env){
  processEnv[key] = JSON.stringify(process.env[key]);
}

module.exports = {
  entry: [
    path.resolve(__dirname, 'render')
  ],

  output: {
    path: path.resolve(__dirname, 'assets'),
    filename: 'render.js',
    publicPath: '/assets/'
  },

  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel' // 'babel-loader' is also a legal name to reference
      }
      // { test: /\.css$/,    loader: 'style!css'},
      // { test: /\.coffee$/, loader: "coffee-loader" },
    ]
  },

  resolve: {
    extensions: ["", ".coffee", ".js", ".css"]
  },

  plugins: [
    new Webpack.DefinePlugin({
      "process.env": processEnv
    }),
  ]
};



// process.env.NODE_ENV)
