package uz.udevs.udevs_phone_number


import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** UdevsPhoneNumberPlugin */
class UdevsPhoneNumberPlugin : FlutterPlugin, ActivityAware, MethodCallHandler {

    private val MY_PERMISSIONS_REQUEST_READ_PHONE_STATE: Int = 0
    private lateinit var channel: MethodChannel
    private var mAppContext: Context? = null
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this.mAppContext = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "udevs_phone_number")
        channel.setMethodCallHandler(this)
    }

    @SuppressLint("HardwareIds")
    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "hasPhonePermission") {
            result.success(hasPhonePermission())
        } else if (call.method == "requestPhonePermission") {
            result.success(requestPhonePermission())
        } else if (call.method == "getPhoneNumber") {
            if (hasPhonePermission()) {
                val mPhoneNumber =
                    (activity!!.getSystemService(Context.TELEPHONY_SERVICE) as android.telephony.TelephonyManager).line1Number
                result.success(mPhoneNumber)
            } else {
                result.success(null)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    override fun onDetachedFromActivity() {
    }

    private fun hasPhonePermission(): Boolean {
        return if (Build.VERSION.SDK_INT > Build.VERSION_CODES.Q) {
            ContextCompat.checkSelfPermission(
                mAppContext!!,
                Manifest.permission.READ_PHONE_NUMBERS
            ) == PackageManager.PERMISSION_GRANTED
        } else {
            ContextCompat.checkSelfPermission(
                mAppContext!!,
                Manifest.permission.READ_PHONE_STATE
            ) == PackageManager.PERMISSION_GRANTED
        }
    }

    private fun requestPhonePermission() {
        if (Build.VERSION.SDK_INT > Build.VERSION_CODES.Q) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(
                    activity!!,
                    Manifest.permission.READ_PHONE_NUMBERS
                )
            ) {
                // Show an explanation to the user *asynchronously* -- don't block
                // this thread waiting for the user's response! After the user
                // sees the explanation, try again to request the permission.
            } else {
                ActivityCompat.requestPermissions(
                    activity!!,
                    arrayOf(Manifest.permission.READ_PHONE_NUMBERS),
                    MY_PERMISSIONS_REQUEST_READ_PHONE_STATE
                )
            }
        } else {
            if (ActivityCompat.shouldShowRequestPermissionRationale(
                    activity!!,
                    Manifest.permission.READ_PHONE_STATE
                )
            ) {
            } else {
                ActivityCompat.requestPermissions(
                    activity!!,
                    arrayOf(Manifest.permission.READ_PHONE_STATE),
                    MY_PERMISSIONS_REQUEST_READ_PHONE_STATE
                )
            }
        }
    }
}
