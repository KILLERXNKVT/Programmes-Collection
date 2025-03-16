package com.lab.sharedpreferences;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        TextView tv_name = (TextView) findViewById(R.id.second_text_name);
        TextView tv_email = (TextView) findViewById(R.id.second_text_email);
        TextView tv_pass = (TextView) findViewById(R.id.second_text_pass);

        SharedPreferences pref = getSharedPreferences("Registration", 0);

        String name = pref.getString("Name", null);
        String email = pref.getString("Email", null);
        String password = pref.getString("Password", null);

        tv_name.setText(name);
        tv_email.setText(email);
        tv_pass.setText(password);
    }
}