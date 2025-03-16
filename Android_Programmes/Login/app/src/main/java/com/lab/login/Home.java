package com.lab.login;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class Home extends AppCompatActivity {

    TextView Email, Pass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        Email = findViewById(R.id.Email);
        Pass = findViewById(R.id.Pass);

        Intent i = getIntent();

        String e = i.getStringExtra("Email");
        String p = i.getStringExtra("Pass");

        Email.setText(e);
        Pass.setText(p);
    }
}