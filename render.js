import {Page} from './render/Page'

setTimeout(()=>
  ReactDOM.render(<Page />, document.body.children[0])
);

