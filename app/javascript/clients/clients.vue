<template lang="pug">
  p {{ message }}
</template>

<script>
export default {
  data: function () {
    return {
      message: "Clients list"
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
