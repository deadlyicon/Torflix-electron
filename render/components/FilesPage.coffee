Reactatron = require 'Reactatron'
Layout = require './Layout'
FilesList = require './FilesList'
FilterInput = require './FilterInput'
Button = require './Button'

{div, input} = Reactatron.DOM


module.exports = Reactatron.component 'FilesPage',

  propTypes:
    files:  Reactatron.PropTypes.array

  render: ->
    Layout @props,
      div className: ''
      FilesList
        className: 'grow shrink overflow-y'
        files: @props.files




