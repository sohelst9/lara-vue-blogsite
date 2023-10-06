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
                        <h3>Edit Post</h3>
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
    props: ['slug'],
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
        //get all category
        axios.get('/api/category').then((res) => {
            // console.log(res.data.categories);
            this.categories = res.data.categories;
        }).catch((error) => {
            console.log(error);
        })
        //--get single blog data ----
        axios.get('/api/post/edit/' + this.slug).then((res) => {
            this.fields = res.data;
            this.url = '/' + res.data.image;
        }).catch((error) => {
            console.log(error);
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
            //---form data object create--
            const formData = new FormData();
            formData.append('title', this.fields.title);
            formData.append('meta_title', this.fields.meta_title);
            formData.append('meta_keyword', this.fields.meta_keyword);
            formData.append('meta_description', this.fields.meta_description);
            if(this.fields.file){
                formData.append('file', this.fields.file);
            }
            formData.append('category_id', this.fields.category_id);
            formData.append('description', this.fields.description);
            formData.append('_method', 'PUT');
            axios.post('/api/post/update/' + this.slug, formData, {
                headers: { 'content-type': 'multipart/form-data' },
            }).then((res) => {
                console.log(res.data)
                this.errors = {};
                //success message show index page
                const success = res.data.message;
                this.$router.push({name: 'PostView', query: {success}});
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