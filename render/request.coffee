require 'shouldhave/Object.assign'

request = (method, url, data, options={}) ->

  options = Object.assign({}, options, {
    method: method
    url: url
    data: data
  })

  new Promise (resolve, reject) ->
    jQuery.ajax(options).done(resolve).error(reject)

request.get = (path, params) ->
  request('get', path, params)

request.post = (path, params) ->
  request('post', path, params)


module.exports = request
