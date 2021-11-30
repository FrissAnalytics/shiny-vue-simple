<template>
  <div>
    <div id="globe-info" class="pa-2">
      <v-btn x-small @click="increment()">update count</v-btn>

      <v-select dark :items="items" label="destinations"></v-select>
    </div>

    <globe />
  </div>
</template>

<script>
module.exports = {
  name: "home",

  components: {
    globe: httpVueLoader("components/Globe.vue"),
  },

  data() {
    return {
      count: 0,
    };
  },

  methods: {
    increment() {
      this.count++;

      this.$bus.emit("shiny-data", Math.random());
    },
  },

  computed: {
    destinations() {
      return this.$store.state.destinations;
    },

    items() {
      return this.destinations.map((d) => d.dest);
    },
  },
};
</script>

<style scoped>
#globe-info {
  position: absolute;
  top: 20px;
  left: 20px;
  z-index: 1;
}
</style>
