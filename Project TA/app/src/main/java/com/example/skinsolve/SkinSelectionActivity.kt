package com.example.skinsolve

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.RadioGroup
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.skinsolve.databinding.ActivitySkinSelectionBinding
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class SkinSelectionActivity : AppCompatActivity() {

    private var binding : ActivitySkinSelectionBinding? = null
    private lateinit var profil : SharedPreferences
    private var selectedSkinTypeId: Int? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySkinSelectionBinding.inflate(layoutInflater)
        setContentView(R.layout.activity_skin_selection)

        profil = getSharedPreferences("login_session", MODE_PRIVATE)

        // Ambil ID jenis kulit yang dipilih oleh pengguna (misalnya dari dropdown atau radio button)
        val radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        radioGroup.setOnCheckedChangeListener { group, checkedId ->
            selectedSkinTypeId = when (checkedId) {
                R.id.rbDry -> 1
                R.id.rbOily -> 2
                R.id.rbNormal -> 3
                R.id.rbCombination -> 4
                R.id.rbSensitive -> 5
                else -> null
            }
        }

        val btnLanjut = findViewById<Button>(R.id.btnNext)
        // Set listener untuk tombol submit
        btnLanjut.setOnClickListener {
            // Debug log
            val selectId = selectedSkinTypeId
            Log.d("SkinSelectionActivity", "Select Skin ID: $selectId")
            saveSkinType()
        }
    }

    private fun saveSkinType() {
        val sharedPref = getSharedPreferences("login_session", MODE_PRIVATE)
        val userId = sharedPref.getInt("user_id", -1) // Ambil user_id sebagai Int

        // Debug log
        Log.d("SkinSelectionActivity", "User ID: $userId")

        if (userId != -1) {
            val call = RetrofitClient.apiService.updateSkinType(userId, selectedSkinTypeId!!)

            call.enqueue(object : Callback<ApiService.ApiResponse> {
                override fun onResponse(call: Call<ApiService.ApiResponse>, response: Response<ApiService.ApiResponse>) {
                    if (response.isSuccessful) {
                        val selectResponse = response.body()
                        if (response.body()?.response == true) {
                            Toast.makeText(this@SkinSelectionActivity, selectResponse?.message, Toast.LENGTH_SHORT).show()
                            val sharedPreferences = getSharedPreferences("login_session", Context.MODE_PRIVATE)
                            sharedPreferences.getBoolean("hasSelectedSkinType", true)
                            val intent = Intent(this@SkinSelectionActivity, MainActivity::class.java)
                            startActivity(intent)
                            finish()
                        } else {
                            Toast.makeText(this@SkinSelectionActivity, selectResponse?.message, Toast.LENGTH_SHORT).show()
                        }
                    } else {
                        Toast.makeText(this@SkinSelectionActivity, "Failed to select skin type", Toast.LENGTH_SHORT).show()
                    }
                }

                override fun onFailure(call: Call<ApiService.ApiResponse>, t: Throwable) {
                    Toast.makeText(this@SkinSelectionActivity, "Error: ${t.message}", Toast.LENGTH_SHORT).show()
                }
            })
        } else {
            Toast.makeText(this, "User ID not found", Toast.LENGTH_SHORT).show()
        }
    }

}