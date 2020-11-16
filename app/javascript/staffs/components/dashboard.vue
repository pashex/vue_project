<template lang="pug">
  div
    p Add new Client
    form
      p
        input(v-model.lazy="new_client.fullname" placeholder="Enter client's fullname")
      p
        input(v-model.lazy="new_client.phone" @blur="checkValid('phone')" placeholder="Enter client's phone")
      p
        input(v-model.lazy="new_client.email" @blur="checkValid('email')" placeholder="Enter client's email")
      p(v-show="!loadings.new_client")
        a(@click="submit") Add
      p(v-show="loadings.new_client") Loading...

    template(v-if="errors.length")
      p Errors
      ul
        li(v-for="error in errors")
          div {{ error }}

    template(v-if="clients.length")
      p Clients list
      ul(v-show="!loadings.list")
        li(v-for="client in clients" :key="client.id")
          div {{ client.fullname }}
          div {{ client.phone }}
          div {{ client.email }}
      p(v-show="loadings.list") Loading...

</template>

<script>
export default {
  name: 'Dashboard',
  props: [],
  data () {
    return {
      new_client: { email: '' },
      loadings: { new_client: false, list: false },
      errors: [],
      clients: []
    }
  },
  methods: {
    submit () {
      this.errors = this.$validations.clients.validate(this.new_client)

      if (!this.errors.length) {
        this.loadings.new_client = true

        this.$api.clients.create(this.new_client)
        .then(({ data }) => {
          this.new_client = { email: '' }
          this.errors = []
          this.clients.push(data)
        })
        .catch(({ response }) => {
          this.errors = response.data.errors
        })
        .finally(() => {
          this.loadings.new_client = false
        })
      }
    },
    checkValid (field) {
      if (this.new_client[field].length) {
        this.errors = []

        this.$api.clients.checkValid(this.new_client)
        .catch(({ response }) => {
          console.log(response.data.errors[field])
          this.errors = response.data.errors[field].map(err => `${field} ${err}`)
        })
      }
    },
    loadClients () {
      this.loadings.list = true

      this.$api.clients.index()
      .then(({ data }) => {
        this.clients = data
      })
      .catch(() => {
        this.errors = true
      })
      .finally(() => {
        this.loadings.list = false
      })
    }
  },
  created () {
    this.loadClients();
  }
}

</script>
