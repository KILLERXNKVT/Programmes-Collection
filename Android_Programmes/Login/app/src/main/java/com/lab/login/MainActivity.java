package com.lab.login;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    EditText EmailId, Password;
    TextView SignupLink;
    Button Login;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EmailId = findViewById(R.id.EmailId);
        Password = findViewById(R.id.Password);
        Login = findViewById(R.id.Login);
        SignupLink = findViewById(R.id.SignupLink);

        Login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String e = EmailId.getText().toString();
                String p = Password.getText().toString();

                Intent intent = new Intent(getApplicationContext(), Home.class);
                intent.putExtra("Email", e);
                intent.putExtra("Pass", p);
                startActivity(intent);

            }
        });

        SignupLink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent signup = new Intent(MainActivity.this, Register.class);
                startActivity(signup);
            }
        });
    }
}