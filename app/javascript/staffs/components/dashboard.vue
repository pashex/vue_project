<template lang="pug">
  div
    div
      p Add new Client
      form
        p
          input(v-model.lazy="new_client.fullname" placeholder="Enter client's fullname")
        p
          input(v-model.lazy="new_client.phone" placeholder="Enter client's phone")
        p
          input(v-model.lazy="new_client.email" placeholder="Enter client's email")
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
      this.errors = this.validateClientForm()

      if (!this.errors.length) {
        this.loadings.new_client = true

        this.$api.post('/clients', { client: this.new_client })
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
    loadClients () {
      this.loadings.list = true

      this.$api.get('/clients.json')
      .then(({ data }) => {
        this.clients = data
      })
      .catch(() => {
        this.errors = true
      })
      .finally(() => {
        this.loadings.list = false
      })
    },
    validateClientForm () {
      let errors = []
      errors.push(this.fullnameError())
      errors.push(this.phoneError())
      errors.push(this.emailError())

      return errors.filter(n => n)
    },
    fullnameError () {
      if (this.new_client.fullname.length < 5) {
        return "Fullname must be 5 characters minimum"
      }
    },
    phoneError () {
      if (!this.new_client.phone) {
        return "Phone cat't be blank"
      }
      if (!/^\d+$/.test(this.new_client.phone)) {
        return "Phone must contain digits only"
      }
    },
    emailError () {
      if (!this.new_client.email) {
        return "Email cat't be blank"
      }
      if (!/^\S+@\S+\.\S+$/.test(this.new_client.email)) {
        return "Email must be valid email address"
      }
    }
  },
  created () {
    this.loadClients();
  }
}

</script>

<style scoped>

</style>
