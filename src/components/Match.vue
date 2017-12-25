<style scoped>

table {
    margin: 0 auto;
    border-collapse: collapse;
    background: #8a8c82;
		width: 10%;
    height:10%;
    border: 3px solid black;
}
td {
	margin: 0;
	padding: 0;
  border: 3px solid black;
}
tr:nth-child(odd) td:nth-child(even),tr:nth-child(even) td:nth-child(odd) {
    background: #8a8c82;
    border: 3px solid black;
}
.highlighted {
		outline: 2px solid blue;
    outline-offset: -2px;
}
.highlightedred {
		outline: 2px solid red;
    outline-offset: -2px;
}
</style>

<template>

<v-layout row wrap>
<v-layout v-if="getEndpointConnectionStatus === 0 && getAccountActive && !getAccountLocked && currentMatch" row wrap>
	<v-flex xs12>
	<v-card >
		<p>The contract evaluates your moves not the UI.</p>
    <p>You are {{getAccount}}</p>
    <p>Current Match:{{currentMatch}} </p>
    <p>Current Move:{{currentMove}} </p>
    <p>boardWidth: {{boardWidth}}</p>
    <!-- <p>item {{item}}</p>-->
    <!--  //getter可以在外面拿，非getters只能在vue tag中-->
    <p>Host是{{getCurrentMatch.host}}</p>
    <p v-if="getCurrentMatch.host">我是Host</p>
    <p v-if="currentMatch.white === getAccount.name && currentMatch.lastmoveside === 1">
      该{{getAccount.name}}的白棋 下
    </p>
    <p v-if="currentMatch.black === getAccount.name && currentMatch.lastmoveside === 0">
      该{{getAccount.name}}的黑棋 下
    </p>
		<v-btn v-if="loading" disabled color="trasnaperent">
				<v-progress-circular indeterminate color="primary"></v-progress-circular>
		</v-btn>
    <v-btn v-if="!loading && currentMove.length > 0" color="orange" @click=" sendPress()">确认这一步 Confirm Piece</v-btn>
    <!-- <v-btn v-if="!loading && currentMove.length > 0" color="orange" @click="judgeWin();sendPress()"> Press piece message to contract with {{currentMove[0]}} steps</v-btn> -->
		<!-- <v-btn v-if="!loading && currentMove.length > 1" color="green" @click="judgeWin(); sendMove()">Send move message to contract with {{currentMove.length -1}} steps</v-btn> -->
		<!-- <v-btn v-if="!loading && currentMove.length > 0" color="red" @click="cancelMove()">取Cancel current move</v-btn> -->
		<v-btn v-else disabled >确认这一步 Confirm Piece</v-btn>
	</v-card>
</v-flex>
<v-flex xs8 v-if="currentMatch.white === getAccount.name">
<table id="board" ref="board" v-bind:style="{ height: boardWidth + 'px !important' }">
<!-- <tr><td v-for="(item, index) in getRowFromBoard(0,0,true)" v-html="item" @click="highlight($event)" :class="['0-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(1,3,true)" v-html="item" @click="highlight($event)" :class="['1-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(2,6,true)" v-html="item" @click="highlight($event)" :class="['2-' + index]"></td></tr> -->
<tr><td v-for="(item, index) in getRowFromBoard(0,0,true)" v-html="item" @click="highlight($event)" :class="['0-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(1,9,true)" v-html="item" @click="highlight($event)" :class="['1-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(2,18,true)" v-html="item" @click="highlight($event) " :class="['2-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(3,27,true)" v-html="item" @click="highlight($event) " :class="['3-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(4,36,true)" v-html="item" @click="highlight($event) " :class="['4-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(5,45,true)" v-html="item" @click="highlight($event) " :class="['5-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(6,54,true)" v-html="item" @click="highlight($event) " :class="['6-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(7,63,true)" v-html="item" @click="highlight($event) " :class="['7-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(8,72,true)" v-html="item" @click="highlight($event)" :class="['8-' + index]"></td></tr>
<!-- <tr><td v-for="(item, index) in getRowFromBoard(10,150,true)" v-html="item" @click="highlight($event) " :class="['10-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(11,165,true)" v-html="item" @click="highlight($event) " :class="['11-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(12,180,true)" v-html="item" @click="highlight($event) " :class="['12-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(13,195,true)" v-html="item" @click="highlight($event) " :class="['13-' + index]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(14,210,true)" v-html="item" @click="highlight($event) " :class="['14-' + index]"></td></tr> -->
</table>
<!-- <v-btn v-if="!loading" @click="castleMove(0)">Send long castle move</v-btn>
<v-btn v-if="!loading" @click="castleMove(1)">Send short castle move</v-btn> -->
</v-flex>
<v-flex xs8 v-else>
<table id="board" ref="board" v-bind:style="{ height: boardWidth + 'px !important' }">

