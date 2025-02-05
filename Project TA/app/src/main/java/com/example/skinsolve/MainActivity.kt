package com.example.skinsolve

import android.content.SharedPreferences
import android.graphics.Rect
import android.os.Bundle
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.cardview.widget.CardView
import androidx.fragment.app.Fragment
import com.example.skinsolve.databinding.ActivityMainBinding
import com.google.android.material.bottomnavigation.BottomNavigationView

class MainActivity : AppCompatActivity() {

    lateinit var bottomNav : BottomNavigationView
    private var binding : ActivityMainBinding? = null
    private lateinit var profil : SharedPreferences

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        enableEdgeToEdge()
        setContentView(binding?.root)

        profil = getSharedPreferences("login_session", MODE_PRIVATE)

        loadFragment(HomeFragment())
        bottomNav = findViewById(R.id.bottom_nav) as BottomNavigationView
        bottomNav.setOnItemSelectedListener {
            when (it.itemId) {
                R.id.item_home -> {
                    loadFragment(HomeFragment())
                }
                R.id.item_search -> {
                    loadFragment(SearchFragment())
                }
                R.id.item_track -> {
                    loadFragment(TrackingFragment())
                }
                R.id.item_profile -> {
                    loadFragment(ProfileFragment())
                }
            }
            true
        }

        val rootView = findViewById<View>(R.id.main)
        rootView.viewTreeObserver.addOnGlobalLayoutListener {
            val rect = Rect()
            rootView.getWindowVisibleDisplayFrame(rect)
            val screenHeight = rootView.height

            val keypadHeight = screenHeight - rect.bottom
            if (keypadHeight > screenHeight * 0.15) {
                // keyboard is open
                findViewById<BottomNavigationView>(R.id.bottom_nav).visibility = View.GONE
            } else {
                // keyboard is closed
                findViewById<BottomNavigationView>(R.id.bottom_nav).visibility = View.VISIBLE
            }
        }
    }

    private  fun loadFragment(fragment: Fragment){
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.container,fragment)
        transaction.commit()
    }
}