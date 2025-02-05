package com.example.skinsolve

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.cardview.widget.CardView
import androidx.fragment.app.Fragment
import com.bumptech.glide.Glide
import com.bumptech.glide.load.engine.DiskCacheStrategy
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class ProfileFragment : Fragment(), View.OnClickListener {

    private lateinit var namaEditText: TextView
    private lateinit var emailEditText: TextView
    private lateinit var gambarImageView: ImageView

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_profile, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val btnProfile: CardView = view.findViewById(R.id.mnProfile)
        btnProfile.setOnClickListener(this)

        val btnLogout: CardView = view.findViewById(R.id.mnLogout)
        btnLogout.setOnClickListener {
            logout()
        }

        // Set data ke TextView dan ImageView
        namaEditText = view.findViewById(R.id.textView10)
        emailEditText = view.findViewById(R.id.tvEmail)
        gambarImageView = view.findViewById(R.id.imageView4)
    }

    override fun onResume() {
        super.onResume()
        loadUserProfile()
    }

    private fun loadUserProfile() {
        val sharedPreferences = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPreferences.getInt("user_id", -1)
        Log.d("ProfileFragment", "User ID: $userId")

        if (userId == -1) {
            Toast.makeText(requireContext(), "User ID not found", Toast.LENGTH_SHORT).show()
            return
        }

        val apiService = RetrofitClient.apiService
        val call = apiService.getProfile(userId)

        call.enqueue(object : Callback<ApiService.UserResponse> {
            override fun onResponse(call: Call<ApiService.UserResponse>, response: Response<ApiService.UserResponse>) {
                if (!isAdded) return // Jika fragment sudah tidak ter-attach, hentikan eksekusi

                if (response.isSuccessful) {
                    val userData = response.body()?.data
                    Log.d("API Response", userData.toString())

                    if (userData != null) {
                        namaEditText.text = userData.nama ?: "Nama tidak tersedia"
                        emailEditText.text = userData.email ?: "Email tidak tersedia"

                        Glide.with(requireContext())
                            .load(userData.gambar_profil ?: "")
                            .diskCacheStrategy(DiskCacheStrategy.ALL)
                            .placeholder(R.drawable.ic_launcher_background) // Tambahkan placeholder
                            .error(R.drawable.ic_lock) // Tambahkan gambar error
                            .into(gambarImageView)
                    } else {
                        Toast.makeText(requireContext(), "Data user tidak tersedia", Toast.LENGTH_SHORT).show()
                    }
                } else {
                    Toast.makeText(requireContext(), "Failed to load profile: ${response.message()}", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<ApiService.UserResponse>, t: Throwable) {
                if (isAdded) {
                    Toast.makeText(requireContext(), "Error: ${t.message}", Toast.LENGTH_SHORT).show()
                }
            }
        })
    }

    private fun logout() {
        // Hapus data yang tersimpan di SharedPreferences
        val sharedPreferences = requireActivity().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val editor = sharedPreferences.edit()
        editor.clear() // Menghapus semua data yang tersimpan
        editor.apply() // Menyimpan perubahan

        // Navigasi kembali ke halaman login
        val intent = Intent(requireContext(), LoginActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        startActivity(intent)
        requireActivity().finish()
    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnProfile) {
            val profileDataFragment = ProfileDataFragment()
            parentFragmentManager.beginTransaction().apply {
                replace(R.id.container, profileDataFragment, ProfileDataFragment::class.java.simpleName)
                addToBackStack(null)
                commit()
            }
        }
    }
}
