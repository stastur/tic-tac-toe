require('./styles/index.css')
require('./styles/normalize.css')

const { Elm } = require('./Main.elm')

const node = document.getElementById('root')

Elm.Main.init({ node })
