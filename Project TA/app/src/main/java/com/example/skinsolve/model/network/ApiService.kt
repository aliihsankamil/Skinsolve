package com.example.skinsolve.model.network

import com.example.skinsolve.Food
import com.example.skinsolve.Product
import com.example.skinsolve.model.RegisterResponse
import com.example.skinsolve.model.SearchResult
import okhttp3.MultipartBody
import okhttp3.RequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.GET
import retrofit2.http.Multipart
import retrofit2.http.POST
import retrofit2.http.Part
import retrofit2.http.Query

interface ApiService {

    // Fungsi untuk register user
    @FormUrlEncoded
    @POST("api-skinsolve/register.php")
    fun registerUser(
        @Field("nama") name: String,
        @Field("email") email: String,
        @Field("password") password: String
    ): Call<RegisterResponse>

    // Fungsi untuk update jenis kulit
    @FormUrlEncoded
    @POST("api-skinsolve/select_skin_type.php")
    fun updateSkinType(
        @Field("user_id") userId: Int,
        @Field("skin_type_id") skinType: Int
    ): Call<ApiResponse>

    @FormUrlEncoded
    @POST("api-skinsolve/get_food_recommendations.php")
    fun getFoodRecommendations(
        @Field("user_id") userId: Int
    ): Call<List<Food>>

    @FormUrlEncoded
    @POST("api-skinsolve/get_product_recommendations.php")
    fun getProductRecommendations(
        @Field("user_id") userId: Int
    ): Call<List<Product>>

    @FormUrlEncoded
    @POST("api-skinsolve/search.php")
    fun search(
        @Field("query") query: String
    ): Call<List<SearchResult>>

    @Multipart
    @POST("api-skinsolve/upload.php")
    fun uploadImage(
        @Part gambar_makanan: MultipartBody.Part,
        @Part("id_user") idUser: Int
    ): Call<ResponseBody>

    @Multipart
    @POST("api-skinsolve/uploadProduk.php")
    fun uploadImageProduk(
        @Part gambar_wajah: MultipartBody.Part,
        @Part("id_user") idUser: Int
    ): Call<ResponseBody>

    @Multipart
    @POST("api-skinsolve/update_profile.php")
    fun updateProfileWithImage(
        @Part("id") id: RequestBody,
        @Part("nama") nama: RequestBody,
        @Part("email") email: RequestBody,
        @Part("jenis_kelamin") jenis_kelamin: RequestBody,
        @Part("tanggal_lahir") tanggal_lahir: RequestBody,
        @Part gambar_profil: MultipartBody.Part?
    ): Call<ResponseBody>

    @GET("api-skinsolve/get_profile.php")
    fun getProfile(
        @Query("user_id") userId: Int
    ): Call<UserResponse>

    @FormUrlEncoded
    @POST("api-skinsolve/tracking.php")
    fun getTrackingProgress(
        @Field("id_user") id_user: Int
    ): Call<ProgressResponse>

    data class ApiResponse(val response: Boolean, val message: String)

    data class UserResponse(
        val status: String,
        val data: UserData
    )

    data class UserData(
        val nama: String,
        val email: String,
        val jenis_kelamin: String,
        val tanggal_lahir: String,
        val gambar_profil: String
    )

    data class ProgressResponse(
        val status: String,
        val data: List<ProgressData>
    )

    data class ProgressData(
        val tanggal: String,
        val skin_progress: List<SkinProgress>,
        val food_progress: List<FoodProgress>
    )

    data class SkinProgress(
        val id: Int,
        val gambar_wajah: String,
        val tanggal_upload: String,
        val id_user: Int,
    )

    data class FoodProgress(
        val id: Int,
        val gambar_makanan: String,
        val tanggal_upload: String,
        val id_user: Int,
    )

}