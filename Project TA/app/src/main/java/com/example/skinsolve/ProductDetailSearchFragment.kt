package com.example.skinsolve

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide

class ProductDetailSearchFragment : Fragment(), View.OnClickListener {
    private lateinit var ivProduct: ImageView
    private lateinit var tvName: TextView
    private lateinit var tvBrand: TextView
    private lateinit var tvType: TextView
    private lateinit var tvIngredients: TextView

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_product_detail, container, false)

        val mnBack: ImageView = view.findViewById(R.id.mnBack)
        mnBack.setOnClickListener(this)

        ivProduct = view.findViewById(R.id.ivProduct)
        tvName = view.findViewById(R.id.tvName)
        tvBrand = view.findViewById(R.id.tvBrand)
        tvType = view.findViewById(R.id.tvType)
        tvIngredients = view.findViewById(R.id.tvInredients)

        // Ambil data dari Bundle
        arguments?.let { bundle ->
            val nama = bundle.getString("nama")
            val gambar = bundle.getString("gambar")
            val brand = bundle.getString("brand")
            val tipe = bundle.getString("tipe")
            val komposisi = bundle.getString("komposisi")

            // Set data ke view
            tvName.text = nama
            tvBrand.text = brand
            tvType.text = tipe
            tvIngredients.text = komposisi

            // Load image dengan Glide
            Glide.with(this)
                .load(gambar)
                .placeholder(R.drawable.ic_launcher_background) // Sesuaikan placeholder
                .into(ivProduct)
        }

        return view
    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnBack) {
            parentFragmentManager.popBackStack()
        }
    }
}