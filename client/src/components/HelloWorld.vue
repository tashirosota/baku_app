<template lang="pug">
  div.hello
    h1 {{ msg }}
    h2
    |Essential Links
    ul
      li
        a(href="https://vuejs.org" target="_blank")
        | Core Docs
      li
        a(href="https://forum.vuejs.org" target="_blank")
        | Forum
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Hello Vue.js App'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
