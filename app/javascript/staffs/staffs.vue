<template lang="pug">
  div
    navbar(:current_user="current_user" @logout="logout")
    dashboard(v-if="current_user")
</template>

<script>
import Navbar from './components/navbar.vue'
import Dashboard from './components/dashboard.vue'

export default {
  data () {
    return {
      logo: null,
      current_user: null
    }
  },
  created () {
    this.loadCurrentUser();
  },
  components: {
    Navbar,
    Dashboard
  },
  methods: {
    loadCurrentUser () {
      this.$api.staffs.me()
      .then(({ data }) => {
        this.current_user = data.email
      })
    },
    logout () {
      this.$api.staffs.logout()
      .then(() => {
        this.current_user = null
      })
    }
  }
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
