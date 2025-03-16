package com.lab.sqlite;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    Button register, login;
    TextView forget;
    EditText email, passw;
    DBHandler dbhandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        email = (EditText) findViewById(R.id.emailid);
        passw = (EditText) findViewById(R.id.password);

        forget = (TextView) findViewById(R.id.forget_pass);
        register = (Button) findViewById(R.id.register);
        login = (Button) findViewById(R.id.login);
        dbhandler = new DBHandler(MainActivity.this);

        forget.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent f = new Intent(getApplicationContext(), ResetPassword.class);
                startActivity(f);
            }
        });

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent r = new Intent(getApplicationContext(), Registration.class);
                startActivity(r);
            }
        });

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String eid = email.getText().toString();
                String pass = passw.getText().toString();
                if (dbhandler.LoginCheck(eid, pass)) {

                    Intent d = new Intent(getApplicationContext(), Update_Delete.class);
                    d.putExtra("email", eid);
                    d.putExtra("password", pass);
                    startActivity(d);
                } else {
                    Toast.makeText(MainActivity.this, "Wrong Credentials!!!", Toast.LENGTH_SHORT).show();
                }

            }
        });
    }
}