<template>
    <!-- header -->
    <header class="header">
        <div class="header-text">
            <h1>Web Tutorial</h1>
            <h4>Creating a Dynamic and Interactive Website: A Comprehensive Web Tutorial</h4>
        </div>
        <div class="overlay"></div>
    </header>

    <h2 class="header-title">Latest Blog Posts</h2>
    <section class="cards-blog latest-blog">
        <div class="card-blog-content" v-for="post in posts">
            <img :src="post.image" alt="" />
            <p>
                {{ post.created_at }}
                <span style="float: right">Written By {{ post.user }}</span>
            </p>
            <h4 style="font-weight: bolder">
                <router-link :to="{name: 'SingleBlog', params:{slug: post.slug}}">{{ post.title }}</router-link>
            </h4>
        </div>
    </section>
</template>

<script>
export default {
    emits: ['updateSidebar'],
    data(){
        return{
            posts : [],
        }
    },
    mounted(){
        axios.get('/api/front/blog').then((res) => {
            this.posts = res.data.data;
        })
        .catch((error) =>{
            
        })
    }
}
</script>