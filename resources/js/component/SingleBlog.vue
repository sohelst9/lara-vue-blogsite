<template>
  <section class="single-blog-post">
    <h1>{{ post.title }}</h1>

    <p class="time-and-author">
      {{ post.created_at }}
      <span>Written By {{ post.user }}</span>
    </p>

    <div class="single-blog-post-ContentImage" data-aos="fade-left">
      <img :src="`/${post.image}`" alt="" />
    </div>

    <div class="about-text">
      <p>
        {{ post.description }}
      </p>
    </div>
  </section>
  <section class="recommended">
    <p>Related</p>
    <div class="recommended-cards">
      <router-link v-for="relatedpost in related_post" :to="{name : 'SingleBlog', params: {slug: relatedpost.slug}}">
        <div class="recommended-card">
          <img :src="`/${relatedpost.image}`" alt="" loading="lazy" />
          <h4 class="mt-2">
            {{ relatedpost.title }}
          </h4>
        </div>
      </router-link> 

    </div>
  </section>
</template>

<script>
export default {
  // props:'[slug]',
  emits: ['updateSidebar'],
  data() {
    return {
      postId: '',
      post: {},
      related_post: [],
    }
  },
  mounted() {

    this.postId = this.$route.params.slug;
    //---single blog data--
    axios.get('/api/front/blog/' + this.postId).then((res) => {
      this.post = res.data.data;
      // console.log(res.data.data)
    }).catch((error) => {
      console.log(error)
    })

    //---related blog---
    axios.get('/api/front/related_blog/' + this.postId).then((res) => {
      console.log(res.data.data);
      this.related_post = res.data.data;
    })
      .catch((error) => {
        console.log(error)
      })
  }
}
</script>