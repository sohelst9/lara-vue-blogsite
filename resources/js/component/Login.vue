<template>
    <div class="main">
        <h1 class="auth_title">Login Here</h1>
        <form class="auth_form" @submit.prevent="submit">
            <div class="form_row">
                <label for="email">Email</label>
                <input type="email" v-model="fields.email" autocomplete="off" placeholder="email@example.com">
                <span class="error_text" v-if="errors.email">{{ errors.email[0] }}</span>
            </div>
            <div class="form_row">
                <label for="password">Password</label>
                <input type="password" v-model="fields.password">
                <span class="error_text" v-if="errors.password">{{ errors.password[0] }}</span>
            </div>
            <button type="submit" class="auth_submit_btn">Login</button>
            <p class="auth_footer_text">Don't Have Account <router-link class="signup" :to="{name: 'Register'}">SignUp</router-link></p>
        </form>
    </div>
</template>

<script>
export default {
    data(){
        return{
            fields: {},
            errors: {},
        }
    },
    methods: {
        submit(){
            axios.post('api/login', this.fields).then(() =>{
                //---user login success and authenticated set true  and update sidebar item---
                this.$router.push({name: "Dashboard"})
                localStorage.setItem('authenticated', 'true')
                this.$emit('updateSidebar')
            })
            .catch((error) =>{
                //---login error data
                this.errors = error.response.data.errors 
                console.log(error.response.data.errors)
            })
        }
    }
}
</script>

<style scoped>
.main {
    line-height: 1.6;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0;
    padding: 0;
}

.auth_title {
    margin-top: 48px;
    color: white;
}

.auth_form {
    background: #fff;
    max-width: 360px;
    width: 100%;
    padding: 58px 44px;
    border: 1px solid #e1e2f0;
    border-radius: 4px;
    box-shadow: 0 0 5px 0 rgba(42, 45, 48, 0.12);
    transition: all 0.3s ease;
}

.form_row {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}

.form_row label {
    font-size: 13px;
    color: #8086a9;
}

.form_row input {
    flex: 1;
    padding: 13px;
    border: 1px solid #d6d8e6;
    border-radius: 4px;
    font-size: 16px;
    transition: all 0.2s ease-out;
}

.form_row input:focus {
    outline: none;
    box-shadow: inset 2px 2px 5px 0 rgba(42, 45, 48, 0.12);
}

.form_row input::placeholder {
    color: #C8CDDF;
}

.auth_submit_btn {
    width: 100%;
    padding: 12px;
    font-size: 18px;
    background: orangered;
    color: #fff;
    border: none;
    border-radius: 100px;
    cursor: pointer;
    font-family: 'Open Sans', sans-serif;
    margin-top: 15px;
    transition: background 0.2s ease-out;
}

.auth_submit_btn:hover {
    background: #55D3AC;
}

.auth_footer_text{
    margin-top: 8px;
}
.signup{
    color: orangered;
}

@media(max-width: 458px) {

    .auth_form {
        background: #f9faff;
        border: none;
        box-shadow: none;
        padding: 20px 0;
    }

}
</style>