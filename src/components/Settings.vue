<style>



</style>

<template>

<v-layout row wrap>
    <v-flex xs4>
        <v-card class="addApi text-xs-center">
            <v-card-title primary-title>
                <h5 class="headline">Add API Endpoint，添加API 接口</h5>
            </v-card-title>
            <v-form class="ma-4" v-model="addEndpointForm" ref="form" lazy-validation>
                <v-select v-bind:items="[
              { text: 'HTTP', value: 'http://' },
              { text: 'HTTPS (Recommended)', value: 'https://' }
            ]" item-value="value" v-model="addEndpointProtocol" label="通信协议 Protocol" single-line bottom dense required></v-select>
                <v-text-field label="Domain/IP address" v-model="addEndpointIp" :rules="[(v) => !!v || 'URL is required']" placeholder="endpointdomain.com || 127.0.0.1 || localhost" required></v-text-field>
                <v-text-field label="接口 Port" v-model="addEndpointPort" :rules="[
              (v) => !!v || 'Port is required',
              (v) => v > 79 || 'Port must be a number bigger that 79'
            ]" placeholder="8888" required></v-text-field>
                <v-btn color="primary" v-if="!addEndpointLoading" @click="addEndpoint(addEndpointProtocol, addEndpointIp, addEndpointPort)" :disabled="!addEndpointForm">
                    Add
                </v-btn>
                <v-btn v-else disabled>
                    <v-progress-circular indeterminate color="primary"></v-progress-circular>
                </v-btn>
                <v-btn @click="clear">清空 clear</v-btn>
            </v-form>
        </v-card>
    </v-flex>

    <v-flex xs8>
        <v-data-table v-bind:headers="endpointListHeaders" :items="getEndpoints" no-data-text="No endpoints available" hide-actions class="elevation-1">
            <template slot="items" slot-scope="props">
                <td>{{ props.item.url }}</td>
                <td v-if="props.item.ping < 1">N/A</td>
                <td v-else>{{ props.item.ping }}</td>
                <td v-if="props.item.lastConnection < 1">never</td>
                <td v-else>
                    <timeago :since="unixToDatestring(props.item.lastConnection)" :auto-update="60"></timeago>
                </td>
                <v-btn color="red" @click="removeEndpoint(props.item.url)">移除 Remove</v-btn>
                <v-btn v-if="endpointLoading">
                    <v-progress-circular indeterminate color="primary"></v-progress-circular>
                </v-btn>
                <v-btn v-else-if="!getCurrentEndpoint || getCurrentEndpoint.url !== props.item.url" color="primary" @click="useEndpoint(props.item.url)">使用 Use</v-btn>
                <v-btn v-else-if="getCurrentEndpoint && getCurrentEndpoint.url === props.item.url"  @click="disconnectEndpoint(props.item.url)">解除连接 Disconnect</v-btn>
            </template>
        </v-data-table>
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
            'getEndpoints',
            'getCurrentEndpoint',
            'getEndpointConnectionStatus'
        ])
    },
    methods: {
        launchSnackbar(duration, snackbarText, snackbarTextColor) {
                this.snackbar = false
                this.snackbarTime = duration || 0
                this.snackbarText = snackbarText
                this.snackbar = true
            },
            clear() {
                this.$refs.form.reset()
            },
            addEndpoint(addEndpointProtocol, addEndpointIp, addEndpointPort) {
                let endpoint = addEndpointProtocol + addEndpointIp + ':' + addEndpointPort
                this.$store.dispatch('addEndpoint', endpoint).then(() => {
                    this.launchSnackbar(3000, 'Endpoint added', 'green')
                    this.endpointLoading = false
                }, (err) => {
                    if (err) {
                        this.launchSnackbar(3000, 'Endpoint is already added', 'red')
                    }
                })
            },
            disconnectEndpoint() {
                this.$store.dispatch('disconnectEndpoint')
            },
            useEndpoint(endpoint) {
                this.endpointLoading = true
                this.$store.dispatch('useEndpoint', endpoint).then(() => {
                    this.launchSnackbar(3000, 'Successfully connected to Endpoint', 'green')
                    this.endpointLoading = false
                }, (err) => {
                    if (err) {
                        if (err.message === 'timeout') {
                            this.launchSnackbar(3000, 'Connection to Endpoint timed out', 'red')
                        } else {
                            this.launchSnackbar(3000, 'Could not connect to Endpoint', 'red')
                        }
                        this.endpointLoading = false
                    }
                })
            },
            removeEndpoint(endpoint) {
                this.$store.dispatch('removeEndpoint', endpoint)
            },
            addEndpointAndConnect(newEnpoint) {
                this.$store.dispatch('addRPCEndpoint', newEnpoint).then((uri) => {
                    this.$store.dispatch('swapActiveRPCEndpointByUri', uri).then((cool) => {
                        this.$store.dispatch('connectToRPCEndpoint').then((con) => {
                            this.openDialog('Successfully connected to enpoint 👍', ':)')
                        }, (err) => {
                            if (err.message === 'failedFetch') {
                                this.openDialog('Connection to endpoint failed. Most likely reasons:</br>' +
                                    'The endpoint refused the connection.</br>' +
                                    'There is no endpooint listening on specified URI.</br>' +
                                    'The endpoint has no "Access-Control-Allow-Origin" header present.', 'Error')
                            }
                        })
                    })
                }, (err) => {
                    if (err.message === 'duplicateUri') {
                        this.openDialog('The URI is already in the list', '!')
                    } else if (err.message === 'invalidUriFormat') {
                        this.openDialog('The URI is invalid', '!')
                    }
                })
            },
            unixToDatestring(unix) {
                return new Date(unix * 1000)
            }
    },
    data() {
        return {
            endpointLoading: false,
            snackbar: false,
            snackbarTime: 5000,
            snackbarText: null,
            snackbarTextColor: 'white',
            addEndpointForm: false,
            addEndpointIp: '',
            addEndpointPort: '',
            addEndpointProtocol: '',
            addEndpointLoading: false,
            endpointListHeaders: [{
                text: 'URL',
                align: 'center',
                sortable: false,
                value: 'url'
            }, {
                text: 'Ping',
                align: 'center',
                sortable: false,
                value: 'ping'
            }, {
                text: 'Used',
                align: 'center',
                sortable: false,
                value: 'lastConnection'
            }]
        }
    }
}

</script>
