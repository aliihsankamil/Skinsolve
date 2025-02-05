package com.example.skinsolve.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.skinsolve.Food
import com.example.skinsolve.R

class FoodRecomAdapter (
    private val foods: List<Food>,
    private val onItemClick: (Food) -> Unit
) : RecyclerView.Adapter<FoodRecomAdapter.FoodViewHolder>() {

    inner class FoodViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val ivFoodImage: ImageView = itemView.findViewById(R.id.ivImage)
        val tvFoodName: TextView = itemView.findViewById(R.id.tvName)
        val tvFoodNutrition: TextView = itemView.findViewById(R.id.tvNutrition)

        init {
            itemView.setOnClickListener {
                onItemClick(foods[adapterPosition])
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FoodViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_recommendation_row, parent, false)
        return FoodViewHolder(view)
    }

    override fun onBindViewHolder(holder: FoodViewHolder, position: Int) {
        val food = foods[position]

        // Menggunakan Glide untuk memuat gambar
        Glide.with(holder.itemView.context)
            .load(food.gambar)  // Pastikan gambar adalah URL atau path
            .into(holder.ivFoodImage)

        holder.tvFoodName.text = food.nama
        holder.tvFoodNutrition.text = food.nutrisi
    }

    override fun getItemCount(): Int {
        return foods.size
    }
}