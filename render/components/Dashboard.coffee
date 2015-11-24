Reactatron = require '../../Reactatron'

{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'Dashboard',

  render: ->
    div className: 'Dashboard',
      h1(null, 'Torflix')
      AccountInfo(this.props.accountInfo)
      Transfers(transfers: this.props.transfers)


AccountInfo = Reactatron.component 'Dashboard-AccountInfo',

  render: ->

    if !this.props.avatar_url
      return div(null, 'Loading...')

    div className: 'Dashboard-AccountInfo',
      div(null, this.props.username)
      div
        this.props.disk.used
        ' / '
        this.props.disk.size



Transfers = Reactatron.component 'Dashboard-Transfers',

  propTypes:
    transfers: Reactatron.PropTypes.array

  render: ->
    if !this.props.transfers
      return div(null, 'Loading...')

    div className: 'Dashboard-Transfers',
      div null, 'Transfers'
      @props.transfers.map(Transfer)

Transfer = Reactatron.component 'Dashboard-Transfer',

  propTypes:
    name: Reactatron.PropTypes.string.isRequired

  render: ->
    div className: 'Dashboard-Transfer',
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