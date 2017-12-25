import bip38 from 'bip38'
import wif from 'wif'
import Eosecc from 'eosjs-ecc'
import Repeat from 'repeat'

const state = {
  lockTimeout: 1800,
  lastUnlock: 0,
  isLocked: true,
  isActive: false,
  privateKey: null,
  wallet: false
}

const mutations = {
  IMPORT_ACCOUNT (state, newAccount) {
    state.wallet = newAccount
    state.isActive = true
    newAccount = null
  },
  EXTEND_UNLOCK (state) {
    state.lastUnlock = Math.round(new Date().getTime() / 1000)
  },
  REMOVE_ACCOUNT (state) {
    state.wallet = null
    state.isActive = false
    state.privateKey = null
    state.isLocked = true
  },
  UNLOCK_ACCOUNT (state, privateKey) {
    state.privateKey = privateKey
    state.isLocked = false
    state.lastUnlock = Math.round(new Date().getTime() / 1000)
  },
  LOCK_ACCOUNT (state) {
    state.isLocked = true
    state.privateKey = null
  }
}

const actions = {
  isValidPrivateKey ({ commit }, keys) {
    return new Promise((resolve, reject) => {
      if (Eosecc.isValidPrivate(keys.privateKey)) {
        if (Eosecc.privateToPublic(keys.privateKey) === keys.publicKey) {
          resolve('ok')
        } else {
          reject(Error('noMatch'))
        }
      } else {
        reject(Error('invalidPKey'))
      }
    })
  },
  removeAccount ({ commit }) {
    return new Promise((resolve, reject) => {
      commit('REMOVE_ACCOUNT')
      resolve()
    })
  },
  importAccount ({ commit }, account) {
    return new Promise((resolve, reject) => {
      if (Eosecc.isValidPublic(account.publicKey) &&
      Eosecc.privateToPublic(account.privateKey) === account.publicKey &&
      account.newAccount && account.password) {
        let decoded = wif.decode(account.privateKey)
        let encryptedKey = bip38.encrypt(decoded.privateKey, decoded.compressed, account.password)
        let newAccount = {name: account.newAccount, privateKey: encryptedKey, publicKey: account.publicKey}
        commit('IMPORT_ACCOUNT', newAccount)
        console.log('account imported')
        newAccount = null
        account = null
        resolve()
      } else {
        account = null
        reject(Error(''))
      }
    })
  },
  unlockAccount ({ commit, state, dispatch }, password) {
    return new Promise((resolve, reject) => {
      let decryptedKey = bip38.decrypt(state.wallet.privateKey, password)
      let decoded = wif.encode(0x80, decryptedKey.privateKey, decryptedKey.compressed)
      if (Eosecc.privateToPublic(decoded) === state.wallet.publicKey) {
        dispatch('locker')
        commit('UNLOCK_ACCOUNT', decoded)
        resolve('unlocked')
      } else {
        reject(new Error('noMatch'))
      }
    })
  },
  lockAccount ({ commit }) {
    return new Promise((resolve, reject) => {
      commit('LOCK_ACCOUNT')
      resolve('ok')
    })
  },
  locker ({ commit, state }) {
    Repeat(check).every(1000, 'ms').start.in(1, 'sec')
    function check () {
      if (state.lastUnlock + state.lockTimeout < Math.round(new Date().getTime() / 1000)) {
        commit('LOCK_ACCOUNT')
      }
    }
  }
}

const getters = {
  getAccountActive: state => {
    return state.isActive
  },
  getAccountLocked: state => {
    return state.isLocked
  },
  getAccount: state => {
    return state.wallet
  }
}

export default {
  state,
  mutations,
  actions,
  getters
}
