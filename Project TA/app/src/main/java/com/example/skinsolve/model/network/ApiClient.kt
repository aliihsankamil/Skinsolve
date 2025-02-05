package com.example.skinsolve.model.network

import com.example.skinsolve.model.ResponseLogin
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface ApiClient {

    @FormUrlEncoded
    @POST("api-skinsolve/login_service.php")
    fun login(
        @Field("post_email") email: String,
        @Field("post_password") password: String
    ): Call<ResponseLogin>

}