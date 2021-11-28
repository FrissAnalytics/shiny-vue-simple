import router from "./router.js"
import store from "./store.js"
import bus from "./bus.js"

$(document).on("shiny:connected", function (event) {

    const app = new Vue({

        el: "#app",

        vuetify: new Vuetify({}),

        store: store,

        router: router
    });

    Shiny.addCustomMessageHandler("r2vue", message => bus.emit("r2vue", message));

    Shiny.addCustomMessageHandler("rVuexSetState", message => store.commit("setState", message));

});