import Vue from 'vue'
import App from '../staffs/staffs.vue'
import '../api'
import '../validations'
import '../quasar'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    render: h => h(App)
  }).$mount()
})
