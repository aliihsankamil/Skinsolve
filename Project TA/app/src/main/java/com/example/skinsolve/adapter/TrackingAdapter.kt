package com.example.skinsolve.adapter

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.skinsolve.R
import com.example.skinsolve.model.network.ApiService

class TrackingAdapter(private val progressList: List<ApiService.ProgressData>) :
    RecyclerView.Adapter<TrackingAdapter.TrackingViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TrackingViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_tracking, parent, false)
        return TrackingViewHolder(view)
    }

    override fun onBindViewHolder(holder: TrackingViewHolder, position: Int) {
        val progressData = progressList[position]
        holder.bind(progressData)
    }

    override fun getItemCount(): Int = progressList.size

    inner class TrackingViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val tvDate: TextView = itemView.findViewById(R.id.tvDate)
        private val rvWajah: RecyclerView = itemView.findViewById(R.id.rv_wajah)
        private val rvFoodProduct: RecyclerView = itemView.findViewById(R.id.rv_foodproduct)

        fun bind(progressData: ApiService.ProgressData) {
            tvDate.text = progressData.tanggal

            // Set adapter untuk skin progress
            val skinAdapter = SkinAdapter(progressData.skin_progress)
            rvWajah.layoutManager = LinearLayoutManager(itemView.context, LinearLayoutManager.HORIZONTAL, false)
            rvWajah.adapter = skinAdapter

            // Set adapter untuk food progress
            val foodAdapter = FoodAdapter2(progressData.food_progress)
            rvFoodProduct.layoutManager = LinearLayoutManager(itemView.context, LinearLayoutManager.HORIZONTAL, false)
            rvFoodProduct.adapter = foodAdapter

        }
    }
}

