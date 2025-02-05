package com.example.skinsolve.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.skinsolve.Product
import com.example.skinsolve.R

class ProductAdapter (
    private val products: List<Product>,
    private val onItemClick: (Product) -> Unit
): RecyclerView.Adapter<ProductAdapter.ProductViewHolder>() {

    inner class ProductViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val ivProductImage: ImageView = itemView.findViewById(R.id.imgPhoto)
        val tvProductName: TextView = itemView.findViewById(R.id.tvName)

        init {
            itemView.setOnClickListener {
                onItemClick(products[adapterPosition])
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProductViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_row_food, parent, false)
        return ProductViewHolder(view)
    }

    override fun onBindViewHolder(holder: ProductViewHolder, position: Int) {
        val product = products[position]

        // Menggunakan Glide untuk memuat gambar
        Glide.with(holder.itemView.context)
            .load(product.gambar)  // Pastikan gambar adalah URL atau path
            .into(holder.ivProductImage)

        // Potong nama jika melebihi 15 karakter
        val maxLength = 10
        val truncatedName = if (product.nama.length > maxLength) {
            product.nama.substring(0, maxLength) + "..."
        } else {
            product.nama
        }

        holder.tvProductName.text = truncatedName
    }

    override fun getItemCount(): Int {
        return products.size
    }
}