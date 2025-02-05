package com.example.skinsolve

import android.app.Activity
import android.app.DatePickerDialog
import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.os.Environment
import android.os.FileUtils
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.Spinner
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.fragment.app.Fragment
import com.bumptech.glide.Glide
import com.bumptech.glide.load.engine.DiskCacheStrategy
import com.example.skinsolve.model.network.ApiService
import com.example.skinsolve.model.network.RetrofitClient
import com.google.android.material.textfield.TextInputEditText
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.RequestBody.Companion.asRequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream
import java.io.OutputStream
import java.util.Calendar

class ProfileDataFragment : Fragment(), View.OnClickListener {

    private lateinit var namaEditText: EditText
    private lateinit var emailEditText: EditText
    private lateinit var dobEditText: EditText
    private lateinit var spinnerGender: Spinner
    private lateinit var gambarImageView: ImageView
    private lateinit var btnUbahFoto: Button

    private var selectedImageUri: Uri? = null

    object FileUtils {
        fun getFileFromUri(context: Context, uri: Uri): File? {
            val contentResolver: ContentResolver = context.contentResolver
            val fileName = getFileNameFromUri(contentResolver, uri)

            // Buat file di direktori sementara
            val tempFile = File(context.getExternalFilesDir(Environment.DIRECTORY_PICTURES), fileName)

            try {
                val inputStream: InputStream? = contentResolver.openInputStream(uri)
                val outputStream: OutputStream = FileOutputStream(tempFile)

                val buffer = ByteArray(1024)
                var length: Int

                while (inputStream?.read(buffer).also { length = it ?: -1 } != -1) {
                    outputStream.write(buffer, 0, length)
                }

                outputStream.close()
                inputStream?.close()

                return tempFile
            } catch (e: Exception) {
                e.printStackTrace()
            }

            return null
        }

        private fun getFileNameFromUri(contentResolver: ContentResolver, uri: Uri): String {
            var fileName = "temp_file"
            contentResolver.query(uri, null, null, null, null)?.use { cursor ->
                val nameIndex = cursor.getColumnIndexOrThrow("_display_name")
                cursor.moveToFirst()
                fileName = cursor.getString(nameIndex)
            }
            return fileName
        }
    }

