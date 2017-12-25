import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'main',
      component: require('@/components/Main').default,
      children: [
        {
          path: 'settings',
          name: 'settings',
          component: require('@/components/Settings').default
        },
        {
          path: 'home',
          name: 'home',
          component: require('@/components/Home').default
        },
        {
          path: 'account',
          name: 'account',
          component: require('@/components/Account').default
        },
        {
          path: 'matches',
          name: 'matches',
          component: require('@/components/Matches').default
        },
        {
          path: 'match/:id',
          name: 'match',
          component: require('@/components/Match').default
        }
      ]
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})
