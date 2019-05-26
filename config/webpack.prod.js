const HtmlWebpackPlugin = require('html-webpack-plugin')
const TerserWebpackPlugin = require('terser-webpack-plugin')

module.exports = {
  target: 'web',
  mode: 'production',
  entry: ['./src/index.js'],
  output: {
    path: `${__dirname}/../build`,
    filename: 'bundle.js',
  },
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader',
      },
      {
        test: /\.css$/,
        exclude: [/node_modules/],
        use: [
          'style-loader',
          'css-loader',
          {
            loader: 'postcss-loader',
            options: {
              config: {
                path: './config/postcss.config.js',
              },
            },
          },
        ],
      },
    ],
  },
  optimization: {
    minimizer: [new TerserWebpackPlugin({ cache: true })],
  },
  plugins: [new HtmlWebpackPlugin({ template: './public/index.html' })],
}
