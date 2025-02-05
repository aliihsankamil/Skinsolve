package com.example.skinsolve

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide

class FoodInformationFragment : Fragment(), View.OnClickListener {

    private lateinit var food: Food

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            food = it.getParcelable("food")!!
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_food_information, container, false)

        val mnBack: ImageView = view.findViewById(R.id.mnBack)
        mnBack.setOnClickListener(this)

        // Display product details using the 'food' object
        val foodNameTextView = view.findViewById<TextView>(R.id.tvName)
        val foodNutrisiTextView = view.findViewById<TextView>(R.id.nutrition)
        val foodKeuntunganTextView = view.findViewById<TextView>(R.id.tvBenefits)
        val foodImageView = view.findViewById<ImageView>(R.id.ivFood)

        // Set the text views with product data
        foodNameTextView.text = food.nama
        foodNutrisiTextView.text = food.nutrisi
        foodKeuntunganTextView.text = food.manfaat

        // Load the product image using Glide or any other image loading library
        Glide.with(this)
            .load(food.gambar) // Assuming the product object has an imageUrl field
            .into(foodImageView)

        return view
    }

    companion object {
        fun newInstance(food: Food) = FoodInformationFragment().apply {
            arguments = Bundle().apply {
                putParcelable("food", food)
            }
        }
    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnBack) {
            parentFragmentManager.popBackStack()
        }
    }
}