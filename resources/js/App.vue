<template>
  <div id="wrapper">
    <!-- sidebar -->
    <div class="sidebar" :class="{sidebar_show : showSidebar}">
      <span class="closeButton" @click="CrossButtonIcon">&times;</span>
      <p class="brand-title">Web Tutorial</p>

      <div class="side-links">
        <ul>
          <li><router-link @click="CrossButtonIcon" :to="{ name: 'Home' }">Home</router-link></li>
          <li><router-link @click="CrossButtonIcon" :to="{ name: 'Blog' }">Blog</router-link></li>
          <li><router-link @click="CrossButtonIcon" :to="{ name: 'About' }">About</router-link></li>
          <li><router-link @click="CrossButtonIcon" :to="{ name: 'Contact' }">Contact</router-link></li>
          <li v-if="!logedIn"><router-link @click="CrossButtonIcon" :to="{ name: 'Login' }">Login</router-link></li>
          <li v-if="!logedIn"><router-link @click="CrossButtonIcon" :to="{ name: 'Register' }">Register</router-link></li>
          <li v-if="logedIn"><router-link @click="CrossButtonIcon" :to="{ name: 'Dashboard' }">Dashboard</router-link></li>
        </ul>
      </div>

      <!-- sidebar footer -->
      <footer class="sidebar-footer">
        <div>
          <a href=""><i class="fab fa-facebook-f"></i></a>
          <a href=""><i class="fab fa-instagram"></i></a>
          <a href=""><i class="fab fa-twitter"></i></a>
        </div>

        <small>&copy; 2023 Web Tutorial</small>
      </footer>
    </div>
    <!-- Menu Button -->
    <div class="menuButton" @click="SidebarShowButton">
      <div class="bar"></div>
      <div class="bar"></div>
      <div class="bar"></div>
    </div>

    <!-- main -->
    <main class="container">
      <!----render components depending on the page visited-->
      <router-view @update-Sidebar="updateSidebar" :key="$route.path"></router-view>
    </main>

    <!-- Main footer -->
    <footer class="main-footer">
      <div>
        <a href=""><i class="fab fa-facebook-f"></i></a>
        <a href=""><i class="fab fa-instagram"></i></a>
        <a href=""><i class="fab fa-twitter"></i></a>
      </div>
      <small>&copy; 2023 Web Tutorial</small>
    </footer>

  </div>
</template>

<script>
export default
  {
    data() {
      return {
        showSidebar : false,
        logedIn : false,
      };
    }, 
    methods: {
      //---small divice click button and show sidebar
      SidebarShowButton(){
        this.showSidebar = true;
      }, 
      //---small divice click button and hide sidebar
      CrossButtonIcon(){
        this.showSidebar = false;
      },
      //---login and logout then update sidebar item show hide
      updateSidebar(){
          this.logedIn = !this.logedIn;
      }
    },
    //---login and logout then update sidebar item show hide
    mounted(){
      if(localStorage.getItem('authenticated')){
        // console.log(true)
        this.logedIn = true;
      }else{
        this.logedIn = false;
        // console.log(false)
      }
       //----user login and get this user data and show dashboard---
       axios.get('/api/user')
        .then((res) => {
        })
        .catch((error) => {
            if(error.response.status == 401){
                //----login session timeout end and authenticated removed----
                this.$emit('updateSidebar')
                localStorage.removeItem('authenticated')
                console.log(error.response.status) 
            }
        })
    }
  }
</script>

<style scoped>
.sidebar_show {
  width: 100%;
  z-index: 5;
}
</style>