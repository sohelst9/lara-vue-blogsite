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
      <li><a href="">Health</a></li>
      <li><a href="">Entertainment</a></li>
      <li><a href="">Sports</a></li>
      <li><a href="">Nature</a></li>
    </ul>
  </div>
  <section class="cards-blog latest-blog">
    <div class="card-blog-content" v-for="blog in blogs" :key="blog.id">
      <router-link :to="{name: 'SingleBlog', params: {slug: blog.slug}}"><img :src="blog.image" alt="" /></router-link>
      
      <p>
        {{ blog.created_at }}
        <span>Written By {{ blog.user }}</span>
      </p>
      <h4>
        <router-link :to="{name: 'SingleBlog', params: {slug: blog.slug}}">{{ blog.title }}</router-link>
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
  data(){
    return {
      blogs:[],
    }
  },
  mounted(){
    axios.get('/api/front/all-blogs').then((res) =>{
      // console.log(res.data.data);
      this.blogs = res.data.data;
    }).catch((error) => {
      console.log(error)
    })
  }
}
</script>