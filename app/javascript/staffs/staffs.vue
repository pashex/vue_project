<template lang="pug">
  div
    navbar(:current_user="current_user" @logout="logout")
    p {{ message }}
</template>

<script>
import Navbar from './components/navbar.vue'

export default {
  data () {
    return {
      message: "Staffs list",
      logo: null,
      current_user: null
    }
  },
  created () {
    this.loadCurrentUser();
  },
  components: {
    Navbar
  },
  methods: {
    loadCurrentUser () {
      this.$api.get('/staffs/me')
      .then(({ data }) => {
        this.current_user = data.email
      })
    },
    logout () {
      this.$api.delete('/staffs/sign_out.json')
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
