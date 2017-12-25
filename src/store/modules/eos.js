import Eos from 'eosjs'
// import val from 'validator'

const state = {
  eosconfig: {
    httpEndpoint: 'http://127.0.0.1:8888',
    expireInSeconds: 60,
    broadcast: true,
    debug: false,
    sign: true
  },
  connectionTimeout: 5000,
  getInfo: null,
  endpoints: [
    {url: 'http://127.0.0.1:8888', ping: 0, lastConnection: 0}
  ],
  currentEndpoint: {url: 'http://127.0.0.1:8888', ping: 0, lastConnection: 0},
  endpointConnectionStatus: 10,
  endpointRefreshInterval: 5000,
  currentMatch: {opponent: null, matchid: null, host: null},
  matchRequests: [],
  matchRequested: []
}

const mutations = {
  UPDATE_MATCH_REQUESTS (state, requests) {
    state.matchRequests = requests
  },
  UPDATE_MATCH_REQUESTED (state, requests) {
    state.matchRequested = requests
  },
  SET_CURRENT_MATCH (state, matchObj) {
    state.currentMatch.opponent = matchObj.opponent
    state.currentMatch.matchid = matchObj.matchid
    state.currentMatch.host = matchObj.host
  },
  PING_ENDPOINT_SUCCESS (state, payload) {
    state.currentEndpoint.ping = payload.ping
    state.endpointConnectionStatus = 0
    state.currentEndpoint.lastConnection = Math.round(new Date().getTime() / 1000)
    state.getInfo = payload.getInfo
    let current = state.endpoints.find(current => {
      return current.url === state.currentEndpoint.url
    })
    current.ping = payload.ping
    current.lastConnection = Math.round(new Date().getTime() / 1000)
  },
  PING_ENDPOINT_FAIL (state) {
    state.endpointConnectionStatus = 1
  },
  DISCONNECT_ENDPOINT (state) {
    state.endpointConnectionStatus = 1
    state.currentEndpoint = null
    state.eosconfig.httpEndpoint = ''
  },
  USE_ENDPOINT (state, endpoint) {
    state.currentEndpoint = endpoint
    state.eosconfig.httpEndpoint = state.currentEndpoint.url
  },
  ADD_ENDPOINT (state, endpoint) {
    state.endpoints.push({url: endpoint, ping: 0, lastConnection: 0})
  },
  REMOVE_ENDPOINT (state, endpoint, active) {
    let removeEndpoint = state.endpoints.map(function (item) { return item.url }).indexOf(endpoint.url)
    state.endpoints.splice(removeEndpoint, 1)
    if (active) {
      state.currentEndpoint = null
      state.eosconfig.httpEndpoint = ''
    }
  }
}

