component = require '../Reactatron/component'

module.exports = component 'Login',

  onLoad: (event) ->
    if /#access_token=(.*)$/.test(event.target.src)
      @emit 'login', token: RegExp.$1

  componentDidMount: () ->
    webview = ReactDOM.findDOMNode(this)
    webview.addEventListener('did-finish-load', @onLoad)

  render: ->
    React.createElement('webview', className: 'putio-login', src: this.props.src)
