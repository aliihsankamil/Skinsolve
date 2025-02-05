package com.example.skinsolve.model.network

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitClient {

    private fun getRetrofitClient(): Retrofit {
        return Retrofit.Builder()
            .baseUrl("https://gqlxw8qw-80.asse.devtunnels.ms/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    val getInstance: ApiClient = getRetrofitClient().create(ApiClient::class.java)

    val apiService: ApiService = getRetrofitClient().create(ApiService::class.java)

}