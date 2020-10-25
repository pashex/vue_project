<template lang="pug">
  div
    img(:src="logo")
    template(v-if="current_user")
      div {{ current_user }}
      button(@click="logout") Exit
    template(v-else)
      p No user logged in
</template>

<script>
export default {
  name: 'Navbar',
  props: ['current_user'],
  data () {
    return {
      logo: null
    }
  },
  methods: {
    loadLogo () {
      this.$api.get('/asset_path', { params: { filename: 'logo.png' } })
      .then(({ data }) => {
        this.logo = data
      })
    },
    logout () {
      this.$emit('logout');
    }
  },
  created () {
    this.loadLogo();
  },
}

</script>

<style scoped>

</style>
