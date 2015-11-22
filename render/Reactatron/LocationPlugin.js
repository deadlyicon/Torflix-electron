// export function LocationPlugin(page){

//   var update = () => {
//     page.setState({
//       path:   window.location.pathname,
//       params: searchToObject(window.location.search),
//     })
//   };

//   window.addEventListener('popstate', update);
//   update();

// }

// var searchToObject = function(search){
//   search = search.substring(search.indexOf('?') + 1, search.length);
//   if (!search.length) return {};
//   var params = {};
//   search.split(/&+/).forEach(function(param){
//     var [key, value] = param.split('=');
//     key = decodeURIComponent(key);
//     if (value != null){
//       value = decodeURIComponent(value);
//     }else{
//       value = true;
//     }
//     params[key] = value
//   });
//   return params;
// }
