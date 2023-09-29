<script setup>
</script>
<template>
    <div class="main">
        <h3>Dashboard</h3>
        <h4>Welcome {{ data.name }}</h4>
        <h4>Email : {{ data.email }}</h4>
        <div class="row">
            <div class="item">
            <li><a href="">Dashboard</a></li>
            <li><router-link :to="{name:'CategoryShow'}">Category List</router-link></li>
            <li><router-link :to="{name: 'PostView'}">Blog Post List</router-link></li>
            <li><a href="">User List</a></li>
            <li><a href="">My Profile</a></li>
            <li><a href="#" @click="logout">LogOut</a></li>
        </div>
        </div>

    </div>
</template>
<script>
export default {
    data(){
        return{
            data:{}
        }
    },
    mounted() {
        //----user login and get this user data and show dashboard---
        axios.get('/api/user')
        .then((res) => {
            this.data = res.data;
        })
        .catch((error) => {
            if(error.response.status == 401){
                //----login session timeout end and authenticated removed----
                this.$emit('updateSidebar')
                localStorage.removeItem('authenticated')
                this.$router.push({name: "Login"})
                console.log(error.response.status)
            }
            
        })
    },
    methods:{
        //---user logout
        logout(){
            axios.post('/api/logout').then((res) => {
                //----logout success and authenticated removed and update sidebar ---
                console.log('success')
                this.$router.push({name: "Home"})
                localStorage.removeItem('authenticated')
                this.$emit('updateSidebar')
            })
            .catch((error) => {
                console.log(error)
            })
        }
    }
}
</script>

<style scoped>
.main {
    line-height: 1.6;
    min-height: 320px;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0;
    padding: 10px 20px;
    margin-top: 120px;
    border: 2px solid red;
    background-color: aliceblue;
}
.item li{
    list-style: none;
    padding: 5px 15px;
}
.item li a{
    color: rgb(2, 2, 2);
}
</style>