<template lang="pug">
  div
    div
      p Add new Client
      form
        p
          input(v-model="new_client.fullname" placeholder="Enter client's fullname")
        p
          input(v-model="new_client.phone" placeholder="Enter client's phone")
        p
          input(v-model="new_client.email" placeholder="Enter client's email")
        p
          a(@click="submit") Add

      template(v-if="clients.length")
        p Clients list
        ul
          li(v-for="client in clients" :key="client.id")
            div {{ client.fullname }}
            div {{ client.phone }}
            div {{ client.email }}

</template>

<script>
export default {
  name: 'Dashboard',
  props: [],
  data () {
    return {
      new_client: { email: '' },
      clients: []
    }
  },
  methods: {
    submit () {
      this.$api.post('/clients', { client: this.new_client })
      .then(({ data }) => {
        this.new_client = { email: '' }
        this.clients.push(data)
      })
      .catch(({ response }) => {
        console.log(response)
      })
    },
    loadClients () {
      this.$api.get('/clients.json')
      .then(({ data }) => {
        this.clients = data
      })
    }
  },
  created () {
    this.loadClients();
  }
}

</script>

<style scoped>

</style>
