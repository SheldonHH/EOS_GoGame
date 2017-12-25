<style>



</style>

<template>

<v-layout row wrap>
    <div v-if="getEndpointConnectionStatus === 0">
        <div v-if="!getAccountActive">
            <v-stepper v-model="importAccount" v-if="!getAccountActive">
                <v-stepper-header>
                    <v-stepper-step step="1" :complete="importAccount > 1">账户名 Account Name</v-stepper-step>
                    <v-divider></v-divider>
                    <v-stepper-step step="2" :complete="importAccount > 2">私钥 Private Key</v-stepper-step>
                    <v-divider></v-divider>
                    <v-stepper-step step="3">Password</v-stepper-step>
                </v-stepper-header>
                <v-stepper-items v-if="importAccount < 4">
                    <v-stepper-content class="ma-1" light step="1">
                        <p>使用在EOS测试网络上注册的账户 Your account has to be registered on the EOS network first before you can import it.</p>
                        <v-form>
                            <v-text-field label="账户名 Account Name" v-model="newAccount" required></v-text-field>
                        </v-form>
                        <v-btn v-if="loading" disabled color="trasnaperent">
                            <v-progress-circular indeterminate color="primary"></v-progress-circular>
                        </v-btn>
                        <v-btn v-else color="primary" @click="stepOne(newAccount)">继续 Continue</v-btn>

                    </v-stepper-content>
                    <v-stepper-content class="ma-1" step="2">

                        <p>每一个EOS账户通常需要两对密钥对 这个程序只需要 <b>"Active"</b> 密钥对</p>
                        <p>Every EOS account usually has two default permission key pairs. This app only needs the private key of the <b>"Active"</b> key pair.</p>

                        <code>公钥 Public Key: {{publicKey}}</code>
                        <v-form>
                            <v-text-field label="active key的私钥   Private Key of active key pair" v-model="privateKey" required></v-text-field>
                        </v-form>

                        <v-btn v-if="loading" disabled color="trasnaperent">
                            <v-progress-circular indeterminate color="primary"></v-progress-circular>
                        </v-btn>
                        <v-btn v-else color="primary" @click="stepTwo(privateKey)">继续 Continue</v-btn>
                        <v-btn @click="importAccount--">后退 Back</v-btn>
                    </v-stepper-content>
                    <v-stepper-content class="ma-1" step="3">
                        <p>提供一个强健的密码用于解锁账户，至少10个字符长度，并确保有大写和小写字母</p>
                        <p>Provide a stong password that is at least 10 characters long and contains both lower and uppercase letters</p>
                        <v-form>
                            <v-text-field type="password" label="密码 Password" v-model="password" required></v-text-field>
                            <v-text-field type="password" label="重复密码 Repeat Password" v-model="password2" required></v-text-field>
                        </v-form>

                        <v-btn v-if="loading" disabled color="trasnaperent">
                            <v-progress-circular indeterminate color="primary"></v-progress-circular>
                        </v-btn>
                        <v-btn v-else color="primary" @click="completeImport(password, password2, privateKey, newAccount)">完成 Complete Import</v-btn>
                        <v-btn @click="importAccount--">后退 Back</v-btn>
                    </v-stepper-content>
                </v-stepper-items>
            </v-stepper>
        </div>
        <div v-else>
            <v-card>
                <v-list>
                    <v-subheader>账户 Account</v-subheader>
                    <v-divider></v-divider>
                    <v-list-tile>
                        <v-list-tile-content>
                            <v-list-tile-title>{{getAccount.name}}</v-list-tile-title>
                            <v-list-tile-sub-title>{{getAccount.publicKey}}</v-list-tile-sub-title>
                        </v-list-tile-content>
                    </v-list-tile>
                </v-list>
                <v-card-actions>
                    <v-btn v-if="getAccountLocked" @click="openUnlockDialog()" color="primary">解锁 Unlock</v-btn>
                    <v-btn v-else @click="lockAccount()" color="primary">锁定 Lock</v-btn>
                    <v-btn color="red" @click="removeAccount">移除 Remove</v-btn>
                </v-card-actions>
            </v-card>
        </div>
    </div>
    <div v-else>
        <p>没有连接 No connection! </br>在设置账户请先设置连接 Connection needed for Account Settings.</p>

        <router-link to="settings">
            <v-btn color="primary">设置 Settings</v-btn>
        </router-link>
    </div>

    <v-snackbar :timeout="snackbarTime" top v-model="snackbar">
        <p class="snackbarTextColor">{{snackbarText}}</p>
    </v-snackbar>
    <v-dialog v-model="unlockDialog" max-width="290">
        <v-card class="ma-1">
            <v-card-title v-html="unlockDialogTitle" class="headline"></v-card-title>
            <v-card-text v-html="unlockDialogMessage"></v-card-text>
            <v-text-field type="password" label="密码 Password" v-model="password" required></v-text-field>
            <v-card-actions>
                <v-btn v-if="loading" disabled color="trasnaperent">
                    <v-progress-circular indeterminate color="primary"></v-progress-circular>
                </v-btn>
                <v-btn v-else color="primary" @click="unlockAccount(password)">OK</v-btn>
                <v-btn flat @click.native="unlockDialog = false">Close</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
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
            'getAccountName',
            'getAccount'
        ])
    },
    methods: {
        openUnlockDialog() {
                this.unlockDialog = true
            },
            removeAccount() {
                this.$store.dispatch('removeAccount')
            },
            launchSnackbar(duration, snackbarText, snackbarTextColor) {
                this.snackbar = false
                this.snackbarTime = duration || 0
                this.snackbarText = snackbarText
                this.snackbar = true
            },
            stepOne(accName) {
                this.loading = false
                this.loading = true
                this.$store.dispatch('findAccount', accName).then((res) => {
                    for (let i = 0; i < res.permissions.length; i++) {
                        if (res.permissions[i].perm_name === 'active') {
                            this.publicKey = res.permissions[i].required_auth.keys[0].key
                        }
                    }
                    this.loading = false
                    this.importAccount = 2
                }, (err) => {
                    this.launchSnackbar(5000, err.message, 'red')
                    this.loading = false
                })
            },
            stepTwo(privateKey) {
                this.loading = false
                this.loading = true
                this.$store.dispatch('isValidPrivateKey', {
                    privateKey, publicKey: this.publicKey
                }).then((ok) => {
                    this.loading = false
                    this.importAccount = 3
                }, (err) => {
                    this.loading = false
                    if (err.message === 'invalidPKey') {
                        this.launchSnackbar(5000, 'Private Key is invalid', 'red')
                    } else if (err.message === 'noMatch') {
                        this.launchSnackbar(5000, 'Private Key does not match with Public key', 'red')
                    }
                })
            },
            completeImport(password, password2, privateKey, newAccount) {
                this.loading = true
                if (password === password2) {
                    this.delay(500, () => {
                        this.$store.dispatch('importAccount', {
                            newAccount, publicKey: this.publicKey, privateKey, password
                        }).then((ok) => {
                            this.password = null
                            this.password2 = null
                            this.privateKey = null
                            this.newAccount = null
                            this.publicKey = null
                            this.loading = false
                            this.unlockAcc = null
                            this.loading = false
                            this.importAccount = 4
                        })
                    })
                } else {
                    this.launchSnackbar(3000, 'Passwords do not match', 'red')
                }
            },
            unlockAccount(password) {
                this.loading = true
                this.delay(500, () => {
                    this.$store.dispatch('unlockAccount', password).then((ok) => {
                        this.loading = false
                        this.password = null
                        this.unlockDialog = false
                    }, (err) => {
                        this.loading = false
                        this.password = null
                        if (err) {
                            this.launchSnackbar(3000, 'Wrong password', 'red')
                        }
                    })
                })
            },
            lockAccount() {
                this.$store.dispatch('lockAccount')
            },
            delay(amount, cb) {
                setTimeout(cb, amount)
            }
    },
    data() {
        return {
            unlockDialog: null,
            unlockDialogTitle: 'Unlock Account',
            unlockDialogMessage: 'Unlock Account',
            snackbar: false,
            snackbarTime: 5000,
            snackbarText: null,
            snackbarTextColor: 'white',
            unlockAcc: null,
            loading: false,
            importAccount: null,
            publicKey: null,
            newAccount: null,
            password: null,
            password2: null,
            newPassValid: null,
            newPassMatch: null,
            privateKey: null,
            dialog: false,
            dialogMessage: '',
            dialogTitle: ''
        }
    }
}

</script>
