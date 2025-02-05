package com.example.skinsolve

import android.content.Context
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.activityViewModels
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.skinsolve.adapter.FoodAdapter
import com.example.skinsolve.adapter.ProductAdapter
import com.example.skinsolve.model.HomeViewModel
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class HomeFragment : Fragment(), View.OnClickListener {

    // Inisialisasi ViewModel
    private val homeViewModel: HomeViewModel by activityViewModels()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val btnFoodRecom: TextView = view.findViewById(R.id.tvLinkFoodRecom)
        btnFoodRecom.setOnClickListener(this)
        val btnProductRecom: TextView = view.findViewById(R.id.tvLinkProductRecom)
        btnProductRecom.setOnClickListener(this)
        val btnPantauMakanan: TextView = view.findViewById(R.id.addFpButton)
        btnPantauMakanan.setOnClickListener(this)
        val btnPantauWajah: TextView = view.findViewById(R.id.addSkinButton)
        btnPantauWajah.setOnClickListener(this)

        val recyclerView: RecyclerView = view.findViewById(R.id.rv_recom_food)
        recyclerView.layoutManager = LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false)
        val recyclerView2: RecyclerView = view.findViewById(R.id.rv_recom_product)
        recyclerView2.layoutManager = LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false)

        // Ambil user ID dari SharedPreferences
        val sharedPref = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPref.getInt("user_id", -1)

        // Observasi data dari ViewModel
        homeViewModel.foods.observe(viewLifecycleOwner) { foods ->
            val adapter = FoodAdapter(foods) { selectedFood ->
                val foodDetailFragment = FoodInformationFragment.newInstance(selectedFood)
                parentFragmentManager.beginTransaction()
                    .replace(R.id.container, foodDetailFragment)
                    .addToBackStack(null)
                    .commit()
            }
            recyclerView.adapter = adapter
        }

        homeViewModel.products.observe(viewLifecycleOwner) { products ->
            val adapter2 = ProductAdapter(products) { selectedProduct ->
                val productDetailFragment = ProductDetailFragment.newInstance(selectedProduct)
                parentFragmentManager.beginTransaction()
                    .replace(R.id.container, productDetailFragment)
                    .addToBackStack(null)
                    .commit()
            }
            recyclerView2.adapter = adapter2
        }

        // Panggil data hanya jika LiveData kosong, untuk menghindari pemanggilan berulang
        if (homeViewModel.foods.value == null) {
            homeViewModel.fetchFoodRecommendations(userId)
        }

        if (homeViewModel.products.value == null) {
            homeViewModel.fetchProductRecommendations(userId)
        }
    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.tvLinkFoodRecom) {
            val foodRecom = FoodRecommendationFragment()
            val fragmentManager = parentFragmentManager
            fragmentManager.beginTransaction().apply {
                replace(R.id.container, foodRecom, FoodRecommendationFragment::class.java.simpleName)
                addToBackStack(null)
                commit()
            }
        } else if (v?.id == R.id.tvLinkProductRecom) {
            val productRecom = ProductRecommendationFragment()
            val fragmentManager = parentFragmentManager
            fragmentManager.beginTransaction().apply {
                replace(R.id.container, productRecom, ProductRecommendationFragment::class.java.simpleName)
                addToBackStack(null)
                commit()
            }
        } else if (v?.id == R.id.addFpButton) {
            val foodTrackerFragment = FoodTrackerFragment()
            val fragmentManager = parentFragmentManager
            fragmentManager.beginTransaction().apply {
                replace(R.id.container, foodTrackerFragment, FoodTrackerFragment::class.java.simpleName)
                addToBackStack(null)
                commit()
            }
        } else if (v?.id == R.id.addSkinButton) {
            val productTrackerFragment = ProductTrackerFragment()
            val fragmentManager = parentFragmentManager
            fragmentManager.beginTransaction().apply {
                replace(R.id.container, productTrackerFragment, ProductTrackerFragment::class.java.simpleName)
                addToBackStack(null)
                commit()
            }
        }
    }

}
