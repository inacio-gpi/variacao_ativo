package com.example.variacao_ativo;
import android.os.Bundle;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class HomeFlutterActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // carregue a rota do Flutter que deseja abrir
        String route = "/active-variation";
        FlutterEngine flutterEngine = getFlutterEngine();
        flutterEngine.getNavigationChannel().setInitialRoute(route);
    }
}