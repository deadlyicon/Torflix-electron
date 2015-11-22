var URI = require('urijs');

const ENDPOINT     = 'https://put.io'
const API_ENDPOINT = 'https://api.put.io/v2'
const CLIENT_ID    = process.env.PUT_IO_CLIENT_ID
const REDIRECT_URI = location.origin

export class Putio {

  constructor(token) {
    this.setToken(token);
  }

  setToken(token) {
    this.token = token;
    return this;
  }

  siteURI(path, query={}){
    return URI(ENDPOINT).query(query).path(path).toString();
  }

  apiURI(path, query={}){
    return URI(ENDPOINT).query(query).path(path).toString();
  }

  generateLoginURI(){
    // "https://api.put.io/v2/oauth2/authenticate?client_id=#{client_id}&response_type=token&redirect_uri=#{redirect_uri}",
    return this.apiURI('/v2/oauth2/authenticate', {
      client_id:     CLIENT_ID,
      response_type: 'token',
      redirect_uri:  REDIRECT_URI,
    });
  }
}