    // ActivityResultLauncher for selecting image from gallery
    private val galleryLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK && result.data != null) {
            selectedImageUri = result.data?.data
            // Display selected image in ImageView
            gambarImageView.setImageURI(selectedImageUri)
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_profile_data, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val mnBack: ImageView = view.findViewById(R.id.mnBack)
        mnBack.setOnClickListener(this)
        spinnerGender = view.findViewById(R.id.spinnerGender)
        namaEditText = view.findViewById(R.id.namaEditText)
        emailEditText = view.findViewById(R.id.emailEditText)
        dobEditText = view.findViewById(R.id.dobEditText)
        gambarImageView = view.findViewById(R.id.imgProfile)
        btnUbahFoto = view.findViewById(R.id.btnUbahFoto)

        btnUbahFoto.setOnClickListener {
            // Open gallery to select image
            val intent = Intent(Intent.ACTION_PICK)
            intent.type = "image/*"
            galleryLauncher.launch(intent)
        }

        // Set up gender options
        val genderOptions = arrayOf("Laki-laki", "Perempuan")
        val adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_item, genderOptions)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinnerGender.adapter = adapter

        // Date picker for date of birth
        dobEditText.setOnClickListener {
            val calendar = Calendar.getInstance()
            val year = calendar.get(Calendar.YEAR)
            val month = calendar.get(Calendar.MONTH)
            val day = calendar.get(Calendar.DAY_OF_MONTH)

            val datePickerDialog = DatePickerDialog(requireContext(), { _, selectedYear, selectedMonth, selectedDay ->
                val selectedDate = "$selectedYear-${selectedMonth + 1}-$selectedDay"
                dobEditText.setText(selectedDate)
            }, year, month, day)

            datePickerDialog.show()
        }

        // Load user profile data
        loadUserProfile()

        val btnDaftar: Button = view.findViewById(R.id.btnDaftar)
        btnDaftar.setOnClickListener {
            updateProfile()
        }
    }

    private fun loadUserProfile() {
        val sharedPreferences = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPreferences.getInt("user_id", -1)

        if (userId == -1) {
            Toast.makeText(requireContext(), "User ID not found", Toast.LENGTH_SHORT).show()
            return
        }

        val apiService = RetrofitClient.apiService
        val call = apiService.getProfile(userId)

        call.enqueue(object : Callback<ApiService.UserResponse> {
            override fun onResponse(call: Call<ApiService.UserResponse>, response: Response<ApiService.UserResponse>) {
                if (!isAdded) return // Hentikan eksekusi jika fragment tidak ter-attach

                if (response.isSuccessful) {
                    val userData = response.body()?.data

                    if (userData != null) {
                        namaEditText.setText(userData.nama ?: "Nama tidak tersedia")
                        emailEditText.setText(userData.email ?: "Email tidak tersedia")
                        dobEditText.setText(userData.tanggal_lahir ?: "Tanggal lahir tidak tersedia")

                        if (userData.jenis_kelamin == "Laki-laki") {
                            spinnerGender.setSelection(0)
                        } else if (userData.jenis_kelamin == "Perempuan") {
                            spinnerGender.setSelection(1)
                        }

                        Glide.with(requireContext())
                            .load(userData.gambar_profil ?: "")
                            .diskCacheStrategy(DiskCacheStrategy.ALL)
                            .into(gambarImageView)
                    } else {
                        Toast.makeText(requireContext(), "Data user tidak tersedia", Toast.LENGTH_SHORT).show()
                    }
                } else {
                    Toast.makeText(requireContext(), "Failed to load profile", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<ApiService.UserResponse>, t: Throwable) {
                if (isAdded) { // Periksa apakah fragment masih ter-attach
                    Toast.makeText(requireContext(), "Error: ${t.message}", Toast.LENGTH_SHORT).show()
                } else {
                    Log.e("ProfileDataFragment", "Fragment not attached to context")
                }
            }

        })

    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnBack) {
            parentFragmentManager.popBackStack()
        }
    }

    private fun updateProfile() {
        val nama = namaEditText.text.toString()
        val email = emailEditText.text.toString()
        val dob = dobEditText.text.toString()
        val gender = spinnerGender.selectedItem.toString()

        val sharedPreferences = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPreferences.getInt("user_id", -1)

        if (userId == -1) {
            Toast.makeText(requireContext(), "User ID not found", Toast.LENGTH_SHORT).show()
            return
        }

        val apiService = RetrofitClient.apiService

        // Convert parameters to RequestBody
        val idPart = userId.toString().toRequestBody("text/plain".toMediaTypeOrNull())
        val namaPart = nama.toRequestBody("text/plain".toMediaTypeOrNull())
        val emailPart = email.toRequestBody("text/plain".toMediaTypeOrNull())
        val genderPart = gender.toRequestBody("text/plain".toMediaTypeOrNull())
        val dobPart = dob.toRequestBody("text/plain".toMediaTypeOrNull())

        // Prepare file upload if image selected
        val imagePart = selectedImageUri?.let { uri ->
            val file = FileUtils.getFileFromUri(requireContext(), uri)
            val requestFile = file?.asRequestBody("image/*".toMediaTypeOrNull())
            MultipartBody.Part.createFormData("gambar_profil", file?.name, requestFile!!)
        }

        val call = apiService.updateProfileWithImage(idPart, namaPart, emailPart, genderPart, dobPart, imagePart)

        call.enqueue(object : Callback<ResponseBody> {
            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    Toast.makeText(requireContext(), "Profile updated successfully", Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(requireContext(), "Failed to update profile", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                Toast.makeText(requireContext(), "Error: ${t.message}", Toast.LENGTH_SHORT).show()
            }
        })
    }


}
