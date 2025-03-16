package com.lab.sharedpreferences;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText et_name = (EditText) findViewById(R.id.name);
        EditText et_email = (EditText) findViewById(R.id.email);
        EditText et_pass = (EditText) findViewById(R.id.password);

        Button reg = (Button) findViewById(R.id.register);

        SharedPreferences pref = getSharedPreferences("Registration", 0);
        SharedPreferences.Editor editor = pref.edit();

        reg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = et_name.getText().toString();
                String email = et_email.getText().toString();
                String pass = et_pass.getText().toString();

                if (name.length() <= 0) {
                    Toast.makeText(MainActivity.this, "Enter name", Toast.LENGTH_SHORT).show();
                }
                if (email.length() <= 0) {
                    Toast.makeText(MainActivity.this, "Enter email", Toast.LENGTH_SHORT).show();
                    ;
                }
                if (pass.length() <= 0) {
                    Toast.makeText(MainActivity.this, "Enter passsword", Toast.LENGTH_SHORT).show();
                } else {
                    editor.putString("Name", name);
                    editor.putString("Email", email);
                    editor.putString("Password", pass);
                    editor.commit();

                    Intent ob = new Intent(MainActivity.this, MainActivity2.class);
                    startActivity(ob);
                }
            }
        });
    }
}