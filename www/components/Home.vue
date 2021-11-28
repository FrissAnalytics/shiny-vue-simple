<template>
  <div class="grey lighten-2 pa-2 text-center">
    <v-row align="center">
      <v-col cols="4">
        <v-select :items="items" label="destinations"></v-select>
      </v-col>
    </v-row>
  </div>
</template>

<script>
module.exports = {
  name: "home",

  data() {
    return {
      count: 0,
    };
  },

  computed: {
    destinations() {
      return this.$store.state.destinations;
    },

    items() {
      return this.destinations ? this.destinations.map((d) => d.dest) : [];
    },
  },

  methods: {
    increment() {
      this.count++;

      this.$bus.emit("shiny-data", {
        value: Math.random(),
      });
    },
  },
};
</script>

<style scoped>
</style>
