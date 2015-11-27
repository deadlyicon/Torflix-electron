Reactatron = require '../../Reactatron'

module.exports = Reactatron.component 'Login',

  onLoad: (event) ->
    if /#access_token=(.*)$/.test(event.target.src)
      @emit 'login', token: RegExp.$1

  componentDidMount: ->
    webview = Reactatron.findDOMNode(this)
    webview.addEventListener('did-finish-load', @onLoad)

  render: ->
    Reactatron.createElement('webview', className: 'putio-login layer', src: this.props.src)
