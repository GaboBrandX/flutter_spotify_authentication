package com.gabrielmoreyra.flutter_spotify_authentication

import android.app.Activity
import android.content.Intent
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

import com.spotify.sdk.android.authentication.AuthenticationClient
import com.spotify.sdk.android.authentication.AuthenticationRequest
import com.spotify.sdk.android.authentication.AuthenticationResponse
import io.flutter.plugin.common.PluginRegistry

class FlutterSpotifyAuthenticationPlugin(private val activity: Activity): MethodChannel.MethodCallHandler, PluginRegistry.ActivityResultListener {
  private var channelResult: Result? = null
  private val requestCode = 1914
  private val redirectUri = "testschema://callback"

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_spotify_authentication")
      if (registrar.activity() != null) {
        val plugin = FlutterSpotifyAuthenticationPlugin(registrar.activity())
        channel.setMethodCallHandler(plugin)
        registrar.addActivityResultListener(plugin)
      }
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "connectToSpotify") {
      channelResult = result
      val clientId = call.argument<String>("spotifyClientId")
      val scopes: ArrayList<String> = call.argument<ArrayList<String>>("scopes")!!
      val scopesArray = arrayOfNulls<String>(scopes.size)
      scopes.toArray(scopesArray)

      val builder = AuthenticationRequest.Builder(clientId, AuthenticationResponse.Type.TOKEN, redirectUri)

      builder.setScopes(scopesArray)
      val request = builder.build()

      AuthenticationClient.openLoginActivity(activity, requestCode, request)
    } else {
      result.notImplemented()
    }
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (requestCode == requestCode){
      val response = AuthenticationClient.getResponse(resultCode, data)
      when (response.type) {
        AuthenticationResponse.Type.TOKEN -> channelResult?.success(response.accessToken)
        AuthenticationResponse.Type.ERROR -> channelResult?.success(response.error)
        AuthenticationResponse.Type.CODE -> channelResult?.success("code")
        AuthenticationResponse.Type.EMPTY -> channelResult?.success("empty")
        AuthenticationResponse.Type.UNKNOWN -> channelResult?.success("unknown")
        else -> channelResult?.success("es null")
      }
      return true
    }
    return false
  }
}
