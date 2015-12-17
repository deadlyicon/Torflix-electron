
# Torflix



## Build


were using

https://www.npmjs.com/package/electron-builder

we need to make scripts


## UX

- full keyboard control


- cmd-f finds torrents (new page)
- remove search bar from top nav
- introduce second nav
- get icon font
- cmd-option-f filters current list
- cmd-click & shift-click select from list








## Development


#### Start webpack server

```sh
./node_modules/webpack/bin/webpack.js -w
```



## Architecture


Page is the controller
page has state, the entire state of the app


event is fired
event handler changes state (??)
app is re-rendered
