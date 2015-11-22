export class Putio {
  constructor(token) {
    this.setToken(token);
  }

  setToken(token) {
    this.token = token;
    return this;
  }
}
