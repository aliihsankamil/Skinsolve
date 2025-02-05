package com.example.skinsolve

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide

class ProductDetailFragment : Fragment(), View.OnClickListener {

    private lateinit var product: Product

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            product = it.getParcelable("product")!!
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_product_detail, container, false)

        val mnBack: ImageView = view.findViewById(R.id.mnBack)
        mnBack.setOnClickListener(this)

        // Display product details using the 'product' object
        val productNameTextView = view.findViewById<TextView>(R.id.tvName)
        val productBrandTextView = view.findViewById<TextView>(R.id.tvBrand)
        val productTypeTextView = view.findViewById<TextView>(R.id.tvType)
        val productIngredientsTextView = view.findViewById<TextView>(R.id.tvInredients)
        val productImageView = view.findViewById<ImageView>(R.id.ivProduct)

        // Set the text views with product data
        productNameTextView.text = product.nama
        productBrandTextView.text = product.brand
        productTypeTextView.text = product.tipe
        productIngredientsTextView.text = product.komposisi

        // Load the product image using Glide or any other image loading library
        Glide.with(this)
            .load(product.gambar) // Assuming the product object has an imageUrl field
            .into(productImageView)

        return view
    }

    companion object {
        fun newInstance(product: Product) = ProductDetailFragment().apply {
            arguments = Bundle().apply {
                putParcelable("product", product)
            }
        }
    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnBack) {
            parentFragmentManager.popBackStack()
        }
    }

}