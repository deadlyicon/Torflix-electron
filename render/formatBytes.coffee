module.exports = formatBytes = (bytes, decimals) ->
  if bytes == 0
    return '0 Byte'
  k = 1000
  dm = decimals + 1 or 3
  sizes = [
    'Bytes'
    'KB'
    'MB'
    'GB'
    'TB'
    'PB'
    'EB'
    'ZB'
    'YB'
  ]
  i = Math.floor(Math.log(bytes) / Math.log(k))
  (bytes / k ** i).toPrecision(dm) + '' + sizes[i]
