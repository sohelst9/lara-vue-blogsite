<template>
    <div class="container">
        <div class="row">
            <div class="col-md-8 m-auto">
                <div class="card mt-5">
                    <div class="success-message" v-if="success">
                        <i class="fas fa-check"></i>
                        {{ success }}
                    </div>
                    <div class="card-header">
                        <router-link :to="{ name: 'PostView' }" class="btn btn-sm btn-primary"><i
                                class="fas fa-arrow-left"></i> Back</router-link>
                    </div>
                    <div class="card-body">
                        <h3>Add New Post</h3>
                        <hr>
                        <form @submit.prevent="submit">
                            <div class="mt-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" v-model="fields.title" class="form-control"
                                    placeholder="Blog Post title Here..">
                                <span v-if="errors.title" class="error_text">{{ errors.title[0] }}</span>
                            </div>

                            <div class="mt-3">
                                <label for="meta_title" class="form-label">Meta Title</label>
                                <input type="text" v-model="fields.meta_title" class="form-control"
                                    placeholder="Blog Post meta title Here..">
                                <span v-if="errors.meta_title" class="error_text">{{ errors.meta_title[0] }}</span>
                            </div>

                            <div class="mt-3">
                                <label for="meta_description" class="form-label">Meta Description</label>
                                <input type="text" v-model="fields.meta_description" class="form-control"
                                    placeholder="Blog Post meta description Here..">
                                <span v-if="errors.meta_description" class="error_text">{{ errors.meta_description[0]
                                }}</span>
                            </div>

                            <div class="mt-3">
                                <label for="meta_keyword" class="form-label">Meta Keyword</label>
                                <input type="text" v-model="fields.meta_keyword" class="form-control"
                                    placeholder="Blog Post meta keyword Here..">
                                <span v-if="errors.meta_keyword" class="error_text">{{ errors.meta_keyword[0] }}</span>
                            </div>

                            <div class="mt-3">
                                <label for="image" class="form-label">Image <span class="text-danger">(1021*681)</span></label>
                                <input type="file" @input="inputImage" class="form-control">
                                <span v-if="errors.file" class="error_text">{{ errors.file[0] }}</span>
                                <div class="mt-2 preview_blog_image" v-if="url">
                                    <img :src="url" alt="">
                                </div>
                            </div>

                            <div class="mt-3">
                                <label for="category_id" class="form-label">Category</label>
                                <select v-model="fields.category_id" id="category_id" placeholder="select category"
                                    class="form-control">
                                    <option disabled value="">Select Category</option>
                                    <option :value="category.id" v-for="category  in categories" :key="category.id">{{
                                        category.name }}</option>
                                </select>
                                <span v-if="errors.category_id" class="error_text">{{ errors.category_id[0] }}</span>
                            </div>

                            <div class="mt-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea type="text" v-model="fields.description" class="form-control" rows="7"></textarea>
                                <span v-if="errors.description" class="error_text">{{ errors.description[0] }}</span>
                            </div>

                            <div class="mt-3 text-center">
                                <button class="btn btn-danger">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            fields: {
                category_id: '',
            },
            errors: {},
            success: '',
            url: '',
            categories: [],
        }
    },
    mounted() {
        axios.get('/api/category').then((res) => {
            // console.log(res.data.categories);
            this.categories = res.data.categories;
        })
    },
    methods: {
        inputImage(e) {
            const file = e.target.files[0];
            //---pass image file
            this.fields.file = file;
            //--image preview url 
            this.url = URL.createObjectURL(file);
            URL.revokeObjectURL(file);
            // console.log(e.target.files[0])
        },
        submit() {
            axios.post('/api/post/create', this.fields, {
                headers: { 'content-type': 'multipart/form-data' },
            }).then((res) => {
                // console.log(res.data.message)
                this.fields = {};
                this.errors = {};
                this.fields.category_id = '';
                this.fields.file = '';
                this.url = null;
                this.success = res.data.message;

                setInterval(()=>{
                    this.success = '';
                }, 3000)
            }).catch((error) => {
                this.errors = error.response.data.errors;
                if (error.response.status == 500) {
                    alert(error.response.data.message)
                }
                // console.log(error.response.data.errors)
            })
        }
    }

}
</script>