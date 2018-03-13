package io.graydragon.projectlazer;

import android.Manifest;
import android.annotation.TargetApi;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    requestPermission(Manifest.permission.ACCESS_FINE_LOCATION, 1);
    GeneratedPluginRegistrant.registerWith(this);
  }
  @TargetApi(Build.VERSION_CODES.M)
  boolean requestPermission(final String permission, final int requestCode) {
    if (this.checkSelfPermission(permission) != PackageManager.PERMISSION_GRANTED) {
        this.requestPermissions(new String[]{permission}, requestCode);
        return true;
    }

    return false;
  }
}
