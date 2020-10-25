<template lang="pug">
  div
    navbar(:logo="logo" :current_user="current_user")
    p {{ message }}
</template>

<script>
import Navbar from './components/navbar.vue'

export default {
  data: function () {
    return {
      message: "Staffs list",
      current_user: 'Test user',
      logo: 'assets/logo.png'
    }
  },
  components: {
    Navbar
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
