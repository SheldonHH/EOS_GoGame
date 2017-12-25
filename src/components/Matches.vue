<style>



</style>

<template>
<v-layout row wrap>
  <v-flex xs3 v-if="getEndpointConnectionStatus === 0 && getAccountActive && !getAccountLocked">
    <v-card>
      <v-toolbar dark card dense flat color="transparent">
        <v-toolbar-title class="white--text">比赛请求 New match request</v-toolbar-title>
      </v-toolbar>
      <v-divider></v-divider>
      <v-card-text>
        <v-form v-model="requestMatch" ref="form" lazy-validation>
            <v-text-field label="Opponent" v-model="requestMatchOpponent" :rules="[
      (v) => !!v || 'Opponent is required'
    ]" required></v-text-field>
    <v-select v-bind:items="[
  /* { text: 'White', value: 0 }, */
  { text: 'Black', value: 1 }
]" item-value="value" v-model="requestMatchSide" label="Your Side" single-line bottom dense required></v-select>
<v-text-field label="Move time limit(seconds)" v-model="requestMatchTimelimit" :rules="[
    (v) => !!v || 'Time limit is required',
    (v) => v > 1 || 'Time limit must be a number'
  ]" required></v-text-field>
            <v-btn v-if="loading" disabled color="transaparent">
                <v-progress-circular indeterminate color="primary"></v-progress-circular>
            </v-btn>
            <v-btn v-else :disabled="!requestMatch" color="primary" @click="requestNewMatch(requestMatchOpponent, requestMatchSide, requestMatchTimelimit)">比赛请求 Request Match</v-btn>
        </v-form>
      </v-card-text>
      <v-toolbar dark card dense flat color="transparent">
        <v-toolbar-title class="white--text">已发送请求 Requested</v-toolbar-title>
      </v-toolbar>
      <v-divider></v-divider>
      <v-expansion-panel dark>
    <v-expansion-panel-content v-for="(item,i) in getMatchRequested" :key="i" v-if="item.status === 0">
      <div slot="header">{{item.opponent}}</div>
      <v-card>
        <v-divider></v-divider>
        <v-card-text>
          <p v-if="item.opponentside === 1">我的棋子 My side: 白色 white</p>
          <p v-else>我的棋子 My side: 黑色 black</p>
          <p>Max move time(sec): {{item.maxmoveinterval}}</p>
          <p v-if="item.status === 0"><b>Request has not been accepted or declined</b></p>
        </v-card-text>
      </v-card>
    </v-expansion-panel-content>
    <p v-if="getMatchRequested.length < 1">You have no requested matches</p>
  </v-expansion-panel>
</v-card>
  </v-flex>
  <v-flex xs4 v-if="getEndpointConnectionStatus === 0 && getAccountActive && !getAccountLocked">
    <v-card>
      <v-toolbar dark card dense flat color="transparent">
      <v-toolbar-title class="white--text">比赛请求 Match requests</v-toolbar-title>
    </v-toolbar>
      <v-divider></v-divider>
    <v-expansion-panel dark>
  <v-expansion-panel-content v-for="(item,i) in getMatchRequests" :key="i" v-if="item.status === 0">
    <div slot="header" class="blink">{{item.opponent}}</div>
    <v-card>
      <v-divider></v-divider>
      <v-card-text>
        <p v-if="item.host && item.opponentside === 1">Your side: White</p>
        <p v-else-if="item.host && item.opponentside === 1">Your side: Black</p>
        <p>Max move time(sec): {{item.maxmoveinterval}}</p>
        <v-btn v-if="loading" disabled color="transaparent">
            <v-progress-circular indeterminate color="primary"></v-progress-circular>
        </v-btn>
        <v-btn v-else color="green" @click="acceptMatch(item.opponent)">Accept</v-btn>
        <v-btn color="red" @click="declineMatch(item.opponent)">Decline</v-btn>
      </v-card-text>
    </v-card>
  </v-expansion-panel-content>
  <p v-if="getMatchRequests.length < 1">你目前还没有比赛 You have no open match requests</p>
</v-expansion-panel>
</v-card>
  </v-flex>
  <v-flex xs5 v-if="getEndpointConnectionStatus === 0 && getAccountActive && !getAccountLocked">
    <v-card>
      <v-toolbar dark card dense flat color="transparent">
      <v-toolbar-title class="white--text">我的比赛 My matches</v-toolbar-title>
    </v-toolbar>
    <v-divider></v-divider>
    <v-expansion-panel dark>
    <v-expansion-panel-content v-for="(item,i) in getAllMatchRequests" :key="i" v-if="item.status !== 0">
    <div slot="header">{{item.opponent}}</div>
    <v-card>
    <v-divider></v-divider>
    <v-card-text>
      <p v-if="item.opponentside === 1">Your side: White</p>
      <p v-else>Your side: Black</p>
      <p>Max move time: {{item.maxmoveinterval | formatSeconds}}</p>
      <p v-if="item.matchstart !== 0">Match start time: {{item.matchstart | timeago}}</p>
      <p v-else>Match has not been started</p>
      <p v-if="item.lastmovetime !== 0">Last move time: {{item.lastmovetime | timeago}}</p>
      <p v-else>No moves have been made yet</p>
      <p v-if="item.lastmovetime !== 0">Time left for next move:{{item.lastmovetime + item.maxmoveinterval | formatRemaining}}</p>
      <v-btn color="green" @click="playMatch(item.matchid, item.opponent, item.host)">Play</v-btn>
    </v-card-text>
    </v-card>
    </v-expansion-panel-content>
    <p v-if="getAllMatchRequests.length < 1">You have no match requests</p>
    </v-expansion-panel>
