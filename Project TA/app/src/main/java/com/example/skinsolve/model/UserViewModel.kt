package com.example.skinsolve.model

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class UserViewModel : ViewModel() {

    private val _userProfile = MutableLiveData<ApiService.UserData?>()
    val userProfile: LiveData<ApiService.UserData?> = _userProfile

    private val _error = MutableLiveData<String?>()
    val error: LiveData<String?> = _error

    fun loadUserProfile(userId: Int) {
        viewModelScope.launch {
            val apiService = RetrofitClient.apiService
            val call = apiService.getProfile(userId)

            call.enqueue(object : Callback<ApiService.UserResponse> {
                override fun onResponse(call: Call<ApiService.UserResponse>, response: Response<ApiService.UserResponse>) {
                    if (response.isSuccessful) {
                        _userProfile.value = response.body()?.data
                    } else {
                        _error.value = "Failed to load profile"
                    }
                }

                override fun onFailure(call: Call<ApiService.UserResponse>, t: Throwable) {
                    _error.value = "Error: ${t.message}"
                }
            })
        }
    }

    fun clearError() {
        _error.value = null
    }
}