const actions = {
  pingEndpoint ({ commit, state }) {
    return new Promise((resolve, reject) => {
      if (state.currentEndpoint !== null) {
        var eos = Eos.Testnet(state.w)
        var pingStart = new Date().getTime()
        var timeout = setTimeout(function () { reject(Error('timeout')) }, state.connectionTimeout)
        eos.getInfo({}).then((res) => {
          console.log("pingEndpoint: timeout"+timeout)
          clearTimeout(timeout)
          var ping = new Date().getTime() - pingStart
          commit('PING_ENDPOINT_SUCCESS', {getInfo: res, ping: ping})
          resolve(res)
        }, (err) => {
          clearTimeout(timeout)
          if (err) {
            commit('PING_ENDPOINT_FAIL')
            reject(Error('failed'))
          }
        })
      } else {
        commit('PING_ENDPOINT_FAIL')
        reject(Error('noEnpoint'))
      }
    })
  },
  useEndpoint ({ commit, state, dispatch }, endpoint) {
    return new Promise((resolve, reject) => {
      let find = state.endpoints.find(find => {
        return find.url === endpoint
      })
      if (find) {
        commit('DISCONNECT_ENDPOINT')
        commit('USE_ENDPOINT', find)
        dispatch('pingEndpoint').then((res) => {
          resolve()
        }, (err) => {
          if (err) {
            commit('DISCONNECT_ENDPOINT')
            reject(err)
          }
        })
      }
    })
  },
  findAccount ({ commit, state }, account) {
    return new Promise((resolve, reject) => {
      var eos = Eos.Testnet(state.eosconfig)
      eos.getAccount({account_name: account}).then((res) => {
        resolve(res)
      }, (err) => {
        if (err) {
          reject(Error('notFound'))
        }
      })
    })
  },
  disconnectEndpoint ({ commit, state }) {
    return new Promise((resolve, reject) => {
      commit('DISCONNECT_ENDPOINT')
      resolve()
    })
  },
  addEndpoint ({ commit, state }, endpoint) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      let find = state.endpoints.find(find => {
        return find.url === endpoint
      })
      if (find) {
        reject(Error())
      } else {
        commit('ADD_ENDPOINT', endpoint)
        resolve()
      }
    })
  },
  removeEndpoint ({ commit, state }, endpoint) {
    return new Promise((resolve, reject) => {
      let find = state.endpoints.find(find => {
        return find.url === endpoint
      })
      if (find) {
        if (state.currentEndpoint && find.url === state.currentEndpoint.url) {
          commit('REMOVE_ENDPOINT', find, true)
        } else {
          commit('REMOVE_ENDPOINT', find, false)
        }
        resolve()
      }
    })
  },
  getCurrentMatchSet ({ commit, state, rootState }) {
    return new Promise((resolve, reject) => {
      var tscope
      if (state.currentMatch.host) {
        tscope = rootState.wallet.wallet.name
      } else {
        tscope = state.currentMatch.opponent
      }
      // console.log('eos_js getCurrentMatchSet() tscope: '+tscope+': state.currentMatch.host'+state.currentMatch.host)
      let parameters = { json: true, scope: tscope, code: 'chess', table: 'matches', limit: 1, lower_bound: state.currentMatch.matchid }
      // console.log('eos_js parameters'+JSON.stringify(parameters))
      var conf = Object.assign({}, state.eosconfig)
      conf.scope = ['chess', tscope].sort()
      var eos = Eos.Testnet(conf)
      // console.log('eos_js getCurrentMatchSet() √conf'+JSON.stringify(conf))
      // console.log('eos_js getCurrentMatchSet() vareos'+JSON.stringify(eos))
      eos.getTableRows(parameters).then((res) => {
        resolve(res.rows[0])
        // console.log('eos_js getCurrentMatchSet() state.currentMatch'+JSON.stringify(state.currentMatch))
        // console.log('eos_js getCurrentMatchSet() res'+JSON.stringify(res))
        // console.log('eos_js getCurrentMatchSet() commit'+commit)
        // console.log('eos_js getCurrentMatchSet() state'+JSON.stringify(state))
        // console.log('eos_js getCurrentMatchSet() rootState'+JSON.stringify(rootState))
      }, (err) => {
        if (err) {
          reject(err)
        }
      })
    })
  },
  setCurrentMatch ({ commit, state }, matchObj) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      commit('SET_CURRENT_MATCH', matchObj)
      resolve()
    })
  },
  quitGame ({ commit, state, rootState }, pos) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var conf = Object.assign({}, state.eosconfig)
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = [rootState.wallet.wallet.name, 'inita', 'chess'].sort()
      console.log([rootState.wallet.wallet.name, 'chess', 'inita'])
      var eos = Eos.Testnet(conf)
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'quitgame',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                matchid:1,
                player: 'rootState.wallet.wallet.name',
                opponent: 'inita',
              }
            }
          ]
        }).then((res) => {
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  requestMatch ({ commit, state, rootState }, matchObj) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var conf = Object.assign({}, state.eosconfig)
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = [rootState.wallet.wallet.name, matchObj.opponent, 'chess'].sort()
      console.log([rootState.wallet.wallet.name, 'chess', matchObj.opponent])
      var eos = Eos.Testnet(conf)
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'newmatch',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                player: rootState.wallet.wallet.name,
                side: matchObj.side,
                opponent: matchObj.opponent,
                maxmoveinterval: Number(matchObj.maxmoveinterval)
              }
            }
          ]
        }).then((res) => {
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  updateMatchRequests ({ commit, state, rootState }) {
    return new Promise((resolve, reject) => {
      let parameters = {json: true, scope: rootState.wallet.wallet.name, code: 'chess', table: 'requests'}
      var conf = Object.assign({}, state.eosconfig)
      conf.scope = ['chess', rootState.wallet.wallet.name].sort()
      var eos = Eos.Testnet(conf)
      eos.getTableRows(parameters).then((res) => {
        if (res && res.rows.length > 0) {
          for (let i = 0; i < res.rows.length; i++) {
            res.rows[i].host = false
          }
          commit('UPDATE_MATCH_REQUESTS', res.rows)
        }
        resolve(res)
      }, (err) => {
        if (err) {
          reject(err)
        }
      })
    })
  },
  updateMatchRequested ({ commit, state, rootState }) {
    return new Promise((resolve, reject) => {
      let parameters = {json: true, scope: rootState.wallet.wallet.name, code: 'chess', table: 'requested'}
      var conf = Object.assign({}, state.eosconfig)
      conf.scope = ['chess', rootState.wallet.wallet.name].sort()
      var eos = Eos.Testnet(conf)
      eos.getTableRows(parameters).then((res) => {
        if (res && res.rows.length > 0) {
          for (let i = 0; i < res.rows.length; i++) {
            res.rows[i].host = true
          }
          commit('UPDATE_MATCH_REQUESTED', res.rows)
        }
        resolve(res)
      }, (err) => {
        if (err) {
          reject(err)
        }
      })
    })
  },
  acceptMatch ({ commit, state, rootState }, opponent) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var conf = Object.assign({}, state.eosconfig)
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = [rootState.wallet.wallet.name, opponent, 'chess'].sort()
      var eos = Eos.Testnet(conf)
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'acceptmatch',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                player: rootState.wallet.wallet.name,
                opponent: opponent
              }
            }
          ]
        }).then((res) => {
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  declineMatch ({ commit, state, rootState }, opponent) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var conf = Object.assign({}, state.eosconfig)
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = [rootState.wallet.wallet.name, opponent, 'chess'].sort()
      var eos = Eos.Testnet(conf)
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'declinematch',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                player: rootState.wallet.wallet.name,
                opponent: opponent
              }
            }
          ]
        }).then((res) => {
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  judgeWin ({ commit, state, rootState, dispatch }, pss) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var tscope
      if (state.currentMatch.host) {
        tscope = rootState.wallet.wallet.name
      } else {
        tscope = state.currentMatch.opponent
      }
      var conf = Object.assign({}, state.eosconfig)

      // conf.keyProvider = '5J5ZG7Xf8t4mQMrGY85e9sBECiPdEKSSAMvMw7FdnZDE1S2aX9r' //sheldon
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = ['chess', rootState.wallet.wallet.name, state.currentMatch.opponent].sort()
      // console.log('eos_js sendMove{} rootState'+JSON.stringify(rootState))
      var eos = Eos.Testnet(conf)
      // console.log('eos_js sendMove{} vareos'+JSON.stringify(eos))
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'judgewin',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                matchid: state.currentMatch.matchid,
                pss: pss,
                player: rootState.wallet.wallet.name,
                host: tscope
              }
            }
          ]
        }).then((res) => {
          console.log('eos_js sendPress{} res'+JSON.stringify(res))
          dispatch('updateMatch')
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            console.log('eos_js action sendMove(err) details'+JSON.stringify(details));
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  sendPress ({ commit, state, rootState, dispatch }, steps) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var tscope
      if (state.currentMatch.host) {
        tscope = rootState.wallet.wallet.name
      } else {
        tscope = state.currentMatch.opponent
      }
      var conf = Object.assign({}, state.eosconfig)

      // conf.keyProvider = '5J5ZG7Xf8t4mQMrGY85e9sBECiPdEKSSAMvMw7FdnZDE1S2aX9r' //sheldon
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = ['chess', rootState.wallet.wallet.name, state.currentMatch.opponent].sort()
      // console.log('eos_js sendMove{} rootState'+JSON.stringify(rootState))
      var eos = Eos.Testnet(conf)
      // console.log('eos_js sendMove{} vareos'+JSON.stringify(eos))

      var pss = []
      pss.push(Number(steps[0]));
      pss.push(Number(steps[1]));

      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'dianpress',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                matchid: state.currentMatch.matchid,
                pss: pss,
                player: rootState.wallet.wallet.name,
                host: tscope,
                indicator: Number(steps[2])
              }
            }
          ]
        }).then((res) => {
          console.log('eos_js sendPress{} res'+JSON.stringify(res))
          dispatch('updateMatch')
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            console.log('eos_js action sendMove(err) details'+JSON.stringify(details));
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  sendMove ({ commit, state, rootState, dispatch }, steps) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var tscope
      if (state.currentMatch.host) {
        tscope = rootState.wallet.wallet.name
      } else {
        tscope = state.currentMatch.opponent
      }
      var conf = Object.assign({}, state.eosconfig)
      // conf.keyProvider = '5J5ZG7Xf8t4mQMrGY85e9sBECiPdEKSSAMvMw7FdnZDE1S2aX9r' //sheldon
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = ['chess', rootState.wallet.wallet.name, state.currentMatch.opponent].sort()

      // console.log('eos_js sendMove{} rootState'+JSON.stringify(rootState))
      var eos = Eos.Testnet(conf)
      // console.log('eos_js sendMove{} vareos'+JSON.stringify(eos))
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'movepiece',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                matchid: state.currentMatch.matchid,
                steps: steps,
                player: rootState.wallet.wallet.name,
                host: tscope
              }
            }
          ]
        }).then((res) => {
          console.log('eos_js sendMove{} transaction_res'+JSON.stringify(res))
          dispatch('updateMatch')
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            console.log('eos_js action sendMove(err) details'+JSON.stringify(details));
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  },
  sendCastleMove ({ commit, state, rootState, dispatch }, long) {
    commit('EXTEND_UNLOCK')
    return new Promise((resolve, reject) => {
      var tscope
      if (state.currentMatch.host) {
        tscope = rootState.wallet.wallet.name
      } else {
        tscope = state.currentMatch.opponent
      }
      var conf = Object.assign({}, state.eosconfig)
      conf.keyProvider = rootState.wallet.privateKey
      conf.authorization = rootState.wallet.wallet.name + '@active'
      conf.scope = ['chess', rootState.wallet.wallet.name, state.currentMatch.opponent].sort()
      var eos = Eos.Testnet(conf)
      eos.contract('chess').then(chess => {
        eos.transaction({
          scope: conf.scope,
          messages: [
            {
              code: 'chess',
              type: 'castling',
              authorization: [{
                account: rootState.wallet.wallet.name,
                permission: 'active'
              }],
              data: {
                matchid: state.currentMatch.matchid,
                type: long,
                player: rootState.wallet.wallet.name,
                host: tscope
              }
            }
          ]
        }).then((res) => {
          dispatch('updateMatch')
          resolve(res)
        }, (err) => {
          if (JSON.parse(err).details.slice(0, 2) === '10') {
            let details = JSON.parse(err).details
            let errString1 = details.substring(details.lastIndexOf('{"s":"') + 1, details.lastIndexOf('","ptr"'))
            let errString = errString1.split('"')[3]
            reject(Error(errString))
          } else {
            reject(err)
          }
        })
      })
    })
  }
}

const getters = {
  getEndpoints: state => {
    if (state.endpoints.length > 0) {
      return state.endpoints
    } else {
      return []
    }
  },
  getCurrentEndpoint: state => {
    return state.currentEndpoint
  },
  getEndpointConnectionStatus: state => {
    return state.endpointConnectionStatus
  },
  getEndpointRefreshInterval: state => {
    return state.endpointRefreshInterval
  },
  getMatchRequests: state => {
    return state.matchRequests
  },
  getMatchRequested: state => {
    return state.matchRequested
  },
  getAllMatchRequests: state => {
    let allRequests = state.matchRequested.concat(state.matchRequests)
    return allRequests
  },
  getCurrentMatch: state => {
    return state.currentMatch
  }
}

export default {
  state,
  mutations,
  actions,
  getters
}
