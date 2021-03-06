export default new Vuex.Store({

    state: {
        destinations: [],
        airports: []
    },

    mutations: {

        setState(state, payload) {

            const { key, value } = payload;

            Vue.set(state, key, value);
        }
    },

    getters: {

        airports: state => {

            const lambda = d3.scaleLinear()
                .domain([-90, 90])
                .range([0, 1])
                .clamp(true);

            return state.airports.map((d) => ({
                pointLat: +d.lat,
                pointLng: +d.lng,
                pointColor: d3.interpolateReds(lambda(+d.lat)),
                pointAltitude: 0.01,
                pointRadius: 0.04,
                name: d.name,
                city: d.city,
                country: d.country,
                code: d.IATA
            }));

        }
    }
})