</v-card>
  </v-flex>

    <v-flex xs6 v-if="getEndpointConnectionStatus !== 0">
        <p>No connection! </br> Connection needed for Matches.</p>

        <router-link to="settings">
            <v-btn color="primary">Settings</v-btn>
        </router-link>
    </v-flex>
    <v-flex xs6 v-if="!getAccountActive">
        <p>Account needed for Matches.</p>

        <router-link to="account">
            <v-btn color="primary">Account</v-btn>
        </router-link>
    </v-flex>
    <v-flex xs6 v-else-if="getAccountLocked">
        <p>Unlocked account needed for Matches.</p>
        <p>Please unlock your account first.</p>

    </v-flex>
    <v-snackbar :timeout="snackbarTime" top v-model="snackbar">
        <p class="snackbarTextColor">{{snackbarText}}</p>
    </v-snackbar>
</v-layout>

</template>

<script>

import {
    mapGetters
}
from 'vuex'
export default {
    computed: {
        ...mapGetters([
            'getEndpointConnectionStatus',
            'getAccountActive',
            'getAccountLocked',
            'getAccount',
            'getMatches',
            'getMatchRequests',
            'getMatchRequested',
            'getAllMatchRequests'
        ])
    },
    data() {
        return {
            requestMatch: null,
            requestMatchOpponent:null,
            requestMatchSide: null,
            requestMatchTimelimit: null,
            matchId: null,
            getMatchResult: null,
            findMatch: null,
            loading: null,
            matchTab: 'add',
            active: null,
            snackbar: false,
            snackbarTime: 5000,
            snackbarText: null,
            snackbarTextColor: 'white'
        }
    },
    methods: {
      requestNewMatch (requestMatchOpponent, requestMatchSide, requestMatchTimelimit) {
        this.loading = false
        this.loading = true
        this.$store.dispatch('requestMatch', {opponent: requestMatchOpponent, side: requestMatchSide, maxmoveinterval: requestMatchTimelimit}).then((res) => {
          this.loading = false
          this.launchSnackbar(4000, 'Successfuly sent request', 'red')
        }, (err) => {
          this.loading = false
          this.launchSnackbar(4000, 'Error does the account exist?', 'red')
        });
      },
        getMatch(matchId) {
                this.loading = false
                this.loading = true
                this.$store.dispatch('getMatch', matchId).then((res) => {
                    if (res.rows.length >= 1) {
                        this.getMatchResult = res.rows[0]
                        if (res.rows[0].black === this.getAccount.name || res.rows[0].white === this.getAccount.name) {
                            this.getMatchResult.myGame = true
                            this.matchTab = 'addResult'
                        }
                        switch (this.getMatchResult.status) {
                            case 0:
                                this.getMatchResult.statusText = 'Match has been initiated but has not been accepted by the opponent'
                                break
                            case 1:
                                this.getMatchResult.statusText = 'Match is in progress'
                                break
                            case 2:
                                this.getMatchResult.statusText = 'Match has been declined by opponent'
                                break
                            case 3:
                                this.getMatchResult.statusText = 'Match is over'
                                break
                        }

                    } else {
                        this.getMatchResult = null
                        this.matchTab = 'add'
                        this.launchSnackbar(3000, 'Could not find a match with that ID', 'red')
                    }
                    this.loading = false
                }, (err) => {
                    alert(err.message)
                    this.getMatchResult = null
                    this.matchTab = 'add'
                    this.loading = false
                })
            },
            acceptMatch(opponent) {
                this.loading = false
                this.loading = true
                this.$store.dispatch('acceptMatch', opponent).then((res) => {
                    this.launchSnackbar(3000, 'Added match to list', 'red')
                    this.loading = false
                }, (err) => {
                    if (err.message === 'The match has already started or is over') {
                        this.launchSnackbar(3000, err.message, 'red')
                    }
                    this.loading = false
                })
            },
            declineMatch(opponent) {
                this.loading = false
                this.loading = true
                this.$store.dispatch('declineMatch', opponent).then((res) => {
                    this.launchSnackbar(3000, 'Successfully declined match', 'red')
                    this.loading = false
                }, (err) => {
                    if (err.message === 'The match has already started or is over') {
                        this.launchSnackbar(3000, err.message, 'red')
                    }
                    this.loading = false
                })
            },
            playMatch(matchid, opponent, host) {
              this.$store.dispatch('setCurrentMatch', {matchid: matchid, opponent: opponent, host: host}).then((res) => {
                this.$router.push({ name: 'match', params: { id: matchid }})
              })
            },
            launchSnackbar(duration, snackbarText, snackbarTextColor) {
                this.snackbar = false
                this.snackbarTime = duration || 0
                this.snackbarText = snackbarText
                this.snackbar = true
            },
            unixToDatestring(unix) {
                return new Date(unix * 1000)
            },
            next() {
                this.active = this.tabs[(this.tabs.indexOf(this.active) + 1) % this.tabs.length]
            }
    }
}

</script>
