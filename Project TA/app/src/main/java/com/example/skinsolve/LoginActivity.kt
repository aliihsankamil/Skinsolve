package com.example.skinsolve

import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import com.example.skinsolve.databinding.ActivityLoginBinding
import com.example.skinsolve.model.ResponseLogin
import com.example.skinsolve.model.network.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class LoginActivity : AppCompatActivity(), View.OnClickListener {

    private var binding: ActivityLoginBinding? = null
    private var email: String = ""
    private var pass: String = ""
    private lateinit var profil: SharedPreferences

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_login)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding!!.root)

        profil = getSharedPreferences("login_session", MODE_PRIVATE)
        if (profil.getString("email", null) != null) {
            startActivity(Intent(this@LoginActivity, SkinSelectionActivity::class.java))
            finish()
        }

        binding!!.btnMasuk.setOnClickListener{
            email = binding!!.emailEditText.text.toString()
            pass = binding!!.passwordEditText.text.toString()

            when {
                email == "" -> {
                    binding!!.emailEditText.error = "Email is required"
                }
                pass == "" -> {
                    binding!!.passwordEditText.error = "Password is required"
                }
                else -> {
                    binding!!.loading.visibility = View.VISIBLE
                    getData()
                }
            }
        }

        val btnMoveActivity: TextView = findViewById(R.id.linkRegister)
        btnMoveActivity.setOnClickListener(this)
    }

    private fun getData () {
        val api = RetrofitClient.getInstance.login(email, pass)
        api.enqueue(object : Callback<ResponseLogin>{
            override fun onResponse(call: Call<ResponseLogin>, response: Response<ResponseLogin>) {
                if (response.isSuccessful) {
                    if (response.body()?.response == true) {

                        val userId = response.body()?.payload?.id ?: -1
                        Log.d("Login", "User ID yang disimpan: $userId")

                        getSharedPreferences("login_session", MODE_PRIVATE)
                            .edit()
                            .putInt("user_id", userId)
                            .putString("email", response.body()?.payload?.email)
                            .putString("nama", response.body()?.payload?.nama)
                            .putString("gambar_profil", response.body()?.payload?.gambar_profil)
                            .apply()

                        binding!!.loading.visibility = View.GONE
                        startActivity(Intent(this@LoginActivity, SkinSelectionActivity::class.java))
                        finish()
                    } else {
                        binding!!.loading.visibility = View.GONE
                        Toast.makeText(
                            this@LoginActivity,
                            "Login gagal, periksa kembali email dan password",
                            Toast.LENGTH_LONG
                        ).show()
                    }
                } else {
                    Toast.makeText(
                        this@LoginActivity,
                        "Login gagal, terjadi kesalahan",
                        Toast.LENGTH_LONG
                    ).show()
                }
            }

            override fun onFailure(call: Call<ResponseLogin>, t: Throwable) {
                Log.e("Pesan error", "${t.message}")
            }

        })
    }

    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.linkRegister -> {
                val moveIntent = Intent(this@LoginActivity, RegisterActivity::class.java)
                startActivity(moveIntent)
            }
        }
    }
}