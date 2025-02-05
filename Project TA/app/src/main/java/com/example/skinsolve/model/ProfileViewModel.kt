package com.example.skinsolve.model

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response


class ProfileViewModel : ViewModel() {

    private val _userData = MutableLiveData<ApiService.UserData?>()
    val userData: LiveData<ApiService.UserData?> = _userData

    fun loadUserProfile(userId: Int) {
        if (userId == -1) {
            _userData.value = null
            return
        }

        val apiService = RetrofitClient.apiService
        val call = apiService.getProfile(userId)

        call.enqueue(object : Callback<ApiService.UserResponse> {
            override fun onResponse(call: Call<ApiService.UserResponse>, response: Response<ApiService.UserResponse>) {
                if (response.isSuccessful) {
                    _userData.value = response.body()?.data
                } else {
                    _userData.value = null
                }
            }

            override fun onFailure(call: Call<ApiService.UserResponse>, t: Throwable) {
                _userData.value = null
            }
        })
    }
}
