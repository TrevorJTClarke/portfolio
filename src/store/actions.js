import Web3 from 'web3'
const contractAddress = '0xc1754b57c63714bd9cf5530d6b94d24b0371c865'
// import axios from 'axios'
// const rpcUrl = `https://rinkeby.infura.io/Q5I7AA6unRLULsLTYd6d`

// const ProviderEngine = require('web3-provider-engine/index.js')
// const ZeroClientProvider = require('web3-provider-engine/zero.js')
export default {
  connect({ commit, state, dispatch }) {
    let web3Provider = false
    if (typeof window.web3 !== 'undefined') {
      web3Provider = window.web3.currentProvider
      commit('SET_METAMASK', true)
    } else if (!state.retried) {
      commit('SET_RETRY', true)
      setTimeout(() => {
        dispatch('connect')
      }, 1000)
    } else {
      // web3Provider = ZeroClientProvider({
      //   getAccounts: function () {},
      //   rpcUrl
      // })
    }
    if (web3Provider) {
      window.web3 = new Web3(web3Provider)
      commit('SET_CONNECTED', true)
      dispatch('setAccountInterval')
    }
  },
  setAccountInterval({ dispatch }) {
    dispatch('checkAccount')
    setInterval(() => {
      dispatch('checkAccount')
    }, 3000)
  },
  checkAccount({ commit, state }) {
    window.web3.eth.getAccounts((error, accounts) => {
      if (error) console.error(error)
      if (state.account !== accounts[0]) {
        commit('SET_ACCOUNT', accounts[0])
      } else if (!accounts.length) {
        commit('SET_ACCOUNT', null)
      }
    })
  },
  mountUserContract({ dispatch, commit, state }, address) {
    if (state.connected) {
      commit('CLEAR_CONTRACT')
      commit('ADD_ADDRESS', address || contractAddress)
      commit(
        'ADD_USER',
        new window.web3.eth.Contract(state.abi.abi, state.address)
      )
    } else {
      setTimeout(() => {
        dispatch('mountUserContract', address)
      }, 500)
    }
  }
}
