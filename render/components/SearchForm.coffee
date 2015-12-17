Reactatron = require 'Reactatron'

{form, input} = Reactatron.DOM

module.exports = Reactatron.component 'SearchForm',

  componentDidMount: ->
    @refs.input.focus()

  onSubmit: (event) ->
    event.preventDefault()
    @emit 'search', query: @refs.input.value

  render: ->
    form
      onSubmit: @onSubmit
      className: 'SearchForm grow shrink'
      input
        ref: 'input'
        type: 'text'
        placeholder: 'Search…'

