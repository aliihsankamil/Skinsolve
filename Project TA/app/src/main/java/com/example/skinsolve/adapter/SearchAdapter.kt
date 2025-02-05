package com.example.skinsolve.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.skinsolve.R
import com.example.skinsolve.model.SearchResult

class SearchAdapter(
    private var searchResults: List<SearchResult>,
    private val itemClickListener: OnItemClickListener
) : RecyclerView.Adapter<SearchAdapter.SearchViewHolder>() {

    interface OnItemClickListener {
        fun onItemClick(result: SearchResult)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SearchViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_search, parent, false)
        return SearchViewHolder(view)
    }

    override fun onBindViewHolder(holder: SearchViewHolder, position: Int) {
        val result = searchResults[position]
        holder.bind(result, itemClickListener)
    }

    override fun getItemCount(): Int = searchResults.size

    fun updateData(newResults: List<SearchResult>) {
        // Perbarui data dan beri tahu RecyclerView bahwa datanya telah berubah
        searchResults = newResults
        notifyDataSetChanged() // Pastikan data diperbarui dengan memanggil notifyDataSetChanged
    }

    inner class SearchViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val nameTextView: TextView = itemView.findViewById(R.id.tvName)
        private val tipe: TextView = itemView.findViewById(R.id.tvNutrition)
        private val imageView: ImageView = itemView.findViewById(R.id.ivImage)

        fun bind(result: SearchResult, ClickListener: OnItemClickListener) {
            // Set text pada TextView
            // Potong nama jika melebihi 15 karakter
            val maxLength = 10
            val truncatedName = if (result.nama.length > maxLength) {
                result.nama.substring(0, maxLength) + "..."
            } else {
                result.nama
            }

            nameTextView.text = truncatedName
            tipe.text = result.tipe


            // Muat gambar menggunakan Glide
            Glide.with(itemView.context)
                .load(result.gambar)
                .placeholder(R.drawable.ic_face) // Placeholder jika gambar belum dimuat
                .error(R.drawable.ic_launcher_background) // Gambar jika gagal dimuat
                .into(imageView)

            // Set click listener
            itemView.setOnClickListener {
                ClickListener.onItemClick(result)
            }
        }
    }
}