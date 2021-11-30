<template>
  <div id="globe"></div>
</template>

<script>
module.exports = {
  name: "globe",

  mounted() {
    this.createGlobe();
  },

  computed: {
    airports() {
      return this.$store.getters.airports;
    },

    arcs() {
      return this.$store.state.arcs;
    },
  },

  methods: {
    createGlobe() {
      const el = document.getElementById("globe");

      const globe = Globe()
        .globeImageUrl("//unpkg.com/three-globe/example/img/earth-night.jpg")
        .bumpImageUrl("//unpkg.com/three-globe/example/img/earth-topology.png")
        .width(window.innerWidth)
        .height(window.innerHeight - 48);

      this.globe = globe(el);
    },

    showAirports() {
      this.setPointsData(this.airports, 4);
    },

    showArcs() {
      const OPACITY = 0.5;

      this.globe
        .arcsData(this.arcs)
        .arcStartLat((d) => +d.origin_lat)
        .arcStartLng((d) => +d.origin_lng)
        .arcEndLat((d) => +d.dest_lat)
        .arcEndLng((d) => +d.dest_lng)
        .arcColor((d) => [
          `rgba(0, 255, 0, ${OPACITY})`,
          `rgba(103, 58, 183, ${OPACITY})`,
        ])
        .arcsTransitionDuration(0);
    },

    setPointsData(pointsData, pointResolution = 30) {
      this.globe
        .pointsData(pointsData)
        .pointAltitude((d) => d.pointAltitude)
        .pointColor((d) => d.pointColor)
        .pointLat((d) => d.pointLat)
        .pointLng((d) => d.pointLng)
        .pointRadius((d) => d.pointRadius)
        .pointResolution(pointResolution);
    },
  },

  watch: {
    arcs() {
      this.showArcs();
    },

    airports() {
      this.showAirports();
    },
  },
};
</script>

<style scoped>
</style>
