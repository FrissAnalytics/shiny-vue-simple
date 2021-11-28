<template>
  <div class="globe-container text-center">
    <div id="globe-info">
      <v-btn x-small @click="increment()">update count</v-btn>
    </div>
    <div id="globe"></div>
  </div>
</template>

<script>
module.exports = {
  name: "about",

  data() {
    return {
      count: 0,
    };
  },

  mounted() {
    this.createGlobe();
  },

  methods: {
    createGlobe() {
      const el = document.getElementById("globe");

      const globe = Globe()
        .globeImageUrl("//unpkg.com/three-globe/example/img/earth-night.jpg")
        .showAtmosphere(true)
        .height(window.innerHeight - 100)
        .width(window.innerWidth - 50);

      this.globe = globe(el);

      this.globe.controls().autoRotateSpeed = 0.8;
    },

    increment() {
      this.count++;

      this.$bus.emit("shiny-data", this.count);
    },
  },
};
</script>

<style scoped>
.globe-container {
  position: relative;
}

#globe-info {
  position: absolute;
  top: 20px;
  left: 20px;
}
</style>
