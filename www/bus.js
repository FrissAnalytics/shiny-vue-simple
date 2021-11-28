const bus = mitt();

bus.on('shiny-data', (val) => Shiny.setInputValue("vue_data", val));

Vue.prototype.$bus = bus;

export default bus;