Torrentz = require('Torrentz')

module.exports = (App) ->

  App.state.query = null
  App.state.queryResults = null

  App.on 'search', ({query}) ->
    App.setState page: 'Search', query: query, queryResults: null
    Torrentz.search(query).then (results) ->
      App.setState queryResults: results

  App.on 'downloadTorrent', ({torrent}) ->

    dummyTransfer =
      type: "TORRENT"
      status: "SEARCHING"
      status_message: "Searching..."
      name: torrent.name
      # created_at: "2015-11-28T06:31:26"
      downloaded: 0
      estimated_time: null

    App.state.transfers.unshift(dummyTransfer)

    App.setState page: 'Transfers'

    Torrentz.findMagnetLink(torrent.id).then (magnetLink) ->
      dummyTransfer.magneturi = magnetLink
      App.setState({}) # forceUpdate
      App.putio.addTransfer(magnetLink).then (transfer) ->
        Object.assign(dummyTransfer, transfer)
        App.setState({}) # forceUpdate





# availability: null
# callback_url: null
# client_ip: null
# created_at: "2015-11-19T15:14:45"
# created_torrent: false
# current_ratio: "0.00"
# down_speed: 0
# download_id: 18020481
# downloaded: 0
# error_message: null
# estimated_time: null
# extract: true
# file_id: 321148901
# finished_at: "2015-11-19T15:14:52"
# id: 30881269
# is_private: false
# magneturi: "magnet:?xt=urn:btih:455eca2d6504845f42d49d54bff786c3659aa7cb&dn=The+Daily+Show+2015+11+18+Ted+Koppel+HDTV+x264+CROOKS"
# name: "The Daily Show 2015 11 18 Ted Koppel HDTV x264 CROOKS"
# peers_connected: 0
# peers_getting_from_us: 0
# peers_sending_to_us: 0
# percent_done: 100
# save_parent_id: 0
# seconds_seeding: 0
# size: 144779870
# source: "magnet:?xt=urn:btih:455ECA2D6504845F42D49D54BFF786C3659AA7CB&dn=The+Daily+Show+2015+11+18+Ted+Koppel+HDTV+x264+CROOKS&tr=udp://tracker.coppersurfer.tk:6969/announce&tr=udp://tracker.leechers-paradise.org:6969&tr=udp://open.demonii.com:1337"
# status: "COMPLETED"
# status_message: "Completed 1 week ago."
# subscription_id: 5060153
# torrent_link: "/v2/transfers/30881269/torrent"
# tracker_message: null
# trackers: null
# type: "TORRENT"
# up_speed: 0
# uploaded: 0

