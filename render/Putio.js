var URI = require('urijs');

import {Request} from './Request'

const ENDPOINT     = 'https://put.io'
const API_ENDPOINT = 'https://api.put.io/v2'
const CLIENT_ID    = process.env.PUT_IO_CLIENT_ID
const REDIRECT_URI = 'http://torflix.dev' // location.origin

export class Putio {

  constructor(token) {
    this.setToken(token);
  }

  setToken(token) {
    this.token = token;
    return this;
  }

  siteURI(path, query={}){
    query.oauth_token = this.token;
    return URI(ENDPOINT).query(query).path(path).toString();
  }

  apiURI(path, query={}){
    query.oauth_token = this.token;
    return URI(API_ENDPOINT).query(query).path(path).toString();
  }

  request(method, url, data){
    // console.log('REQ:', {method: method, url: url, data: data})
    return new Request({method: method, url: url, data: data});
  }

  generateLoginURI(){
    return this.apiURI('/v2/oauth2/authenticate', {
      client_id:     CLIENT_ID,
      response_type: 'token',
      redirect_uri:  REDIRECT_URI,
    });
  }

  accountInfo(){
    return this.request('get', this.apiURI('/v2/account/info')).
      then((response) => response.info );
  }

}
