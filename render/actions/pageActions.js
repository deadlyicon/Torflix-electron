export function pageActions(App){

  App.on('pageChange', (payload) => {
    var page = payload.page;

    console.info('pageChange', page);

  });

}
