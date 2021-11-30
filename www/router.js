const routes = [
    { path: '/', component: httpVueLoader('components/Home.vue') },
    { path: '/about', component: httpVueLoader('components/About.vue') },
]

export default new VueRouter({
    routes
})
