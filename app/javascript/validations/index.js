import Vue from 'vue';

const validations = {
  clients: {
    validate (client) {
      const errors = []
      errors.push(this.fullname(client))
      errors.push(this.phone(client))
      errors.push(this.email(client))

      return errors.filter(m => m)
    },

    fullname (client) {
      if (client.fullname.length < 5) {
        return "Fullname must be 5 characters minimum"
      }
    },
    phone (client) {
      if (!client.phone) {
        return "Phone cat't be blank"
      }
      if (!/^\d+$/.test(client.phone)) {
        return "Phone must contain digits only"
      }
    },
    email (client) {
      if (!client.email) {
        return "Email cat't be blank"
      }
      if (!/^\S+@\S+\.\S+$/.test(client.email)) {
        return "Email must be valid email address"
      }
    }
  }
}

Vue.prototype.$validations = validations
