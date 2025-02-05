package com.example.skinsolve

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Product(
    val nama: String,
    val brand: String,
    val tipe: String,
    val komposisi: String,
    val gambar: String,
) : Parcelable