package com.lab.sqlite;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class ResetPassword extends AppCompatActivity {

    EditText email, pass1, pass2;
    Button changep;
    DBHandler dbhadler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reset_password);

        email = (EditText) findViewById(R.id.email);
        pass1 = (EditText) findViewById(R.id.change_password1);
        pass2 = (EditText) findViewById(R.id.change_password2);

        changep = (Button) findViewById(R.id.change_button);
        dbhadler = new DBHandler(ResetPassword.this);

        changep.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String eid = email.getText().toString();
                String p1 = pass1.getText().toString();
                String p2 = pass2.getText().toString();

                if (p1.equals(p2)) {
                    dbhadler.ChangePassword(eid, p1);
                    Toast.makeText(ResetPassword.this, "Password has been changed", Toast.LENGTH_SHORT).show();
                    Intent i = new Intent(getApplicationContext(), MainActivity.class);
                    startActivity(i);
                } else {
                    Toast.makeText(ResetPassword.this, "Incorrect Credentials", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}