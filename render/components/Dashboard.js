import {Component} from '../Component'
import {GoToPageButton} from './GoToPageButton'

export class Dashboard extends Component {

  render(){
    return <div>
      <header>
        Torflix
      </header>

      <AccountInfo {...this.props.accountInfo} />
      <Transfers {...this.props.transfers} />
    </div>
  }
}

// avatar_url: "https://secure.gravatar.com/avatar/d7ac982a91addf9481e40f13e8dcb2fc.jpg?s=50"
// days_until_files_deletion: 0
// default_subtitle_language: "eng"
// disk:
//  avail: 35235167630
//  size: 107374182400
//  used: 72139014770
// has_voucher: 0
// mail: "put.io@deadlyicon.com"
// passive_account: false
// plan_expiration_date: "2015-11-25T10:45:57"
// settings: Object
// simultaneous_download_limit: 10
// subtitle_languages: Array[1]
// username: "deadlyicon"

class AccountInfo extends Component {

  render(){
    if (!this.props.avatar_url){
      return <div>Loading...</div>;
    }
    return <div>
      <div>{this.props.username}</div>
      <div>
        {this.props.disk.used} /
        {this.props.disk.size}
      </div>
    </div>
  }
}

class Transfers extends Component {

  render(){
    return <div>
      <div>Transfers</div>
      <div>{JSON.stringify(this.props)}</div>
    </div>
  }
}
