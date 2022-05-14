package com.example.deep_links

import android.content.Intent
import android.os.Bundle

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodCall

class MainActivity: FlutterActivity() {
    private val COLOR = "flutter.native/helper"
    private val CHANNEL = "flutter.native/channel"
    private val EVENTS = "flutter.native/events"

    private var startString: String = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // MethodChannel(flutterEngine.dartExecutor.binaryMessenger, COLOR).setMethodCallHandler {
        //     call, result ->
        //     when {
        //         call.method.equals("changeColor") -> {
        //                 changeColor(call, result)
        //         }
        //     }
        // }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            when {
                call.method.equals("initLink") -> {
                        val intent = getIntent();
                        var startString = intent.data?.toString();
                        result.success(startString);
                }
            }
        }
    }

   private fun changeColor(call: MethodCall, result: MethodChannel.Result) {
        var color = call.argument<String>("color");
        result.success(color);
    }
}
