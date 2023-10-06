import { createRouter, createWebHistory } from "vue-router";
import Home from "../component/Home.vue";
import About from "../component/About.vue";
import Blog from "../component/Blog.vue";
import SingleBlog from "../component/SingleBlog.vue";
import Contact from "../component/Contact.vue"
import Login from "../component/Login.vue"
import Register from "../component/Register.vue"
import Dashboard from "../component/Dashboard.vue"
import CategoryShow from "../component/category/Show.vue"
import CategoryCreate from "../component/category/Create.vue"
import CategoryEdit from "../component/category/Edit.vue"
import PostCreate from "../component/blog/create.vue"
import PostView from "../component/blog/View.vue"
import PostEdit from "../component/blog/Edit.vue"

//---create router
const routes = [
    {
        path: "/",
        name: "Home",
        component: Home
    },
    {
        path: "/about",
        name: "About",
        component: About
    },
    {
        path: "/blog",
        name: "Blog",
        component: Blog,
    },
    {
        path: "/blog/:slug",
        name: "SingleBlog",
        component: SingleBlog,
        // props: true,
    },
    {
        path: "/contact",
        name: "Contact",
        component: Contact
    },
    {
        path: "/login",
        name: "Login",
        component: Login,
        meta: { requiresGuest: true }
    },
    {
        path: "/register",
        name: "Register",
        component: Register,
        meta: { requiresGuest: true }
    },
    //----dashboard all routes---
    {
        path: "/dashboard",
        name: "Dashboard",
        component: Dashboard,
        meta: { requiresAuth: true }
    },
    //--category
    {
        path: "/category",
        name: "CategoryShow",
        component:CategoryShow,
        meta: { requiresAuth: true}
    }, 
    {
        path: "/category/create",
        name: "CategoryCreate",
        component:CategoryCreate,
        meta: { requiresAuth: true}
    },
    {
        path: "/category/:id/edit",
        name: "CategoryEdit",
        component: CategoryEdit,
        meta: { requiresAuth:true },
        props: true,
    },

    //--category-end

    //---blogpost start
    {
        path: "/post/create",
        name: "PostCreate", 
        component: PostCreate,
        meta: {requiresAuth:true}
    },
    {
        path: "/post",
        name: "PostView", 
        component: PostView,
        meta: {requiresAuth:true}
    },
    {
        path : "/post/edit/:slug",
        name: "PostEdit",
        component : PostEdit,
        meta:{requiresAuth:true},
        props:true
    }

];
const router = createRouter({
    history: createWebHistory(),
    routes,
});

//----auth check ----
router.beforeEach((to, from) => {
    const authenticated = localStorage.getItem('authenticated');
    if (to.meta.requiresGuest && authenticated) {
        return {
            name: "Dashboard",
        }
    } 
    else if(to.meta.requiresAuth && !authenticated) {
        return {
            name: "Login",
        }
    }
})

export default router; 