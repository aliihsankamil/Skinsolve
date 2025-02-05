package com.example.skinsolve

import android.content.Context
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.fragment.app.activityViewModels
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.skinsolve.adapter.FoodAdapter
import com.example.skinsolve.adapter.FoodRecomAdapter
import com.example.skinsolve.adapter.ProductAdapter
import com.example.skinsolve.model.HomeViewModel

class FoodRecommendationFragment : Fragment(), View.OnClickListener {

    // Inisialisasi ViewModel
    private val homeViewModel: HomeViewModel by activityViewModels()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_food_recommendation, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val recyclerView: RecyclerView = view.findViewById(R.id.rv_recomFood)
        recyclerView.layoutManager = LinearLayoutManager(context, LinearLayoutManager.VERTICAL, false)
        val mnBack: ImageView = view.findViewById(R.id.mnBack)
        mnBack.setOnClickListener(this)

        // Ambil user ID dari SharedPreferences
        val sharedPref = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPref.getInt("user_id", -1)

        // Observasi data dari ViewModel
        homeViewModel.foods.observe(viewLifecycleOwner) { foods ->
            val adapter = FoodRecomAdapter(foods) { selectedFood ->
                val foodDetailFragment = FoodInformationFragment.newInstance(selectedFood)
                parentFragmentManager.beginTransaction()
                    .replace(R.id.container, foodDetailFragment)
                    .addToBackStack(null)
                    .commit()
            }
            recyclerView.adapter = adapter
        }

        // Panggil data hanya jika LiveData kosong, untuk menghindari pemanggilan berulang
        if (homeViewModel.foods.value == null) {
            homeViewModel.fetchFoodRecommendations(userId)
        }

    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnBack) {
            val homeFragment = HomeFragment()
            val fragmentManager = parentFragmentManager
            fragmentManager.beginTransaction().apply {
                replace(R.id.container, homeFragment, HomeFragment::class.java.simpleName)
                addToBackStack(null)
                commit()
            }
        }
    }

}