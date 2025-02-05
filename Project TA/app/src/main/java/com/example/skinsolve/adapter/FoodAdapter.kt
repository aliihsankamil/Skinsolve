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

class FoodAdapter (
    private val foods: List<Food>,
    private val onItemClick: (Food) -> Unit
) : RecyclerView.Adapter<FoodAdapter.FoodViewHolder>() {

    inner class FoodViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val ivFoodImage: ImageView = itemView.findViewById(R.id.imgPhoto)
        val tvFoodName: TextView = itemView.findViewById(R.id.tvName)

        init {
            itemView.setOnClickListener {
                onItemClick(foods[adapterPosition])
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FoodViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_row_food, parent, false)
        return FoodViewHolder(view)
    }

    override fun onBindViewHolder(holder: FoodViewHolder, position: Int) {
        val food = foods[position]

        // Menggunakan Glide untuk memuat gambar
        Glide.with(holder.itemView.context)
            .load(food.gambar)  // Pastikan gambar adalah URL atau path
            .into(holder.ivFoodImage)

        holder.tvFoodName.text = food.nama
    }

    override fun getItemCount(): Int {
        return foods.size
    }
}