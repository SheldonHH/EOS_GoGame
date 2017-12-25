import Vue from 'vue'
import axios from 'axios'
import VueTimeago from 'vue-timeago'
import App from './App'
import router from './router'
import store from './store'
import Vuetify from 'vuetify'
import moment from 'moment'
require('material-design-icons/iconfont/material-icons.css')
require('typeface-roboto/index.css')
require('vuetify/dist/vuetify.min.css')

Vue.filter('formatRemaining', function (value) {
  if (value) {
    return moment.unix(value).toNow(true)
  }
})
Vue.filter('formatSeconds', function (value) {
  if (value) {
    return moment.duration(value, 'seconds').humanize()
  }
})
Vue.filter('timeago', function (value) {
  if (value) {
    return moment.unix(value).fromNow()
  }
})
Vue.use(VueTimeago, {
  name: 'timeago',
  locale: 'en-US',
  locales: {
    'en-US': require('vue-timeago/locales/en-US.json')
  }
})

Vue.use(Vuetify)

Vue.http = Vue.prototype.$http = axios
Vue.config.productionTip = false
Vue.config.keyCodes.enter = null
/* eslint-disable no-new */
new Vue({
  components: {
    App
  },
  router,
  store,
  template: '<App/>'
}).$mount('#app')
