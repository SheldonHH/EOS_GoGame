<style>
  #keep main .container {
    height: 660px;
  }
  .navigation-drawer__border {
    display: none;
  }
  .text {
    font-weight: 400;
  }
  .footer {
    max-height: 2px !important;
  }
  /* @group Blink */
.blink {
	-webkit-animation: blink .75s linear infinite;
	-moz-animation: blink .75s linear infinite;
	-ms-animation: blink .75s linear infinite;
	-o-animation: blink .75s linear infinite;
	 animation: blink .75s linear infinite;
}
@-webkit-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@-moz-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@-ms-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@-o-keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
@keyframes blink {
	0% { opacity: 1; }
	50% { opacity: 1; }
	50.01% { opacity: 0; }
	100% { opacity: 0; }
}
/* @end */
</style>

<template>
  <v-app dark class="blue-grey darken-3">
    <v-navigation-drawer
      fixed
      :clipped="$vuetify.breakpoint.width > 1264"
      v-model="drawer"
      class="grey darken-3"
      app
    >
      <v-list dense class="grey darken-3">
        <router-link tag="v-list-tile" to="/home">
          <v-list-tile-action>
            <v-icon>home</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title class="white--text">
              主页
            </v-list-tile-title>
          </v-list-tile-content>
        </router-link>
        <router-link tag="v-list-tile" to="/settings">
          <v-list-tile-action>
            <v-icon>settings</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title class="white--text">
              网络设置Settings
            </v-list-tile-title>
          </v-list-tile-content>
        </router-link>

        <router-link tag="v-list-tile" to="/account">
          <v-list-tile-action>
            <v-icon>person</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title class="white--text">
              账户设置Account <span v-if="getAccount && getAccount.name">({{getAccount.name}})</span>
            </v-list-tile-title>
          </v-list-tile-content>
        </router-link>
        <router-link tag="v-list-tile" to="/matches">
          <v-list-tile-action>
            <v-icon>view_list</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title class="white--text">
              比赛 Matches
            </v-list-tile-title>
          </v-list-tile-content>
        </router-link>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar color="blue-grey darken-4" app absolute clipped-left>
      <v-toolbar-side-icon v-if="$vuetify.breakpoint.width <= 1264" @click="drawer = !drawer"></v-toolbar-side-icon>
      <span class="title">EOS<span class="text">五子棋</span> <span class="caption">测试网络</span>
      <v-tooltip bottom>

      <span v-show="dotVisible" v-bind:style="{ color: 'green'}" slot="activator" v-if="getEndpointConnectionStatus === 0">⚫</span>
      <span slot="activator" v-else style="color:red;">⚫</span>
      <span v-if="getEndpointConnectionStatus === 0">Connection status: GOOD</span>
      <span v-else>Connection status: BAD</span>

    </v-tooltip>
    </span>
      <v-spacer></v-spacer>
      <v-toolbar-items class="ap-0">
      <v-btn v-if="getAccountLocked && getAccountActive" @click="openUnlockDialog()" icon>
        <v-icon>lock</v-icon>
      </v-btn>

      <v-btn v-else-if="getAccountActive" @click="lockAccount()" icon>
    <v-icon>lock_open</v-icon>
    </v-btn>


    </v-toolbar-items>
    </v-toolbar>
    <v-content>
       <v-container grid-list-md text-xs-center>
         <router-view></router-view>
       </v-container>
     </v-content>
    <v-dialog v-model="unlockDialog" max-width="290">
  <v-card>
    <v-card-title v-html="unlockDialogTitle" class="headline"></v-card-title>
    <v-card-text><v-text-field type="password" label="密码 Password" v-model="password" required></v-text-field></v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn v-if="loading" disabled color="trasnaperent"><v-progress-circular indeterminate color="primary"></v-progress-circular></v-btn>
      <v-btn v-else color="primary" @click="unlockAccount(password)">Unlock</v-btn>
      <v-btn v-if="!loading" flat @click="unlockDialog = false">Close</v-btn>
    </v-card-actions>
  </v-card>
</v-dialog>
<v-snackbar
  :timeout="snackbarTime"
  top
  v-model="snackbar"
>
<p class="snackbarTextColor">{{snackbarText}}</p>
</v-snackbar>
  </v-app>
</template>

 <script>
 import { mapGetters } from 'vuex'
 export default {
   data: () => ({
     snackbar: false,
     snackbarTime: 5000,
     snackbarText: null,
     snackbarTextColor: 'white',
     loading: false,
     password: null,
     unlockDialog: null,
     unlockDialogTitle: 'Unlock Account',
     unlockDialogMessage: 'Unlock Account',
     drawer: null,
     dotVisible: true
   }),
   computed: {
     ...mapGetters([
       'getTableRowsgetEndpointRefreshInterval',
       'getEndpointConnectionStatus',
       'getAccountLocked',
       'getAccountActive',
       'getEndpointRefreshInterval',
       'getAccount',
       'getCurrentEndpoint'
     ])
   },
   methods: {
     launchSnackbar (duration, snackbarText, snackbarTextColor) {
       this.snackbar = false
       this.snackbarTime = duration || 0
       this.snackbarText = snackbarText
       this.snackbar = true
     },
     unlockAccount (password) {
       this.loading = true
       this.delay(500, () => {
         this.$store.dispatch('unlockAccount', password).then((ok) => {
           this.loading = false
           this.password = null
           this.unlockDialog = false
           this.launchSnackbar(3000, 'Account unlocked', 'red')
         }, (err) => {
           this.loading = false
           this.password = null
           if (err) {
             this.launchSnackbar(3000, 'Wrong password', 'red')
           }
         })
       })
     },
     openUnlockDialog () {
       this.unlockDialog = true
     },
     ping () {
       if (this.getCurrentEndpoint !== null) {
         this.$store.dispatch('pingEndpoint')
         if (this.getAccountActive && !this.getAccountLocked) {
           this.$store.dispatch('updateMatchRequested')
           this.$store.dispatch('updateMatchRequests')
         }
       }
     },
     lockAccount () {
       this.$store.dispatch('lockAccount').then((res) => {
         this.launchSnackbar(3000, 'Account locked', 'red')
       })
     },
     delay (amount, cb) {
       setTimeout(cb, amount)
     }
   },
   mounted () {
     setInterval(this.ping, this.getEndpointRefreshInterval)
   }
}
</script>
