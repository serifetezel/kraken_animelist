package com.example.kraken_animelist

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/anime"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
             if (call.method == "fetchAnimeList") {
              val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
              channel.invokeMethod("fetchAnimeList", "")     
              result.success("method called")
            } else {
                result.notImplemented()
            }
        }
    }
}
