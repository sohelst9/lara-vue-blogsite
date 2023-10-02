<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card mt-5">
                    <div class="success-message" v-if="success">
                        <i class="fas fa-check"></i>
                        {{ success }}
                    </div>
                    <div class="card-header">
                        <router-link :to="{ name: 'PostCreate' }" class="btn btn-sm btn-primary"><i
                                class="fas fa-plus-square"></i> Add New</router-link>
                    </div>
                    <div class="card-body">
                        <h3 class="text-black">All Post</h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ index+1 }}</td>
                                    <td>{{ post.title }}</td>
                                    <td>
                                        <img class="table_blog_image" :src="post.image" alt="">
                                    </td>
                                    <td>{{ post.category }}</td>
                                    <td>
                                        <a
                                            class="text-primary me-3">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="#" class="text-danger">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            success:'',
            posts: [],
        }
    }, 
    mounted(){
        axios.get('/api/front/blog').then((res) => {
            this.posts = res.data.data;
            console.log(res.data.data)
        }).catch((error) =>{
            console.log(error)
        })
    }
}
</script>