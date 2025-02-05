package com.example.skinsolve

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.skinsolve.adapter.SearchAdapter
import com.example.skinsolve.model.SearchResult
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class SearchFragment : Fragment() {

    private lateinit var searchInput: EditText
    private lateinit var searchButton: Button
    private lateinit var recyclerView: RecyclerView
    private lateinit var adapter: SearchAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate layout
        val view = inflater.inflate(R.layout.fragment_search, container, false)

        searchInput = view.findViewById(R.id.searchInput)
        searchButton = view.findViewById(R.id.searchButton)
        recyclerView = view.findViewById(R.id.recyclerView)

        // Inisialisasi LinearLayoutManager untuk RecyclerView
        recyclerView.layoutManager = LinearLayoutManager(context)

        // Inisialisasi adapter dengan listener klik
        adapter = SearchAdapter(listOf(), object : SearchAdapter.OnItemClickListener {
            override fun onItemClick(result: SearchResult) {
                Log.d("SearchFragment", "Item clicked: ${result.nama}")

                // Pastikan data tidak null sebelum dikirim
                val bundle = Bundle().apply {
                    putString("nama", result.nama)
                    putString("gambar", result.gambar)
                    putString("brand", result.brand ?: "Unknown") // Default jika null
                    putString("tipe", result.tipe ?: "Unknown")   // Default jika null
                    putString("komposisi", result.komposisi ?: "Unknown") // Default jika null
                }

                val ProductDetailSearchFragment = ProductDetailSearchFragment()
                ProductDetailSearchFragment.arguments = bundle

                // Ganti fragment dengan fragment detail produk
                parentFragmentManager.beginTransaction()
                    .replace(R.id.container, ProductDetailSearchFragment)
                    .addToBackStack(null)
                    .commit()
            }
        })

        recyclerView.adapter = adapter

        // Tombol pencarian
        searchButton.setOnClickListener {
            val query = searchInput.text.toString()
            if (query.isNotEmpty()) {
                search(query)
            }
        }

        return view
    }

    private fun search(query: String) {
        RetrofitClient.apiService.search(query).enqueue(object : Callback<List<SearchResult>> {
            override fun onResponse(
                call: Call<List<SearchResult>>,
                response: Response<List<SearchResult>>
            ) {
                if (response.isSuccessful) {
                    val results = response.body() ?: listOf()
                    adapter.updateData(results)  // Update data RecyclerView
                } else {
                    Log.e("FragmentSearch", "Response failed: ${response.errorBody()?.string()}")
                }
            }

            override fun onFailure(call: Call<List<SearchResult>>, t: Throwable) {
                Log.e("FragmentSearch", "Error: ${t.message}")
            }
        })
    }

}