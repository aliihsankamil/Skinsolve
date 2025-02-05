package com.example.skinsolve.model

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.skinsolve.Food
import com.example.skinsolve.Product
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class HomeViewModel : ViewModel() {

    private val _foods = MutableLiveData<List<Food>>()
    val foods: LiveData<List<Food>> get() = _foods

    private val _products = MutableLiveData<List<Product>>()
    val products: LiveData<List<Product>> get() = _products

    // Simulasikan pemanggilan API atau data retrieval
    fun fetchFoodRecommendations(userId: Int) {
        // Lakukan pemanggilan API disini atau gunakan data statis untuk testing
        RetrofitClient.apiService.getFoodRecommendations(userId).enqueue(object :
            Callback<List<Food>> {
            override fun onResponse(call: Call<List<Food>>, response: Response<List<Food>>) {
                if (response.isSuccessful) {
                    _foods.value = response.body()
                }
            }

            override fun onFailure(call: Call<List<Food>>, t: Throwable) {
                // Error handling
            }
        })
    }

    fun fetchProductRecommendations(userId: Int) {
        RetrofitClient.apiService.getProductRecommendations(userId).enqueue(object :
            Callback<List<Product>> {
            override fun onResponse(call: Call<List<Product>>, response: Response<List<Product>>) {
                if (response.isSuccessful) {
                    _products.value = response.body()
                }
            }

            override fun onFailure(call: Call<List<Product>>, t: Throwable) {
                // Error handling
            }
        })
    }
}