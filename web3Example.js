const Web3 = require('web3')

//const web3 = new Web3(new Web3.providers.HttpProvider('htt://127.0.0.01:8545'))
const web3 = new Web3(new Web3.providers.HttpProvider('https://goerli.infura.io/v3/8d51eb643ccd479784b6d420973317ce'))


// Client version
web3.eth.getNodeInfo(function (err, result) {
  if (err) {
    console.log(err)
    } else {
      console.log("Node info: " + result +"\n")
      }
  }
                     
                     
