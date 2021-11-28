const routes = [
    { path: '/', component: httpVueLoader('components/Home.vue') },
    { path: '/globe', component: httpVueLoader('components/Globe.vue') },
]

export default new VueRouter({
    routes
})