<!-- <tr><td v-for="(item, index) in getRowFromBoard(14,224)" v-html="item" @click="highlight($event)" :class="['14-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(13,209)" v-html="item" @click="highlight($event)" :class="['13-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(12,194)" v-html="item" @click="highlight($event)" :class="['12-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(11,179)" v-html="item" @click="highlight($event)" :class="['11-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(10,164)" v-html="item" @click="highlight($event)" :class="['10-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(9,149)" v-html="item" @click="highlight($event)" :class="['9-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(8,134)" v-html="item" @click="highlight($event)" :class="['8-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(7,119)" v-html="item" @click="highlight($event)" :class="['7-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(6,104)" v-html="item" @click="highlight($event)" :class="['6-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(5,89)" v-html="item" @click="highlight($event)" :class="['5-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(4,74)" v-html="item" @click="highlight($event)" :class="['4-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(3,59)" v-html="item" @click="highlight($event)" :class="['3-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(2,44)" v-html="item" @click="highlight($event)" :class="['2-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(1,29)" v-html="item" @click="highlight($event)" :class="['1-' + (index*-1 + 14)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(0,14)" v-html="item" @click="highlight($event)" :class="['0-' + (index*-1 + 14)]"></td></tr> -->
<tr><td v-for="(item, index) in getRowFromBoard(8,80)" v-html="item" @click="highlight($event)" :class="['8-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(7,71)" v-html="item" @click="highlight($event)" :class="['7-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(6,62)" v-html="item" @click="highlight($event)" :class="['6-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(5,53)" v-html="item" @click="highlight($event)" :class="['5-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(4,44)" v-html="item" @click="highlight($event)" :class="['4-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(3,35)" v-html="item" @click="highlight($event)" :class="['3-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(2,26)" v-html="item" @click="highlight($event)" :class="['2-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(1,17)" v-html="item" @click="highlight($event)" :class="['1-' + (index*-1 + 8)]"></td></tr>
<tr><td v-for="(item, index) in getRowFromBoard(0,8)" v-html="item" @click="highlight($event)" :class="['0-' + (index*-1 + 8)]"></td></tr>
</table>
<v-btn v-if="!loading" >退出游戏</v-btn>
<v-btn v-if="!loading" >请求悔棋</v-btn>
</v-flex>
		<v-flex xs4>
			<v-card>
	<v-list two-line dense>
			Game Info
      <!-- <p>getCurrentEndpoint{{getCurrentEndpoint}}</p> -->
			<v-divider></v-divider>
			<v-list-tile>
				<v-list-tile-content>
					<v-list-tile-title>Last move</v-list-tile-title>
					<v-list-tile-sub-title>{{currentMatch.lastmovetime | timeago}} by {{moveSide(currentMatch.lastmoveside)}}</v-list-tile-sub-title>
				</v-list-tile-content>
			</v-list-tile>
			<v-list-tile>
				<v-list-tile-content>
					<v-list-tile-title>Time left for next move</v-list-tile-title>
					<v-list-tile-sub-title v-if="currentMatch.lastmovetime > 0">{{currentMatch.lastmovetime + currentMatch.maxmoveinterval | formatRemaining}}</v-list-tile-sub-title>
          <v-list-tile-sub-title v-else></v-list-tile-sub-title>

        </v-list-tile-content>
			</v-list-tile>
			<v-list-tile>
				<v-list-tile-content>
					<v-list-tile-title>White</v-list-tile-title>
					<v-list-tile-sub-title>{{currentMatch.white}} || {{currentMatch.moveswhite}} move(s)</v-list-tile-sub-title>
				</v-list-tile-content>
			</v-list-tile>
			<v-list-tile>
				<v-list-tile-content>
					<v-list-tile-title>Black</v-list-tile-title>
					<v-list-tile-sub-title>{{currentMatch.black}} || {{currentMatch.movesblack}} move(s)</v-list-tile-sub-title>
				</v-list-tile-content>
			</v-list-tile>
	</v-list>
  <v-btn v-if="!loading" @click="quitGame()">Quit Current Game</v-btn>
