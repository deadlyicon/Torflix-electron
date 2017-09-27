require('./environment')

const Path = require('path')

const development = process.env.NODE_ENV === 'development'
const production  = process.env.NODE_ENV === 'production'

const paths = {}
paths.root   = __dirname
paths.assets = paths.root+'/assets'
paths.entry  = paths.assets+'/src/browser.js'
paths.build  = paths.assets+'/build'


module.exports = {
  target: 'node',
  entry: paths.entry,
  output: {
    path: paths.build,
    publicPath: '/assets',
    filename: (production ? 'browser.[hash].js': 'browser.js'),
  },
  plugins: [
  ],
  devtool: development ? 'inline-source-map' : false,
  module: {
    rules: [
    ]
  }
}
