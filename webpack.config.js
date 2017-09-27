require('./environment')
const paths = require('./paths')
const development = process.env.NODE_ENV === 'development'
const production  = process.env.NODE_ENV === 'production'

module.exports = {
  target: 'node',
  entry: paths.assetsEntry,
  output: {
    path: paths.assetsBuild,
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
