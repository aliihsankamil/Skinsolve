package com.example.skinsolve
import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Food(
    val nama: String,
    val nutrisi: String,
    val manfaat: String,
    val gambar: String
) : Parcelable
