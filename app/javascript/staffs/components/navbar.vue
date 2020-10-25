<template lang="pug">
  div(class="navbar")
    img(:src="logo")
    template(v-if="current_user")
      div(class="current-user") {{ current_user }}
      button(@click="logout") Exit
    template(v-else)
      p No user logged in
</template>

<script>
export default {
  name: 'Navbar',
  props: ['logo', 'current_user'],
  methods: {
    logout () {
      console.log('logout')
    }
  }
}
</script>

<style scoped>

</style>
