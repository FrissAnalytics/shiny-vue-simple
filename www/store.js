export default new Vuex.Store({

    state: {},

    mutations: {

        setState(state, payload) {

            const { key, value } = payload;

            Vue.set(state, key, value);
        }
    }
})