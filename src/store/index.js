import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import modules from './modules'

Vue.use(Vuex)

export default new Vuex.Store({
  modules,
  plugins: [createPersistedState({
    storage: {
      getItem: key => window.localStorage.getItem(key),
      setItem: (key, value) => filter(key, value),
      removeItem: key => window.localStorage.removeItem(key)
    }
  })],
  strict: process.env.NODE_ENV !== 'production'
})
function filter (key, value) {
  if (typeof value === 'string') {
    let newVal = JSON.parse(value)
    newVal.wallet.privateKey = null
    newVal.wallet.isLocked = true
    newVal.eos.matchRequests = []
    newVal.eos.matchRequested = []
    window.localStorage.setItem(key, JSON.stringify(newVal))
  } else {
    window.localStorage.setItem(key, value)
  }
}
