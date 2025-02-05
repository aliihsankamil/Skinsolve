package com.example.skinsolve

import android.content.Context
import android.net.Uri
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.FileProvider
import com.example.skinsolve.model.network.RetrofitClient
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
import java.io.IOException

class ProductTrackerFragment : Fragment(), View.OnClickListener {
    private lateinit var ivPicture: ImageView
    private lateinit var btnAddFoto: Button
    private lateinit var photoFile: File
    private val photoUri: Uri
        get() = FileProvider.getUriForFile(requireContext(), "${requireContext().packageName}.fileprovider", photoFile)

    private val takePicture = registerForActivityResult(ActivityResultContracts.TakePicture()) { isSuccess ->
        if (isSuccess) {
            ivPicture.setImageURI(photoUri)
            uploadImage(photoUri)
        } else {
            Toast.makeText(requireContext(), "Gagal mengambil gambar", Toast.LENGTH_SHORT).show()
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_product_tracker, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val mnBack: ImageView = view.findViewById(R.id.mnBack)
        mnBack.setOnClickListener(this)

        // Ambil user ID dari SharedPreferences
        val sharedPref = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPref.getInt("user_id", -1)

        // Bind views
        ivPicture = view.findViewById(R.id.ivPicture)
        btnAddFoto = view.findViewById(R.id.btnAddPhoto)

        // Set click listener for the button to take a picture
        btnAddFoto.setOnClickListener {
            // Create a file to save the image
            try {
                photoFile = createImageFile()
                takePicture.launch(photoUri)
            } catch (ex: IOException) {
                ex.printStackTrace()
                Toast.makeText(requireContext(), "Gagal membuat file gambar", Toast.LENGTH_SHORT).show()
            }
        }
    }

    // Method to create a file for the image
    @Throws(IOException::class)
    private fun createImageFile(): File {
        val timestamp = System.currentTimeMillis()
        val fileName = "JPEG_$timestamp.jpg"
        val storageDir = requireContext().getExternalFilesDir(null)
        return File.createTempFile(fileName, ".jpg", storageDir).apply {
            // Save a file: path for use with ACTION_VIEW intents
            currentPhotoPath = absolutePath
        }
    }

    // Method to upload the image
    private fun uploadImage(imageUri: Uri) {
        val file = convertUriToFile(imageUri)

        // Buat RequestBody untuk gambar
        val requestBody = file.asRequestBody("image/*".toMediaTypeOrNull())
        val multipartBody = MultipartBody.Part.createFormData("gambar_wajah", file.name, requestBody)

        // Buat RequestBody untuk id_user
        val sharedPref = requireContext().getSharedPreferences("login_session", Context.MODE_PRIVATE)
        val userId = sharedPref.getInt("user_id", -1)
        val userIdBody = userId.toString().toRequestBody("text/plain".toMediaTypeOrNull())

        // Panggil API untuk upload gambar dan simpan data
        RetrofitClient.apiService.uploadImageProduk(multipartBody, userId).enqueue(object :
            Callback<ResponseBody> {
            override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                if (response.isSuccessful) {
                    val responseBody = response.body()?.string()
                    Log.d("Upload Response", "Response: $responseBody")
                    Toast.makeText(requireContext(), "Gambar berhasil diupload dan data tersimpan", Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(requireContext(), "Gagal menyimpan data ke database", Toast.LENGTH_SHORT).show()
                    Log.d("Upload Error", "Response Error: ${response.errorBody()?.string()}")
                }
            }

            override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                Toast.makeText(requireContext(), "Error: ${t.message}", Toast.LENGTH_SHORT).show()
                Log.e("Upload Failure", "Error: ${t.message}")
            }
        })
    }

    override fun onClick(v: View?) {
        if (v?.id == R.id.mnBack) {
            parentFragmentManager.popBackStack()
        }
    }

    // Method to convert Uri to File
    private fun convertUriToFile(uri: Uri): File {
        val inputStream = requireContext().contentResolver.openInputStream(uri)
        val timestamp = System.currentTimeMillis()
        val fileName = "JPEG_$timestamp.jpg"
        val file = File(requireContext().cacheDir, fileName)
        FileOutputStream(file).use { outputStream ->
            inputStream?.copyTo(outputStream)
        }
        return file
    }

    companion object {
        private var currentPhotoPath: String? = null
    }
}