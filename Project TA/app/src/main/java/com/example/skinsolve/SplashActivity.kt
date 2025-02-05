package com.example.skinsolve

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class SplashActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_splash)

        val sharedPreferences = getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val hasSeenWelcome = sharedPreferences.getBoolean("hasSeenWelcome", false)
        val hasSelectedSkinType = sharedPreferences.getBoolean("hasSelectedSkinType", false)

        Handler().postDelayed({
            val intent = when {
                !hasSeenWelcome -> Intent(this, WelcomeActivity::class.java)
                !hasSelectedSkinType -> Intent(this, SkinSelectionActivity::class.java)
                else -> Intent(this, MainActivity::class.java)
            }
            startActivity(intent)
            finish()
        }, 3000)


//        Handler().postDelayed({
//            val intent = Intent(this, WelcomeActivity::class.java)
//            startActivity(intent)
//        }, 3000)
    }
}