</v-card>
		</v-flex>

</v-layout>

    <v-flex xs6 v-if="getEndpointConnectionStatus !== 0">
        <p>连接不成功！  No connection! </br> Connection needed for Match.</p>

        <router-link to="settings">
            <v-btn color="primary">Settings</v-btn>
        </router-link>
    </v-flex>
    <v-flex xs6 v-if="!getAccountActive">
        <p>Account needed for Match.</p>

        <router-link to="account">
            <v-btn color="primary">Account</v-btn>
        </router-link>
    </v-flex>
    <v-flex xs6 v-else-if="getAccountLocked">
        <p>解锁账户 Unlocked account needed for Matches.</p>
        <p>请先解锁账户Please unlock your account first.</p>

    </v-flex>
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
            'getCurrentMatch',
            'getCurrentEndpoint'
        ])
		},
    data() {
        return {
						currentMove: [],
            previousEvent: null, // single--item array
            currentMatch: null,
						boardWidth: 0,
            loading: null,
            active: null,
            snackbar: false,
            snackbarTime: 5000,
            snackbarText: null,
            snackbarTextColor: 'white'
        }
    },
    methods: {
						highlight (event) {
              if (event.currentTarget.classList.item(1) !== 'highlighted'){

                  if(this.previousEvent !==null && this.previousEvent.contains('highlighted')){
                    console.log('this.previousEvent.currentTarget: '+JSON.stringify(this.previousEvent))
                    this.previousEvent.remove('highlighted')
                  }
                  event.currentTarget.classList.add('highlighted')
                  let piece = event.currentTarget.className.split(' ')[0]
                  console.log('event.currentTarget.className: '+JSON.stringify(event.currentTarget.className));
                  let exists = this.currentMove.indexOf(piece)
                  this.currentMove = [] // for wuziqi
                  console.log('Match_vue event: '+JSON.stringify(event))
                  this.previousEvent = event.currentTarget.classList;
                  console.log('Match_vue event.currentTarget: '+JSON.stringify(event.currentTarget))
                  console.log('Match_vue event.currentTarget.classList: '+JSON.stringify(event.currentTarget.classList))
                  console.log('Match_vue exists '+JSON.stringify(exists))
                  // if (exists === -1) {
                    // this.previousHighted.p ush(piece)
                    this.currentMove.push(piece)
                  // }
              }else{
                  event.currentTarget.classList.remove('highlighted')
                  this.currentMove = []
              }

						},

						sendMove () {
							this.loading = true
							let formatted = []
							for (let i = 0;i < this.currentMove.length;i++) {
								formatted.push(Number(this.currentMove[i].split('-')[0]))
								formatted.push(Number(this.currentMove[i].split('-')[1]))
							}
							formatted.push(10)
							let rem = 17 -formatted.length
							for (let j = 0;j < rem;j++) {
								formatted.push(0)
							}
              console.log('Match_vue methods{} sendMove() this.getAccount.name' +this.getAccount.name +' formatted'+JSON.stringify(formatted));
							this.$store.dispatch('sendMove', formatted).then((res) => {
								this.loading = false
								this.currentMove = []
                this.cancelMove()
                console.log('Match_vue methods{} sendMove() res:'+JSON.stringify(res))
								alert('contract says: good')
							}, (err) => {
								this.loading = false
								this.currentMove = []
								this.cancelMove()
								alert('contract says: ' + err.message)
							})
						},
            sendPress () {
							  this.loading = true
							  let zou = [] //need to prevent auto sort
                zou.push(Number(this.currentMove[0].split('-')[0]))
                zou.push(Number(this.currentMove[0].split('-')[1]))
                // zou = zou.sort((a, b) => a - b);
                console.log('unsorted_zou'+JSON.stringify(zou));
                console.log('unsorted_zou: '+JSON.stringify(zou))
                if(Number(this.currentMove[0].split('-')[0]) < Number(this.currentMove[0].split('-')[1])){
                    zou.push(99)
                }else{
                  zou.push(100)
                }
                this.$store.dispatch('sendPress', zou).then((res) => {
                    this.loading = false
                    this.currentMove = []
                    this.cancelMove()
                    console.log('Match_vue methods{} sendPress() res:'+JSON.stringify(res))
                    alert('contract says: 落子成功 success')
                    alert(JSON.stringify(res))
                },
                (err) => {
                   this.loading = false
								   this.currentMove = []
								   this.cancelMove()
    							 alert('contract says: ' + err.message)
                })
            },
            judgeWin (){
              this.loading = true
              let zou = [] //need to prevent auto sort
              zou.push(Number(this.currentMove[0].split('-')[0]))
              zou.push(Number(this.currentMove[0].split('-')[1]))
              // zou = zou.sort((a, b) => a - b);
              console.log('unsorted_zou'+JSON.stringify(zou));
              console.log('unsorted_zou: '+JSON.stringify(zou))
              if(Number(this.currentMove[0].split('-')[0]) < Number(this.currentMove[0].split('-')[1])){
                  zou.push(99)
              }else{
                zou.push(100)
              }
              this.$store.dispatch('sendPress', zou).then((res) => {
                  this.loading = false
                  this.currentMove = []
                  this.cancelMove()
                  console.log('Match_vue methods{} judgeWin() res:'+JSON.stringify(res))
                  alert('contract says: 落子成功 success')
                  alert(JSON.stringify(res))
              },
              (err) => {
                 this.loading = false
                 this.currentMove = []
                 this.cancelMove()
                 alert('contract says: ' + err.message)
              })
            },
						cancelMove () {
    							var els = document.getElementsByClassName('highlighted')
    							while (els[0]) {
        						els[0].classList.remove('highlighted')
      						}
                  console.log('Match_vue methods: {cancelMove} currentMove'+JSON.stringify(this.currentMove))

                  let formatted = []
    							for (let i = 0;i < this.currentMove.length;i++) {
                    console.log('formatted this.currentMove[i]'+JSON.stringify(this.currentMove[i]));
    								formatted.push(Number(this.currentMove[i].split('-')[0]))
    								formatted.push(Number(this.currentMove[i].split('-')[1]))
    							}
    							formatted.push(10)
    							let rem = 17 -formatted.length
                  console.log("rem"+rem);
    							for (let j = 0;j < rem;j++) {
    								formatted.push(0)
    							}
                  console.log('Match_vue methods: {cancelMove} formatted'+JSON.stringify(formatted))

                  this.currentMove = []
						},

            castleMove (long) {
							this.loading = true
							this.$store.dispatch('sendCastleMove', long).then((res) => {
								this.loading = false
								alert('contract says: good')
							}, (err) => {
								this.loading = false
								alert('contract says: ' + err.message)
							})
						},
						getRowFromBoard(row,from,white){
							let nArr = []
              let checkN = []
              // console.log('this.currentMatch.board'+JSON.stringify(this.currentMatch.board));
              if (white) { //0,0；14,210
                for(let i = from;i < from + 9;i++) {
                  let str = '<img @click="highlight" src="static/pieces/p' + this.currentMatch.board[i] + '.svg">'
                  // let str = '<img @click="highlight" src="static/pieces/circle'   + '.svg">'

                  // console.error('i:'+i+' board: '+this.currentMatch.board[i])
                  nArr.push(str)
                  checkN.push(i+" "+this.currentMatch.board[i])
  							}
                // console.log('Match_vue if white{}: checkN'+JSON.stringify(checkN))
              } else { // ->  14, 224 0,14
                for(let i = from;i > from - 9;i--) {
                  checkN.push(this.currentMatch.board[i])
                  // console.error('i:'+i+' board: '+this.currentMatch.board[i]);
                  let str = '<img @click="highlight" src="static/pieces/p' + this.currentMatch.board[i] + '.svg">'
                  // let str = '<img @click="highlight" src="static/pieces/cross'  + '.svg">'
                  nArr.push(str)
  							}
                // console.log('Match_vue else_black: checkN'+JSON.stringify(checkN)+'_from_'+from)
              }
							return nArr
						},
						moveSide(s) {
							if (s === 0) {
								return 'white'
							} else if (s === 1) {
								return 'black'
							} else {
                return 'nobody'
              }
						},
						calculateHeight() {
								this.boardWidth = this.$refs.board.clientWidth;
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
            },
            ping () {
              if (this.getAccountActive && !this.getAccountLocked && this.getCurrentMatch) {
                this.$store.dispatch('getCurrentMatchSet').then((res) => {
                  this.currentMatch = res
                })
              }
            }
    },
    beforeMount() {
        setInterval(this.ping, 1000)
        //window.addEventListener('resize', this.calculateHeight)
    },
}

</script>
