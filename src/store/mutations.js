export default {
  SET_METAMASK(state, isPresent) {
    state.metamask = isPresent
  },
  SET_RETRY(state, haveRetried) {
    state.retried = haveRetried
  },
  SET_CONNECTED(state, isConnected) {
    state.connected = isConnected
  },
  CLEAR_CONTRACT(state) {
    state.address = null
  },
  ADD_ADDRESS(state, address) {
    state.address = address
  }
}
