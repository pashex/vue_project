import Vue from 'vue';
import axios from 'axios';
axios.defaults.headers['Accept'] = 'application/json';

const api = {
  application: {
    loadLogo: () => axios.get('/asset_path', { params: { filename: 'logo.png' } })
  },
  staffs: {
    me: () => axios.get('/staffs/me'),
    logout: () => axios.delete('/staffs/sign_out')
  },
  clients: {
    index: () => axios.get('/clients'),
    create: params => axios.post('/clients', { client: params })
  }
}

Vue.prototype.$api = api
