package com.example.skinsolve.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.fragment.app.FragmentActivity
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.skinsolve.ImageDialogFragment
import com.example.skinsolve.R
import com.example.skinsolve.model.network.ApiService

class SkinAdapter(private val skinList: List<ApiService.SkinProgress>) :
    RecyclerView.Adapter<SkinAdapter.SkinViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SkinViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_foodskin, parent, false)
        return SkinViewHolder(view)
    }

    override fun onBindViewHolder(holder: SkinViewHolder, position: Int) {
        val skinProgress = skinList[position]

        // Menampilkan gambar menggunakan Glide
        Glide.with(holder.itemView.context)
            .load("https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/" + skinProgress.gambar_wajah)
            .into(holder.imageView)

        // Set listener untuk menampilkan gambar besar saat diklik
        holder.imageView.setOnClickListener {
            val activity = it.context as FragmentActivity
            ImageDialogFragment.newInstance("https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/" + skinProgress.gambar_wajah)
                .show(activity.supportFragmentManager, "image_dialog")
        }
    }

    override fun getItemCount(): Int = skinList.size

    class SkinViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val imageView: ImageView = itemView.findViewById(R.id.imgFood)
    }
}
