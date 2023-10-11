<template>
  <h2 class="header-title">All Blog Posts</h2>
  <div class="searchbar">
    <form action="">
      <input type="text" placeholder="Search..." v-model="search" />

      <button type="submit">
        <i class="fa fa-search"></i>
      </button>

    </form>
  </div>
  <div class="categories">
    <ul>
      <li><a href="#" @click="allBlog">All</a></li>
      <li v-for="category in categories" :key="category.id"><a href="#" @click="filterCategoryPost(category.name)">{{
        category.name }}</a></li>
    </ul>
  </div>
  <section class="cards-blog latest-blog">
    <div class="card-blog-content" v-for="blog in blogs" :key="blog.id">
      <router-link :to="{ name: 'SingleBlog', params: { slug: blog.slug } }"><img :src="blog.image"
          alt="" /></router-link>

      <p>
        {{ blog.created_at }}
        <span>Written By {{ blog.user }}</span>
      </p>
      <span>Category : {{ blog.category }}</span>
      <h4>
        <router-link :to="{ name: 'SingleBlog', params: { slug: blog.slug } }">{{ blog.title }}</router-link>
      </h4>
    </div>
  </section>
  <h3 class="text-center" v-if="!blogs.length">Uffs Blog Post Not Found</h3>
  <section>
    <!-- pagination -->
    <div class="pagination" id="pagination">
      <a 
      href="#"
      v-for="(link, index) in links"
      :key="index"
      v-html="link.label"
      :class="{active : link.active, disable_paginate_btn: !link.url}"
      @click="changeBlogPage(link)"
      ></a>
    </div>
  </section>
</template>

<script>
export default {
  emits: ['updateSidebar'],
  data() {
    return {
      blogs: [],
      categories: [],
      search: '',
      links : []
    }
  },

  watch : {
    search(){
        axios.get('/api/front/all-blogs', {
          params : { search : this.search },
        }).then((res) => {
          this.blogs = res.data.data;
          this.links = res.data.meta.links;
          console.log(res)
        }).catch((error) => {
          console.log(error);
        })
    }
  },

  methods: {
    filterCategoryPost(name) {
      axios.get('/api/front/all-blogs', {
        params: { category: name },
      }).then((res) => {
        this.blogs = res.data.data;
        this.links = res.data.meta.links;
        // console.log(res)
      }).catch((error) => {
        console.log('Post Not Found')
      })
    },

    //---all-blog
    allBlog() {
      axios.get('/api/front/all-blogs').then((res) => {
        this.blogs = res.data.data;
        this.links = res.data.meta.links;
        console.log(res);
      }).catch((error) => {
        console.log(error)
      })
    },
    allCategory(){
      axios.get('/api/front/categories').then((res) => {
        this.categories = res.data;
        // console.log(res);
      }).catch((error) => {
        console.log(error)
      })
    },
    //--pagination
    changeBlogPage(link) {
      if(!link.url || link.active){
        return;
      }
      axios.get(link.url).then((res) => {
        this.blogs = res.data.data;
        this.links = res.data.meta.links;
        console.log(res);
      }).catch((error) => {
        console.log(error)
      })
    }
  },

  mounted() {
    //fetch all blogs---
    this.allBlog();
    this.allCategory();
  }
}
</script>