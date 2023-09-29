<template>
    <div class="container">
        <div class="row">
            <div class="col-md-8 m-auto">
                <div class="card mt-5">
                    <div class="success-message" v-if="success">
                        <i class="fas fa-check"></i>
                        {{ success }}
                    </div>

                    <div class="error-message" v-if="error">
                        <i class="fas fa-exclamation"></i>
                        {{ error }}
                    </div>

                    <div class="card-header">
                        <router-link :to="{ name: 'CategoryShow' }" class="btn btn-sm btn-primary"><i
                                class="fas fa-arrow-left"></i> Back</router-link>
                    </div>
                    <div class="card-body">
                        <h3>Edit Category</h3>
                        <hr>
                        <form @submit.prevent="update">
                            <div class="mt-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" v-model="fields.name" class="form-control"
                                    placeholder="Category Name Here..">
                                <span v-if="errors.name" class="error_text">{{ errors.name[0] }}</span>
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
    props: ['id'],
    data() {
        return {
            fields: {},
            errors: {},
            success: '',
            error: '',
        }
    },
    mounted() {
        //get category edit data
        axios.get('/api/category/edit/' + this.id).then((res) => {
            console.log(res)
            this.fields = res.data.category;
        })
            .catch((error) => {
                if (error.response.status == 404) {
                    // console.log(error.response.data.message)
                    this.error = error.response.data.message;
                    //error message hide 
                    setInterval(() => {
                        this.error = '';
                    }, 3500)
                }
            })
    },
    methods: {
        update() {
            axios.put('/api/category/update/' + this.id, this.fields).then((res) => {
                // this.fields = {};
                this.errors = {};
                this.success = res.data.message;

                //---success message hide
                setInterval(() => {
                    this.success = '';
                }, 3500)
                // console.log(res)
            })
                //show error message
                .catch((error) => {
                    if (error.response.data.status == 422) {
                        this.errors = error.response.data.errors
                    }

                })
        }
    }

}
</script>