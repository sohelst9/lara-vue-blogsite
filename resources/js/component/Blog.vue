<template>
  <h2 class="header-title">All Blog Posts</h2>
  <div class="searchbar">
    <form action="">
      <input type="text" placeholder="Search..." name="search" />

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

    <!-- pagination -->
    <div class="pagination" id="pagination">
      <a href="">&laquo;</a>
      <a class="active" href="">1</a>
      <a href="">2</a>
      <a href="">3</a>
      <a href="">4</a>
      <a href="">5</a>
      <a href="">&raquo;</a>
    </div>
  </section>
</template>

<script>
export default {
  emits: ['updateSidebar'],
  data() {
    return {
      blogs: [],
      categories: []
    }
  },
  methods: {
    filterCategoryPost(name) {
      axios.get('/api/front/all-blogs', {
        params: { category: name },
      }).then((res) => {
        console.log(res.data.blogs)
        this.blogs = res.data.blogs;
      }).catch((error) => {
        console.log('Post Not Found')
      })
    },
    //---all-blog
    allBlog() {
      axios.get('/api/front/all-blogs').then((res) => {
        // console.log(res.data.categories);
        this.categories = res.data.categories;
        this.blogs = res.data.blogs;
      }).catch((error) => {
        console.log(error)
      })
    }
  },
  mounted() {
    //fetch all blogs---
    this.allBlog();
  }
}
</script>