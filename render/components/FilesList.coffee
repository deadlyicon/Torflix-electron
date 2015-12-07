Reactatron = require 'Reactatron'
Columns = require './Columns'
Rows = require './Rows'

{div, h1} = Reactatron.DOM

module.exports = FilesList = Reactatron.component 'FilesList',

  propTypes:
    files: Reactatron.PropTypes.array


  sortedFiles: ->

    byDirectory = {}
    for file in @props.files
      byDirectory[file.parent_id] ||= []
      byDirectory[file.parent_id].push(file)

    console.log(byDirectory)

    sortedFiles = byDirectory[0].sort(sortByName)

    return sortedFiles



  render: ->
    div
      className: 'FilesList rows '+(@props.className||'')
      @renderFiles()

  renderFiles: ->
    @sortedFiles().map (file, index) ->
      File(key: index, file: file)


sortByName = (a, b) ->
  a = a.name.toLowerCase()
  b = b.name.toLowerCase()
  return -1 if a < b
  return  1 if a > b
  return  0






File = Reactatron.component 'FilesList-File',

  propTypes:
    file: Reactatron.PropTypes.object.isRequired

  render: ->
    file = @props.file
    div className: 'columns',
      div className: 'FilesList-column-parent_id', file.parent_id
      div className: 'FilesList-column-icon',      @renderIcon()
      div className: 'FilesList-column-name',      file.name

  renderIcon: ->
    if @props.file.isDirectory
      'D'
    else
      'F'


#   propTypes:
#     files: Reactatron.PropTypes.array
#     directory_id: Reactatron.PropTypes.number.isRequired

#   getDefaultProps: ->
#     directory_id: 0

#   render: ->
#     if !this.props.files
#       return div(null, 'Loading...')

#     directory_id = @props.directory_id
#     allFiles = @props.files
#     files = allFiles.filter (file) ->
#       file.parent_id == directory_id

#     div className: 'FilesList',
#       files.map (file) ->
#         File(key: file.id, file: file, files: allFiles)


# File = Reactatron.component 'FilesList-File',

#   propTypes:
#     file: Reactatron.PropTypes.object.isRequired
#     files: Reactatron.PropTypes.array.isRequired

#   render: ->
#     file = @props.file
#     if file.isDirectory
#       directoryContents = FilesList
#         directory_id: file.id,
#         files: @props.files


#     div className: 'FilesList-File',
#       div className: 'columns',
#         div null, file.name
#       directoryContents

# # availability: null
# # callback_url: null
# # client_ip: null
# # created_at: "2015-11-12T15:20:29"
# # created_torrent: false
# # current_ratio: "0.00"
# # down_speed: 0
# # download_id: 17943657
# # downloaded: 0
# # error_message: null
# # estimated_time: null
# # extract: true
# # file_id: 319392504
# # finished_at: "2015-11-12T15:20:30"
# # id: 30749026
# # is_private: false
# # magneturi: "magnet:?xt=urn:btih:9aa416140174fa7d6517bcc7d3990439053ecdb9&dn=The+Daily+Show+2015+11+11+Paul+Bettany+720p+HDTV+x264+CROOKS"
# # name: "The Daily Show 2015 11 11 Paul Bettany 720p HDTV x264 CROOKS"
# # peers_connected: 0
# # peers_getting_from_us: 0
# # peers_sending_to_us: 0
# # percent_done: 100
# # save_parent_id: 0
# # seconds_seeding: 0
# # size: 471753587
# # source: "magnet:?xt=urn:btih:9AA416140174FA7D6517BCC7D3990439053ECDB9&dn=The+Daily+Show+2015+11+11+Paul+Bettany+720p+HDTV+x264+CROOKS&tr=udp://tracker.coppersurfer.tk:6969/announce&tr=udp://tracker.leechers-paradise.org:6969&tr=udp://open.demonii.com:1337"
# # status: "COMPLETED"
# # status_message: "Completed 1 week ago."
# # subscription_id: 5024684
# # torrent_link: "/v2/transfers/30749026/torrent"
# # tracker_message: null
# # trackers: null
# # type: "TORRENT"
# # up_speed: 0
# # uploaded: 0
