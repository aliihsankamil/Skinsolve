package com.example.skinsolve

import android.content.Context
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.skinsolve.adapter.SkinAdapter
import com.example.skinsolve.adapter.TrackingAdapter
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class TrackingFragment : Fragment() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var trackingAdapter: TrackingAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_tracking, container, false)
        recyclerView = view.findViewById(R.id.recyclerViewTracking)

        recyclerView.layoutManager = LinearLayoutManager(context)

        // Fetch data and set adapter
        fetchTrackingData()

        return view
    }

    private fun fetchTrackingData() {
        val apiService = RetrofitClient.apiService

        val sharedPref = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPref.getInt("user_id", -1)
        val call = apiService.getTrackingProgress(id_user = userId)

        call.enqueue(object : Callback<ApiService.ProgressResponse> {
            override fun onResponse(call: Call<ApiService.ProgressResponse>, response: Response<ApiService.ProgressResponse>) {
                if (response.isSuccessful) {
                    val progressData = response.body()?.data ?: emptyList()
                    trackingAdapter = TrackingAdapter(progressData)
                    recyclerView.adapter = trackingAdapter
                } else {
                    // Handle unsuccessful response
                    Log.e("TrackingFragment", "Response unsuccessful: ${response.message()}")
                }
            }

            override fun onFailure(call: Call<ApiService.ProgressResponse>, t: Throwable) {
                // Handle failure
                Log.e("TrackingFragment", "Request failed: ${t.message}", t)
            }
        })
    }
}

