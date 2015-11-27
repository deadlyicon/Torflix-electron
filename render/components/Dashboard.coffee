Reactatron = require '../../Reactatron'
Navbar = require './Navbar'
Columns = require './Columns'
Rows = require './Rows'
{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'Dashboard',

  propTypes:
    accountInfo: Reactatron.PropTypes.any
    transfers:   Reactatron.PropTypes.any
    files:       Reactatron.PropTypes.any

  getInitialState: ->
    page: 'Transfers' # || 'Files'

  onPageChange: (page) ->
    @setState page: page

  render: ->
    Rows className: 'Dashboard layer',
      Navbar
        accountInfo: this.props.accountInfo
        onPageChange: @onPageChange
      div className: 'shrink grow overflow-y',
        @renderPage()

  renderPage: ->
    switch @state.page
      when 'Transfers'
        Transfers(transfers: @props.transfers)
      when 'Files'
        Files(files: @props.files)
      # when 'Search'
      #   Search()
      else
        div(null, 'unknown page', @state.page)






Transfers = Reactatron.component 'Dashboard-Transfers',

  propTypes:
    transfers: Reactatron.PropTypes.array

  render: ->
    if !this.props.transfers
      return div(null, 'Loading...')

    div className: 'Dashboard-Transfers',
      @props.transfers.map (transfer) ->
        Transfer(Object.assign({key: transfer.id}, transfer))


Transfer = Reactatron.component 'Dashboard-Transfer',

  propTypes:
    name: Reactatron.PropTypes.string.isRequired

  render: ->
    div className: 'Dashboard-Transfer',
      div null, @props.name



Files = Reactatron.component 'Dashboard-Files',

  propTypes:
    files: Reactatron.PropTypes.object

  render: ->
    if !this.props.files
      return div(null, 'Loading...')

    files = []
    for id, file of @props.files
      files.push file

    div className: 'Dashboard-Files',
      files.map (file) ->
        File(Object.assign({key: file.id}, file))


File = Reactatron.component 'Dashboard-File',

  propTypes:
    name: Reactatron.PropTypes.string.isRequired

  render: ->
    div className: 'Dashboard-File',
      div null, @props.name



# availability: null
# callback_url: null
# client_ip: null
# created_at: "2015-11-12T15:20:29"
# created_torrent: false
# current_ratio: "0.00"
# down_speed: 0
# download_id: 17943657
# downloaded: 0
# error_message: null
# estimated_time: null
# extract: true
# file_id: 319392504
# finished_at: "2015-11-12T15:20:30"
# id: 30749026
# is_private: false
# magneturi: "magnet:?xt=urn:btih:9aa416140174fa7d6517bcc7d3990439053ecdb9&dn=The+Daily+Show+2015+11+11+Paul+Bettany+720p+HDTV+x264+CROOKS"
# name: "The Daily Show 2015 11 11 Paul Bettany 720p HDTV x264 CROOKS"
# peers_connected: 0
# peers_getting_from_us: 0
# peers_sending_to_us: 0
# percent_done: 100
# save_parent_id: 0
# seconds_seeding: 0
# size: 471753587
# source: "magnet:?xt=urn:btih:9AA416140174FA7D6517BCC7D3990439053ECDB9&dn=The+Daily+Show+2015+11+11+Paul+Bettany+720p+HDTV+x264+CROOKS&tr=udp://tracker.coppersurfer.tk:6969/announce&tr=udp://tracker.leechers-paradise.org:6969&tr=udp://open.demonii.com:1337"
# status: "COMPLETED"
# status_message: "Completed 1 week ago."
# subscription_id: 5024684
# torrent_link: "/v2/transfers/30749026/torrent"
# tracker_message: null
# trackers: null
# type: "TORRENT"
# up_speed: 0
# uploaded: 0
