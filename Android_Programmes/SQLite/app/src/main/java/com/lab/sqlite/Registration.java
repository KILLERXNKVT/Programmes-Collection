package com.lab.sqlite;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class Registration extends AppCompatActivity {

    EditText name, remail, pass1, pass2, rphone;
    Button clear, reg;
    DBHandler dbhandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);

        name = (EditText) findViewById(R.id.name);
        remail = (EditText) findViewById(R.id.email);
        rphone = (EditText) findViewById(R.id.phone);
        pass1 = (EditText) findViewById(R.id.password1);
        pass2 = (EditText) findViewById(R.id.password2);

        clear = (Button) findViewById(R.id.clear);
        reg = (Button) findViewById(R.id.reg_button);

        dbhandler = new DBHandler(Registration.this);

        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(), "All are cleared", Toast.LENGTH_SHORT).show();
                name.setText("");
                remail.setText("");
                rphone.setText("");
                pass1.setText("");
                pass2.setText("");
            }
        });

        reg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String nme = name.getText().toString();
                String eid = remail.getText().toString();
                String phn = rphone.getText().toString();
                String p1 = pass1.getText().toString();
                String p2 = pass2.getText().toString();

                if (nme.isEmpty() || eid.isEmpty() || phn.isEmpty() || p1.isEmpty() || p2.isEmpty()) {
                    Toast.makeText(getApplicationContext(), "All fields are mandatory", Toast.LENGTH_SHORT).show();
                    return;
                } else if (!p1.equals(p2)) {
                    Toast.makeText(getApplicationContext(), "Passwords doesn't match", Toast.LENGTH_SHORT).show();
                    return;
                } else if (dbhandler.CheckUser(nme)) {
                    Toast.makeText(Registration.this, "User Already Exists", Toast.LENGTH_SHORT).show();
                } else {
                    dbhandler.addNewUser(nme, eid, phn, p1);
                    Toast.makeText(getApplicationContext(), "New User added", Toast.LENGTH_SHORT).show();
                    name.setText("");
                    remail.setText("");
                    rphone.setText("");
                    pass1.setText("");
                    pass2.setText("");
                    Intent i = new Intent(getApplicationContext(), MainActivity.class);
                    startActivity(i);
                }
            }
        });
    }
}