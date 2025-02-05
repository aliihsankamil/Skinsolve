package com.example.skinsolve

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity

class WelcomeActivity : AppCompatActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_welcome)

        val btnMoveActivity: Button = findViewById(R.id.btnMasuk)
        btnMoveActivity.setOnClickListener(this)
        val btnMoveActivity2: Button = findViewById(R.id.btnDaftar)
        btnMoveActivity2.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.btnMasuk -> {
                val moveIntent = Intent(this@WelcomeActivity, LoginActivity::class.java)
                startActivity(moveIntent)
                val sharedPreferences = getSharedPreferences("login_session", Context.MODE_PRIVATE)
                val editor = sharedPreferences.edit()
                editor.putBoolean("hasSeenWelcome", true)
                editor.apply()
            }
            R.id.btnDaftar -> {
                val moveIntent = Intent(this@WelcomeActivity, RegisterActivity::class.java)
                startActivity(moveIntent)
                val sharedPreferences = getSharedPreferences("login_session", Context.MODE_PRIVATE)
                val editor = sharedPreferences.edit()
                editor.putBoolean("hasSeenWelcome", true)
                editor.apply()
            }
        }
    }
}