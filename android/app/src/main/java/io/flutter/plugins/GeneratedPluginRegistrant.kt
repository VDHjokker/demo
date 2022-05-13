package io.flutter.plugins

import androidx.annotation.Keep

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
object GeneratedPluginRegistrant {
    private const val TAG = "GeneratedPluginRegistrant"
    fun registerWith(@NonNull flutterEngine: FlutterEngine) {
        try {
            flutterEngine.getPlugins().add(AppLinksPlugin())
        } catch (e: Exception) {
            Log.e(TAG, "Error registering plugin app_links, com.llfbandit.app_links.AppLinksPlugin", e)
        }
        try {
            flutterEngine.getPlugins().add(UniLinksPlugin())
        } catch (e: Exception) {
            Log.e(TAG, "Error registering plugin uni_links, name.avioli.unilinks.UniLinksPlugin", e)
        }
        try {
            flutterEngine.getPlugins().add(UrlLauncherPlugin())
        } catch (e: Exception) {
            Log.e(TAG, "Error registering plugin url_launcher_android, io.flutter.plugins.urllauncher.UrlLauncherPlugin", e)
        }
    }
}