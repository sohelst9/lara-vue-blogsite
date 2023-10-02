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
                        <router-link :to="{ name: 'CategoryCreate' }" class="btn btn-sm btn-primary"><i
                                class="fas fa-plus-square"></i> Add New</router-link>
                    </div>
                    <div class="card-body">
                        <h3 class="text-black">All Category</h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody v-if="categories.length > 0">
                                <tr v-for="(category, index) in categories">
                                    <td>{{ index + 1 }}</td>
                                    <td>{{ category.name }}</td>
                                    <td>
                                        <router-link :to="{ name: 'CategoryEdit', params: { id: category.id } }"
                                            class="text-primary me-3">
                                            <i class="fas fa-edit"></i>
                                        </router-link>
                                        <a href="#" @click="DeleteCategory(category.id)" class="text-danger">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>

                            </tbody>
                            <tbody v-else>
                                <tr>
                                    <td class="text-center" colspan="3">Loading..</td>
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
    data() {
        return {
            categories: {},
            success: '',
        }
    },
    mounted() {
        this.fetchCategory();
    },
    methods: {
        DeleteCategory(id) {
            if (confirm("Are You Sure, You want to delete this Data!")) {
                axios.delete('/api/category/delete/' + id).then((res) => {
                    this.success = res.data.message;
                    setInterval(() => {
                        this.success = '';
                    }, 3000)
                        this.fetchCategory();
                    // console.log(res.data.message)
                })
                    .catch((error) => {
                        console.log(error.response)
                    })
            }
        },
        fetchCategory() {
            axios.get('/api/category').then((res) => {
                this.categories = res.data.categories;
            })
        }
    }

}
</script>